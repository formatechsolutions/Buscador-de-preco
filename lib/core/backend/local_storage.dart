import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LocalStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> saveContentSessionStorage(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<RxString> getContentSessionStorage(String key) async {
    String? value = await _secureStorage.read(key: key);
    return (value ?? 'false').obs;
  }

  Future<void> deleteContentSessionStorage(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> clearSessionStorage() async {
    await _secureStorage.deleteAll();
  }
}
