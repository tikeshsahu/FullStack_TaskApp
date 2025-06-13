class AppConstants {
  // App Info
  static const String appName = 'Task Manager';
  static const String appVersion = '1.0.0';

  // Storage Keys
  static const String userKey = 'current_user';
  static const String themeKey = 'is_dark_mode';
  static const String tasksKey = 'cached_tasks';

  // Firebase Collections
  static const String usersCollection = 'users';
  static const String tasksCollection = 'tasks';
  static const String categoriesCollection = 'categories';

  // Task Status
  static const String taskStatusPending = 'pending';
  static const String taskStatusInProgress = 'in_progress';
  static const String taskStatusCompleted = 'completed';
  static const String taskStatusCancelled = 'cancelled';

  // Task Priority
  static const String taskPriorityLow = 'low';
  static const String taskPriorityMedium = 'medium';
  static const String taskPriorityHigh = 'high';
  static const String taskPriorityUrgent = 'urgent';

  // Default Categories
  static const List<String> defaultCategories = [
    'Work',
    'Personal',
    'Shopping',
    'Health',
    'Education',
    'Travel',
    'Finance',
    'Other',
  ];

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 50;

  // Timeouts
  static const Duration networkTimeout = Duration(seconds: 30);
  static const Duration cacheTimeout = Duration(hours: 24);

  // Dimensions
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double defaultBorderRadius = 12.0;
  static const double defaultElevation = 2.0;

  // Animation Durations
  static const Duration fastAnimation = Duration(milliseconds: 200);
  static const Duration normalAnimation = Duration(milliseconds: 300);
  static const Duration slowAnimation = Duration(milliseconds: 500);

  // Validation
  static const int minPasswordLength = 6;
  static const int maxTaskTitleLength = 100;
  static const int maxTaskDescriptionLength = 500;

  // Date Formats
  static const String dateFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';

  // Error Messages
  static const String genericErrorMessage =
      'Something went wrong. Please try again.';
  static const String networkErrorMessage =
      'Please check your internet connection.';
  static const String authErrorMessage =
      'Authentication failed. Please login again.';
  static const String validationErrorMessage =
      'Please check your input and try again.';

  // Success Messages
  static const String taskCreatedMessage = 'Task created successfully!';
  static const String taskUpdatedMessage = 'Task updated successfully!';
  static const String taskDeletedMessage = 'Task deleted successfully!';
  static const String taskCompletedMessage = 'Task completed!';
}
