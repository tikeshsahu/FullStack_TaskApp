// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../app/constants/app_constants.dart';

// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Sign Up')),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(AppConstants.defaultPadding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Logo and Title
//               const Icon(Icons.task_alt, size: 60, color: Colors.indigo),
//               const SizedBox(height: 16),
//               const Text(
//                 'Create Account',
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Sign up to get started',
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 48),

//               // Name Field
//               const TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Full Name',
//                   hintText: 'Enter your full name',
//                   prefixIcon: Icon(Icons.person_outline),
//                 ),
//               ),
//               const SizedBox(height: 16),

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
//               const SizedBox(height: 16),

//               // Confirm Password Field
//               const TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Confirm Password',
//                   hintText: 'Re-enter your password',
//                   prefixIcon: Icon(Icons.lock_outline),
//                   suffixIcon: Icon(Icons.visibility_off_outlined),
//                 ),
//               ),
//               const SizedBox(height: 24),

//               // Terms and Conditions
//               Row(
//                 children: [
//                   Checkbox(
//                     value: true, // Demo: Always checked
//                     onChanged: (value) {
//                       // Demo: No functionality
//                     },
//                   ),
//                   const Expanded(
//                     child: Text(
//                       'I agree to the Terms & Conditions',
//                       style: TextStyle(fontSize: 14),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),

//               // Sign Up Button
//               ElevatedButton(
//                 onPressed: () {
//                   // Demo: Show success message and navigate to home
//                   Get.snackbar(
//                     'Success',
//                     'Account created successfully!',
//                     snackPosition: SnackPosition.BOTTOM,
//                   );
//                   Get.offAllNamed('/home');
//                 },
//                 child: const Text('Sign Up'),
//               ),
//               const SizedBox(height: 16),

//               // Login Link
//               TextButton(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 child: const Text('Already have an account? Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
