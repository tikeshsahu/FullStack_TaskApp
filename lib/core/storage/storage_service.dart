import 'package:get_storage/get_storage.dart';

class StorageService {
  StorageService._();
  static final instance = StorageService._();

  final _storage = GetStorage();

  // Generic methods
  void save(String key, dynamic value) {
    _storage.write(key, value);
  }

  T? fetch<T>(String key) {
    return _storage.read<T>(key);
  }

  void deleteKey(String key) {
    _storage.remove(key);
  }

  void clearAll() {
    _storage.erase();
  }

  // Theme specific methods
  bool isDarkMode() {
    return fetch<bool>('isDarkMode') ?? false;
  }

  void setDarkMode(bool value) {
    save('isDarkMode', value);
  }

  // User specific methods
  Map<String, dynamic>? getCurrentUser() {
    return fetch<Map<String, dynamic>>('currentUser');
  }

  void setCurrentUser(Map<String, dynamic> user) {
    save('currentUser', user);
  }

  void removeCurrentUser() {
    deleteKey('currentUser');
  }
}
