import 'dart:convert';
import 'dart:math';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Manages encryption keys for SQLCipher database encryption.
///
/// This service securely generates and stores encryption keys using
/// flutter_secure_storage, which uses platform-specific secure storage:
/// - Windows: Windows Credential Manager (Data Protection API)
/// - macOS: Keychain
/// - Linux: libsecret
/// - iOS: Keychain
/// - Android: Keystore
class EncryptionKeyManager {
  static const String _keyStorageKey = 'medglobal_pos_db_encryption_key';
  static const int _keyLengthBytes = 32; // 256-bit key

  final FlutterSecureStorage _secureStorage;

  EncryptionKeyManager({
    FlutterSecureStorage? secureStorage,
  }) : _secureStorage = secureStorage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(
                encryptedSharedPreferences: true,
              ),
              iOptions: IOSOptions(
                accessibility: KeychainAccessibility.first_unlock_this_device,
              ),
              wOptions: WindowsOptions(
                useBackwardCompatibility: false,
              ),
            );

  /// Retrieves the database encryption key from secure storage.
  /// If no key exists, generates a new random key and stores it securely.
  ///
  /// Returns the encryption key as a hex string suitable for SQLCipher's PRAGMA key.
  Future<String> getOrCreateEncryptionKey() async {
    try {
      // Try to retrieve existing key
      String? existingKey = await _secureStorage.read(key: _keyStorageKey);

      if (existingKey != null && existingKey.isNotEmpty) {
        print('🔐 Retrieved existing encryption key from secure storage');
        return existingKey;
      }

      // Generate new key if none exists
      print('🔑 Generating new encryption key...');
      final newKey = _generateSecureKey();

      // Store the key securely
      await _secureStorage.write(
        key: _keyStorageKey,
        value: newKey,
      );

      print('✅ New encryption key generated and stored securely');
      return newKey;
    } catch (e) {
      print('❌ Error managing encryption key: $e');
      rethrow;
    }
  }

  /// Generates a cryptographically secure random key.
  /// Returns a hex-encoded string for use with SQLCipher.
  String _generateSecureKey() {
    final random = Random.secure();
    final bytes = List<int>.generate(_keyLengthBytes, (_) => random.nextInt(256));
    return base64Url.encode(bytes);
  }

  /// Deletes the encryption key from secure storage.
  /// WARNING: This will make the existing encrypted database inaccessible!
  /// Only use this for testing or when intentionally resetting the database.
  Future<void> deleteEncryptionKey() async {
    try {
      await _secureStorage.delete(key: _keyStorageKey);
      print('🗑️ Encryption key deleted from secure storage');
    } catch (e) {
      print('❌ Error deleting encryption key: $e');
      rethrow;
    }
  }

  /// Checks if an encryption key exists in secure storage.
  Future<bool> hasEncryptionKey() async {
    try {
      final key = await _secureStorage.read(key: _keyStorageKey);
      return key != null && key.isNotEmpty;
    } catch (e) {
      print('❌ Error checking for encryption key: $e');
      return false;
    }
  }
}
