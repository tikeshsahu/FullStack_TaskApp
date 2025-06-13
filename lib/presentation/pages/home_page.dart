import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presentation/controllers/theme_controller.dart';
import '../../app/constants/app_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Demo task data
  final List<Map<String, dynamic>> demoTasks = const [
    {
      'id': '1',
      'title': 'Complete Flutter Project',
      'description': 'Finish the task manager app',
      'priority': 'High',
      'category': 'Work',
      'dueDate': '25 Dec 2024',
      'isCompleted': false,
    },
    {
      'id': '2',
      'title': 'Buy Groceries',
      'description': 'Milk, Bread, Eggs, Fruits',
      'priority': 'Medium',
      'category': 'Personal',
      'dueDate': '24 Dec 2024',
      'isCompleted': true,
    },
    {
      'id': '3',
      'title': 'Gym Workout',
      'description': 'Chest and Triceps',
      'priority': 'Low',
      'category': 'Health',
      'dueDate': '23 Dec 2024',
      'isCompleted': false,
    },
    {
      'id': '4',
      'title': 'Read Flutter Documentation',
      'description': 'Study GetX state management',
      'priority': 'Medium',
      'category': 'Education',
      'dueDate': '26 Dec 2024',
      'isCompleted': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Get.toNamed('/profile'),
          ),
          Obx(
            () => IconButton(
              icon: Icon(
                themeController.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              ),
              onPressed: () => themeController.toggleTheme(),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Stats Cards
          Container(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Total Tasks',
                    '${demoTasks.length}',
                    Icons.task_alt,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Completed',
                    '${demoTasks.where((task) => task['isCompleted']).length}',
                    Icons.check_circle,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Pending',
                    '${demoTasks.where((task) => !task['isCompleted']).length}',
                    Icons.pending,
                    Colors.orange,
                  ),
                ),
              ],
            ),
          ),

          // Task List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
              ),
              itemCount: demoTasks.length,
              itemBuilder: (context, index) {
                final task = demoTasks[index];
                return _buildTaskCard(context, task);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Demo: Show create task bottom sheet
          _showCreateTaskModal(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(BuildContext context, Map<String, dynamic> task) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          task['isCompleted']
              ? Icons.check_circle
              : Icons.radio_button_unchecked,
          color: task['isCompleted'] ? Colors.green : Colors.grey,
        ),
        title: Text(
          task['title'],
          style: TextStyle(
            decoration: task['isCompleted'] ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task['description']),
            const SizedBox(height: 4),
            Row(
              children: [
                _buildPriorityChip(task['priority']),
                const SizedBox(width: 8),
                Chip(
                  label: Text(
                    task['category'],
                    style: const TextStyle(fontSize: 10),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                const Spacer(),
                Text(
                  task['dueDate'],
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          // Show edit task modal
          _showEditTaskModal(context, task);
        },
      ),
    );
  }

  Widget _buildPriorityChip(String priority) {
    Color color;
    switch (priority.toLowerCase()) {
      case 'high':
        color = Colors.red;
        break;
      case 'medium':
        color = Colors.orange;
        break;
      case 'low':
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
    }

    return Chip(
      label: Text(priority, style: TextStyle(fontSize: 10, color: color)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  void _showEditTaskModal(BuildContext context, Map<String, dynamic> task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => DraggableScrollableSheet(
            initialChildSize: 0.7,
            maxChildSize: 0.9,
            minChildSize: 0.5,
            expand: false,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Handle bar
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Header
                    Row(
                      children: [
                        const Text(
                          'Edit Task',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Task details form
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Task Title',
                              ),
                              controller: TextEditingController(
                                text: task['title'],
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Description',
                              ),
                              controller: TextEditingController(
                                text: task['description'],
                              ),
                              maxLines: 3,
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Priority',
                              ),
                              value: task['priority'],
                              items: const [
                                DropdownMenuItem(
                                  value: 'Low',
                                  child: Text('Low'),
                                ),
                                DropdownMenuItem(
                                  value: 'Medium',
                                  child: Text('Medium'),
                                ),
                                DropdownMenuItem(
                                  value: 'High',
                                  child: Text('High'),
                                ),
                              ],
                              onChanged: (value) {
                                // Demo: No functionality
                              },
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Due Date',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              controller: TextEditingController(
                                text: task['dueDate'],
                              ),
                              readOnly: true,
                            ),
                            const SizedBox(height: 24),

                            // Action buttons
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Get.snackbar(
                                        'Demo',
                                        'Task deleted (demo)',
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.snackbar(
                                        'Success',
                                        'Task updated successfully!',
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Save'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
    );
  }

  void _showCreateTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => Container(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle bar
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Header
                const Text(
                  'Create New Task',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Form
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Task Title',
                    hintText: 'Enter task title',
                  ),
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter task description',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Priority'),
                  items: const [
                    DropdownMenuItem(value: 'Low', child: Text('Low')),
                    DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                    DropdownMenuItem(value: 'High', child: Text('High')),
                  ],
                  onChanged: (value) {
                    // Demo: No functionality
                  },
                ),
                const SizedBox(height: 24),

                // Create button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.snackbar(
                        'Success',
                        'Task created successfully!',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      Navigator.pop(context);
                    },
                    child: const Text('Create Task'),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
