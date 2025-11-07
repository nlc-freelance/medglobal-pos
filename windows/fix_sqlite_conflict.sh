#!/bin/bash
# Bash script to fix sqlite3 target conflict between amplify_db_common and sqlcipher_flutter_libs
# Run this after 'flutter pub get' and before building on Windows
#
# Strategy: Completely disable sqlite3 building in amplify_db_common by commenting out
#           the entire sqlite3 target definition, allowing sqlcipher_flutter_libs to
#           provide the encrypted sqlite3 library that both plugins will use.
#
# Usage: ./windows/fix_sqlite_conflict.sh [--force] [--verbose]
#   --force   : Re-patch even if already patched
#   --verbose : Show detailed output

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Parse arguments
FORCE_PATCH=false
VERBOSE=false

for arg in "$@"; do
    case $arg in
        --force)
            FORCE_PATCH=true
            ;;
        --verbose)
            VERBOSE=true
            ;;
    esac
done

echo -e "\n${CYAN}========================================"
echo -e "SQLite Conflict Patcher for SQLCipher"
echo -e "========================================${NC}\n"

# Path to amplify_db_common CMakeLists.txt
AMPLIFY_PATH="windows/flutter/ephemeral/.plugin_symlinks/amplify_db_common/windows/CMakeLists.txt"

echo -e "${YELLOW}Checking for amplify_db_common CMakeLists.txt...${NC}"

if [ ! -f "$AMPLIFY_PATH" ]; then
    echo -e "\n${RED}[ERROR] File not found: $AMPLIFY_PATH${NC}"
    echo -e "\n${YELLOW}Please run 'flutter pub get' first to generate plugin files.${NC}\n"
    exit 1
fi

echo -e "${GREEN}[OK] Found: $AMPLIFY_PATH${NC}\n"

# Check if already patched
if grep -q "# PATCHED FOR SQLCIPHER" "$AMPLIFY_PATH"; then
    if [ "$FORCE_PATCH" = false ]; then
        echo -e "${CYAN}[SKIP] amplify_db_common already patched for SQLCipher.${NC}"
        echo -e "${YELLOW}Use --force to re-patch anyway.${NC}\n"
        exit 0
    else
        echo -e "${YELLOW}[FORCE] Re-patching even though already patched...${NC}"
        # Restore from backup if it exists
        if [ -f "${AMPLIFY_PATH}.backup" ]; then
            echo -e "${YELLOW}Restoring from backup...${NC}"
            cp "${AMPLIFY_PATH}.backup" "$AMPLIFY_PATH"
        fi
    fi
fi

echo -e "${YELLOW}Analyzing CMakeLists.txt structure...${NC}"

# Create backup
cp "$AMPLIFY_PATH" "${AMPLIFY_PATH}.backup"
echo -e "${GREEN}[OK] Created backup: ${AMPLIFY_PATH}.backup${NC}"

# Read the file into an array
mapfile -t lines < "$AMPLIFY_PATH"

# Find all lines related to sqlite3
# We need to comment out:
# 1. add_library(sqlite3 ...)
# 2. All target_* commands that reference sqlite3
# 3. set_target_properties(sqlite3 ...)
# 4. Any other commands that configure sqlite3

declare -a sqlite3_lines=()
in_sqlite3_block=false
paren_count=0
start_line=-1

for i in "${!lines[@]}"; do
    line="${lines[$i]}"

    # Check if this line starts the sqlite3 definition
    if [[ "$line" =~ ^[[:space:]]*add_library[[:space:]]*\([[:space:]]*sqlite3 ]]; then
        in_sqlite3_block=true
        start_line=$i
        paren_count=0
    fi

    # If we're in the sqlite3 block, count parentheses
    if [ "$in_sqlite3_block" = true ]; then
        # Count opening and closing parens in this line
        opens=$(echo "$line" | tr -cd '(' | wc -c)
        closes=$(echo "$line" | tr -cd ')' | wc -c)
        paren_count=$((paren_count + opens - closes))

        sqlite3_lines+=($i)

        # If parentheses are balanced, we've found the end of add_library
        if [ $paren_count -eq 0 ]; then
            in_sqlite3_block=false
            # Don't break yet - keep looking for target_* commands
        fi
    # Also find any target_* or set_target_properties commands for sqlite3
    elif [[ "$line" =~ ^[[:space:]]*(target_include_directories|target_compile_options|target_compile_definitions|target_link_libraries|set_target_properties)[[:space:]]*\([[:space:]]*sqlite3 ]]; then
        # This is a configuration command for sqlite3 - comment it out too
        sqlite3_lines+=($i)

        # Track the complete command (might be multi-line)
        paren_count=$(echo "$line" | tr -cd '(' | wc -c)
        closes=$(echo "$line" | tr -cd ')' | wc -c)
        paren_count=$((paren_count - closes))

        # If the command spans multiple lines, include them all
        if [ $paren_count -gt 0 ]; then
            for ((j=i+1; j<${#lines[@]}; j++)); do
                sqlite3_lines+=($j)
                opens=$(echo "${lines[$j]}" | tr -cd '(' | wc -c)
                closes=$(echo "${lines[$j]}" | tr -cd ')' | wc -c)
                paren_count=$((paren_count + opens - closes))

                if [ $paren_count -eq 0 ]; then
                    break
                fi
            done
        fi
    fi
done

if [ ${#sqlite3_lines[@]} -eq 0 ]; then
    echo -e "\n${YELLOW}[WARNING] Could not find sqlite3 target definition in amplify_db_common.${NC}"
    echo -e "${YELLOW}This version may not conflict with sqlcipher. Try building without patching.${NC}\n"
    rm "${AMPLIFY_PATH}.backup"
    exit 0
fi

echo -e "${GREEN}[OK] Found sqlite3 block from line $((start_line + 1)) to line $((${sqlite3_lines[-1]} + 1))${NC}"
echo -e "${CYAN}Total lines to comment out: ${#sqlite3_lines[@]}${NC}\n"

if [ "$VERBOSE" = true ]; then
    echo -e "${CYAN}Lines that will be commented out:${NC}"
    for sqlite_line in "${sqlite3_lines[@]}"; do
        echo -e "${WHITE}  Line $((sqlite_line + 1)): ${lines[$sqlite_line]}${NC}"
    done
    echo ""
fi

echo -e "${YELLOW}Applying patch (commenting out sqlite3 definition)...${NC}\n"

# Create new file content
{
    echo "# PATCHED FOR SQLCIPHER - This file has been automatically patched"
    echo "# to prevent sqlite3 target conflicts with sqlcipher_flutter_libs"
    echo "# The sqlite3 target from amplify_db_common has been disabled."
    echo "# sqlcipher_flutter_libs will provide the encrypted sqlite3 library."
    echo "# Patched lines: $((start_line + 1)) to $((${sqlite3_lines[-1]} + 1))"
    echo ""

    # Write all lines, commenting out sqlite3-related lines
    commented_count=0
    for i in "${!lines[@]}"; do
        # Check if this line is in the sqlite3 block
        is_sqlite3_line=false
        for sqlite_line in "${sqlite3_lines[@]}"; do
            if [ $i -eq $sqlite_line ]; then
                is_sqlite3_line=true
                break
            fi
        done

        if [ "$is_sqlite3_line" = true ]; then
            # Comment out this line
            if [ $i -eq $start_line ]; then
                echo ""
                echo "# DISABLED: sqlite3 target (using sqlcipher_flutter_libs version instead)"
            fi
            echo "# ${lines[$i]}"
            ((commented_count++))
        else
            # Keep line as-is
            echo "${lines[$i]}"
        fi
    done

    echo ""
    echo "# END OF SQLCIPHER PATCH - Commented out $commented_count lines"

} > "${AMPLIFY_PATH}.tmp"

# Replace original with patched version
mv "${AMPLIFY_PATH}.tmp" "$AMPLIFY_PATH"

echo -e "${GREEN}[SUCCESS] Successfully patched amplify_db_common CMakeLists.txt!${NC}\n"

# Verification step
echo -e "${YELLOW}Verifying patch...${NC}"

# Check for add_library(sqlite3)
uncommented_add=$(grep -n "^\s*add_library\s*(sqlite3" "$AMPLIFY_PATH" 2>/dev/null | grep -v "^\s*#" || true)

# Check for target_* commands with sqlite3
uncommented_target=$(grep -n "^\s*target_.*\s*(sqlite3" "$AMPLIFY_PATH" 2>/dev/null | grep -v "^\s*#" || true)

# Check for set_target_properties(sqlite3)
uncommented_set=$(grep -n "^\s*set_target_properties\s*(sqlite3" "$AMPLIFY_PATH" 2>/dev/null | grep -v "^\s*#" || true)

verification_failed=false

if [ -n "$uncommented_add" ]; then
    echo -e "${RED}⚠ WARNING: Found uncommented add_library(sqlite3):${NC}"
    echo "$uncommented_add"
    verification_failed=true
fi

if [ -n "$uncommented_target" ]; then
    echo -e "${RED}⚠ WARNING: Found uncommented target_* commands for sqlite3:${NC}"
    echo "$uncommented_target"
    verification_failed=true
fi

if [ -n "$uncommented_set" ]; then
    echo -e "${RED}⚠ WARNING: Found uncommented set_target_properties(sqlite3):${NC}"
    echo "$uncommented_set"
    verification_failed=true
fi

if [ "$verification_failed" = false ]; then
    echo -e "${GREEN}✓ Verification passed: All sqlite3 commands are commented out${NC}\n"
else
    echo -e "${YELLOW}The patch may not be complete!${NC}\n"
fi

echo -e "${CYAN}Changes made:${NC}"
echo -e "${WHITE}  ✓ Commented out $commented_count lines related to sqlite3${NC}"
echo -e "${WHITE}  ✓ Patch marker added to file${NC}"
echo -e "${WHITE}  ✓ sqlcipher_flutter_libs will provide sqlite3 (with encryption)${NC}"
echo -e "${WHITE}  ✓ Both plugins will use the encrypted sqlite3 library${NC}\n"
echo -e "${CYAN}Backup saved to: ${AMPLIFY_PATH}.backup${NC}\n"

if [ "$VERBOSE" = true ]; then
    echo -e "${CYAN}First 20 lines of patched file:${NC}"
    head -n 20 "$AMPLIFY_PATH" | cat -n
    echo ""
fi

echo -e "${GREEN}You can now run: flutter build windows${NC}\n"

exit 0
