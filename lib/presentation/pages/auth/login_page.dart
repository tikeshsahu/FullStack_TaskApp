// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/constants/app_constants.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(AppConstants.defaultPadding),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Logo and Title
//               const Icon(Icons.task_alt, size: 80, color: Colors.indigo),
//               const SizedBox(height: 16),
//               const Text(
//                 'Welcome Backkkkkk',
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Sign in to continue',
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 48),

//               // Email Field
//               const TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   hintText: 'Enter your email',
//                   prefixIcon: Icon(Icons.email_outlined),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Password Field
//               const TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   hintText: 'Enter your password',
//                   prefixIcon: Icon(Icons.lock_outline),
//                   suffixIcon: Icon(Icons.visibility_off_outlined),
//                 ),
//               ),
//               const SizedBox(height: 24),

//               // Login Button
//               ElevatedButton(
//                 onPressed: () {
//                   // Demo: Navigate to home
//                   Get.offAllNamed('/home');
//                 },
//                 child: const Text('Login'),
//               ),
//               const SizedBox(height: 16),

//               // Sign Up Link
//               TextButton(
//                 onPressed: () {
//                   Get.toNamed('/signup');
//                 },
//                 child: const Text('Don\'t have an account? Sign Up'),
//               ),

//               const SizedBox(height: 16),

//               // Forgot Password
//               TextButton(
//                 onPressed: () {
//                   // Demo: Show snackbar
//                   Get.snackbar(
//                     'Demo Mode',
//                     'Forgot password feature coming soon',
//                     snackPosition: SnackPosition.BOTTOM,
//                   );
//                 },
//                 child: const Text('Forgot Password?'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
