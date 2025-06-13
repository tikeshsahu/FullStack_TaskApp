import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';

// Firebase configuration from google-services.json
const String apiKey = 'AIzaSyCjzymCPCBmZ-7SJCsjWXX8YoACFARFdC4';
const String appId = '1:969176207487:android:00b30409ac77c562afaf4a';
const String messagingSenderId = '969176207487';
const String projectId = 'project-c0911';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: messagingSenderId,
      projectId: projectId,
    ),
  );

  runApp(const TaskManagerApp());
}
