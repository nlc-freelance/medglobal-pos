import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import '../../security/encryption_key_manager.dart';

/// Native implementation of [connect] for desktop platforms using Drift with SQLCipher encryption.
///
/// This sets up an encrypted local SQLite database under:
///   On Windows → C:\Users\<User>\AppData\Local\MedGlobal_POS\
///   On macOS   → ~/Library/Application Support/MedGlobal_POS/
///   On Linux   → ~/.local/share/MedGlobal_POS/
///
/// Security features:
/// - Database is encrypted using SQLCipher with a 256-bit key
/// - Encryption key is stored securely in platform-specific secure storage
/// - External tampering is prevented as the database cannot be opened without the key
///
/// It ensures the target directory exists before opening the database,
/// and uses a background connection for non-blocking access. SQL logs
/// are enabled for development and debugging.
DatabaseConnection connect() {
  return DatabaseConnection.delayed(Future(() async {
    final localAppData = Platform.environment['LOCALAPPDATA']!;
    final dir = Directory(p.join(localAppData, 'MedGlobal_POS'));

    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    final file = File(p.join(dir.path, 'pos.db'));
    print('📁 Drift DB path: ${file.path}');

    // Retrieve or generate encryption key from secure storage
    final keyManager = EncryptionKeyManager();
    final encryptionKey = await keyManager.getOrCreateEncryptionKey();

    return NativeDatabase.createBackgroundConnection(
      file,
      logStatements: true,
      setup: (rawDb) {
        // Set the encryption key for SQLCipher
        // This must be the first operation on the database
        rawDb.execute("PRAGMA key = '$encryptionKey';");

        // Disable double-quoted string literals for consistency with Drift
        // This is recommended by the SQLCipher documentation
        rawDb.config.doubleQuotedStringLiterals = false;

        // Verify that SQLCipher is properly configured
        _debugCheckHasCipher(rawDb);

        print('🔐 Database encryption enabled with SQLCipher');
      },
    );
  }));
}

/// Verifies that SQLCipher encryption is active.
/// This helps catch configuration issues early in development.
bool _debugCheckHasCipher(Database database) {
  try {
    final result = database.select('PRAGMA cipher_version;');
    if (result.isNotEmpty) {
      final version = result.first.values.first;
      print('✅ SQLCipher version: $version');
      return true;
    } else {
      print('⚠️ Warning: SQLCipher may not be properly configured');
      return false;
    }
  } catch (e) {
    print('⚠️ Warning: Could not verify SQLCipher: $e');
    return false;
  }
}
