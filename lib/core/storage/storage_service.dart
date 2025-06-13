import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  static const String _themeKey = 'isDarkMode';
  static const String _userKey = 'currentUser';
  static const String _tasksKey = 'cachedTasks';

  late final GetStorage _storage;

  @override
  Future<void> onInit() async {
    super.onInit();
    _storage = GetStorage();
  }

  // Theme Management
  bool getDarkMode() {
    return _storage.read<bool>(_themeKey) ?? false;
  }

  Future<void> setDarkMode(bool isDarkMode) async {
    await _storage.write(_themeKey, isDarkMode);
  }

  // User Management
  Map<String, dynamic>? getCurrentUser() {
    return _storage.read<Map<String, dynamic>>(_userKey);
  }

  Future<void> setCurrentUser(Map<String, dynamic> user) async {
    await _storage.write(_userKey, user);
  }

  Future<void> removeCurrentUser() async {
    await _storage.remove(_userKey);
  }

  // Task Caching (for offline support)
  List<Map<String, dynamic>> getCachedTasks() {
    final tasks = _storage.read<List>(_tasksKey);
    return tasks?.cast<Map<String, dynamic>>() ?? [];
  }

  Future<void> setCachedTasks(List<Map<String, dynamic>> tasks) async {
    await _storage.write(_tasksKey, tasks);
  }

  Future<void> clearCachedTasks() async {
    await _storage.remove(_tasksKey);
  }

  // Clear all storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
