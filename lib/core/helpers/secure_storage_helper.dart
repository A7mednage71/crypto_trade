import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EncryptedStorage {
  static const AndroidOptions _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  static const _storage = FlutterSecureStorage(aOptions: _androidOptions);

  static Future<void> save(String key, String? value) async {
    if (value == null || value.isEmpty) {
      await delete(key);
    } else {
      await _storage.write(key: key, value: value);
    }
  }

  static Future<String?> get(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  static Future<void> saveUserToken(String token) =>
      save(StorageKeys.accessToken, token);
  static Future<String?> getUserToken() => get(StorageKeys.accessToken);

  static Future<void> saveUserId(String uId) => save(StorageKeys.uId, uId);
  static Future<String?> getUserId() => get(StorageKeys.uId);

  static Future<bool> hasToken() async {
    final token = await getUserToken();
    return token != null && token.isNotEmpty;
  }
}

class StorageKeys {
  static const String accessToken = 'access_token';
  static const String uId = 'uId';
}
