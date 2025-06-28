// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:preplaced_mentor/common/snack_bar.dart';
// // import 'package:preplaced_mentor/services/analytics_service.dart';
// import 'package:preplaced_mentor/utils/app_colors.dart';
// import 'package:preplaced_mentor/utils/app_constants.dart';
// import 'package:preplaced_mentor/utils/app_textstyle.dart';
// import '../../utils/app_images.dart';
// import 'auth_controller.dart';

// class AuthScreen extends StatelessWidget {
//   const AuthScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final AuthController controller = Get.find();
//     final size = MediaQuery.of(context).size;
//     // final analytics = AnalyticsService.instance;
//     return SafeArea(
//       top: true,
//       bottom: true,
//       child: Scaffold(
//         backgroundColor: AppColors.bgColor,
//         resizeToAvoidBottomInset: true,
//         body: Obx(
//             () => controller.isLoading || controller.dynamicLinkAuthLoading
//                 ? const Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : controller.dynamicLinkEmailSent
//                     ? Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     controller
//                                         .updateDynamicLinkEmailSent(false);
//                                   },
//                                   child: Container(
//                                     height: 40,
//                                     width: 40,
//                                     padding: const EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: AppColors.outlinedButtonBorder,
//                                           width: 1),
//                                     ),
//                                     child: SvgPicture.asset(
//                                       AppImages.back,
//                                       height: 20,
//                                       width: 20,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             const SizedBox(
//                                 height: AppConstants.largePadding * 6),
//                             SvgPicture.asset(
//                               AppImages.vector,
//                               height: 54,
//                               width: 44,
//                             ),
//                             const SizedBox(
//                                 height: AppConstants.largePadding - 4),
//                             const Text(
//                               'Login securely with a magic link',
//                               style: AppTextStyle.regularWhiteBig,
//                             ),
//                             const SizedBox(height: AppConstants.normalPadding),
//                             RichText(
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 3,
//                                 textAlign: TextAlign.center,
//                                 text: TextSpan(children: [
//                                   TextSpan(
//                                       text: "We've sent a magic link to ",
//                                       style: AppTextStyle.regularGray
//                                           .copyWith(fontSize: 12)),
//                                   TextSpan(
//                                       text:
//                                           '${controller.emailController.text}\n' ??
//                                               '',
//                                       style: AppTextStyle.regularWhite
//                                           .copyWith(fontSize: 12)),
//                                   TextSpan(
//                                       text:
//                                           ' Please open your mail app and tap the link to securely log in to your mentor account.',
//                                       style: AppTextStyle.regularGray
//                                           .copyWith(fontSize: 12)),
//                                 ])),
//                             const SizedBox(
//                                 height: AppConstants.largePadding + 8),

//                             if (Platform.isAndroid)
//                               Row(
//                                 children: [
//                                   Expanded(
//                                       child: SizedBox(
//                                     height: size.height * 0.06,
//                                     child: OutlinedButton(
//                                       onPressed: () {
//                                         // analytics.logEvent(
//                                         //     'Open Gmail tapped', 'Auth Screen');
//                                         controller.launchGmail();
//                                       },
//                                       style: OutlinedButton.styleFrom(
//                                         backgroundColor: AppColors.bgColor,
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(4)),
//                                         side: const BorderSide(
//                                             color:
//                                                 AppColors.outlinedButtonBorder),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           SvgPicture.asset(
//                                             AppImages.google,
//                                             height: 18,
//                                             width: 18,
//                                           ),
//                                           const SizedBox(width: 5),
//                                           Text(
//                                             'Open Gmail',
//                                             style: AppTextStyle.regularWhite
//                                                 .copyWith(
//                                                     fontSize:
//                                                         size.width * 0.031),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )),
//                                   const SizedBox(
//                                       width: AppConstants.normalPadding - 4),
//                                   Expanded(
//                                       child: SizedBox(
//                                     height: size.height * 0.06,
//                                     child: OutlinedButton(
//                                       onPressed: () {
//                                         // analytics.logEvent(
//                                         //     'Open Apple Mail tapped',
//                                         //     'Auth Screen');
//                                         controller.launchAppleMail();
//                                       },
//                                       style: OutlinedButton.styleFrom(
//                                         backgroundColor: AppColors.bgColor,
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(4)),
//                                         side: const BorderSide(
//                                             color:
//                                                 AppColors.outlinedButtonBorder),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           SvgPicture.asset(
//                                             AppImages.appleWhite,
//                                             height: 18,
//                                             width: 18,
//                                           ),
//                                           const SizedBox(width: 5),
//                                           Text(
//                                             'Open Apple Mail',
//                                             style: AppTextStyle.regularWhite
//                                                 .copyWith(
//                                                     fontSize:
//                                                         size.width * 0.031),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ))
//                                 ],
//                               ),
//                             if (Platform.isAndroid)
//                             const SizedBox(height: AppConstants.largePadding),
//                             RichText(
//                               maxLines: 2,
//                               textAlign: TextAlign.center,
//                               text: TextSpan(
//                                   text:
//                                       "Can't find the email? Please check the spam folder.",
//                                   style: AppTextStyle.regularGray
//                                       .copyWith(fontSize: 14)),
//                             ),
//                             if (Platform.isIOS)
//                               const SizedBox(height: AppConstants.largePadding*3),
//                             const SizedBox(
//                                 height: AppConstants.largePadding * 7),
//                             // RichText(
//                             //   textAlign: TextAlign.center,
//                             //   text: TextSpan(
//                             //       text:
//                             //           "Can't find the email? Please check the spam folder.",
//                             //       style: AppTextStyle.regularGray
//                             //           .copyWith(fontSize: 12)),
//                             // ),
//                             // const SizedBox(height: 5),
//                             InkWell(
//                               onTap: () {
//                                 controller.emailController.clear();
//                                 controller.updateDynamicLinkEmailSent(false);
//                               },
//                               child: RichText(
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 3,
//                                   textAlign: TextAlign.center,
//                                   text: TextSpan(children: [
//                                     TextSpan(
//                                         text: "Wrong email? ",
//                                         style: AppTextStyle.regularWhite
//                                             .copyWith(
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.w500)),
//                                     TextSpan(
//                                         text: 'Please re-enter your address',
//                                         style: AppTextStyle.regularGray
//                                             .copyWith(
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: AppColors.blue)),
//                                   ])),
//                             ),
//                           ],
//                         ),
//                       )
//                     : SingleChildScrollView(
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(
//                                   height: AppConstants.largePadding + 15),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("Welcome to,",
//                                       style: AppTextStyle.headerWhite.copyWith(
//                                           fontSize: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.07)),
//                                   Row(
//                                     children: [
//                                       Text("Preplaced Mentor App",
//                                           style: AppTextStyle.headerWhite
//                                               .copyWith(
//                                                   fontSize:
//                                                       MediaQuery.of(context)
//                                                               .size
//                                                               .width *
//                                                           0.07)),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                   height: AppConstants.normalPadding),
//                               RichText(
//                                   text: const TextSpan(
//                                 text: 'Be one of the first to try our new app!',
//                                 style: AppTextStyle.regularGray,
//                               )),
//                               // SizedBox(
//                               //   height: size.height * 0.39,
//                               // ),

//                               SizedBox(
//                                 height: size.height * 0.09,
//                               ),
//                               SizedBox(
//                                 height: size.height * 0.06,
//                                 child: Form(
//                                   key: controller.formKey,
//                                   child: TextFormField(
//                                     decoration: InputDecoration(
//                                         hintText: 'Your email address',
//                                         hintStyle: AppTextStyle.regularGray
//                                             .copyWith(
//                                                 fontWeight: FontWeight.w500),
//                                         contentPadding:
//                                             const EdgeInsets.symmetric(
//                                                 horizontal: 16, vertical: 14),
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                           borderSide: BorderSide.none,
//                                         ),
//                                         isDense: true,
//                                         fillColor: AppColors.textFieldColor,
//                                         filled: true),
//                                     keyboardType: TextInputType.emailAddress,
//                                     controller: controller.emailController,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(
//                                   height: AppConstants.normalPadding - 4),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                       child: SizedBox(
//                                     height: size.height * 0.06,
//                                     child: ElevatedButton(
//                                       onPressed: () async {
//                                         if (controller
//                                                 .emailController.text.isEmpty ||
//                                             controller.emailController.text ==
//                                                 '') {
//                                           showErrorDialog(
//                                               'Please enter your email address.');
//                                         } else if (!controller
//                                             .emailController.text.isEmail) {
//                                           showErrorDialog(
//                                               'Please enter a valid email address.');
//                                         } else if (controller
//                                                 .emailController.text ==
//                                             'development@preplaced.in') {
//                                           controller
//                                               .signinUsingEmailAndPassword();
//                                         } else {
//                                           // analytics.logEvent(
//                                           //     'Continue with email tapped',
//                                           //     'Auth Screen');
//                                           await controller
//                                               .sendSignInEmailLink();
//                                         }
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                           backgroundColor: AppColors.blue,
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(8)),
//                                           foregroundColor: AppColors.white),
//                                       child: const Text('Continue with Email'),
//                                     ),
//                                   ))
//                                 ],
//                               ),
//                               SizedBox(height: size.height * 0.03),
//                               const Row(
//                                 children: [
//                                   Expanded(
//                                       child: Divider(
//                                     color: AppColors.dividerColor,
//                                   )),
//                                   SizedBox(width: 8),
//                                   Text(
//                                     'OR',
//                                     style: AppTextStyle.regularGray,
//                                   ),
//                                   SizedBox(width: 8),
//                                   Expanded(
//                                       child: Divider(
//                                     color: AppColors.dividerColor,
//                                   ))
//                                 ],
//                               ),
//                               SizedBox(height: size.height * 0.03),

//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: SizedBox(
//                                       height: size.height * 0.06,
//                                       child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                               ),
//                                               backgroundColor: AppColors.white,
//                                               foregroundColor: AppColors.black),
//                                           onPressed: () {
//                                             // analytics.logEvent(
//                                             //     'Login with google tapped',
//                                             //     'Auth Screen');
//                                             controller.signInWithGoogle();
//                                           },
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(10),
//                                             // padding: const EdgeInsets.only(
//                                             //   bottom: 14,
//                                             //   left: 10,
//                                             //   right: 16,
//                                             //   top: 14,
//                                             // ),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 SvgPicture.asset(
//                                                   AppImages.google,
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                                 const SizedBox(width: 8),
//                                                 const Text(
//                                                   'Login with Google',
//                                                   style:
//                                                       AppTextStyle.buttonBlack,
//                                                 )
//                                               ],
//                                             ),
//                                           )),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                   height: AppConstants.normalPadding),
//                               // const SizedBox(
//                               //     height: AppConstants.normalPadding * 1.5),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: SizedBox(
//                                       height: size.height * 0.06,
//                                       child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                                 // side: const BorderSide(color: AppColors.dividerColor)
//                                               ),
//                                               backgroundColor: AppColors.white,
//                                               foregroundColor: AppColors.black),
//                                           onPressed: () {
//                                             // analytics.logEvent(
//                                             //     'Login with apple tapped',
//                                             //     'Auth Screen');
//                                             controller.signInApple();
//                                           },
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(10),
//                                             // padding: const EdgeInsets.only(
//                                             //   bottom: 14,
//                                             //   left: 10,
//                                             //   right: 16,
//                                             //   top: 14,
//                                             // ),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 SvgPicture.asset(
//                                                   AppImages.apple,
//                                                   height: 20,
//                                                   width: 20,
//                                                 ),
//                                                 const SizedBox(width: 8),
//                                                 const Text(
//                                                   'Login with Apple   ',
//                                                   style:
//                                                       AppTextStyle.buttonBlack,
//                                                 )
//                                               ],
//                                             ),
//                                           )),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: size.height * 0.02),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       // analytics.logEvent(
//                                       //     'Opened privacy policy',
//                                       //     'Auth Screen');
//                                       controller.launchTermsConditions();
//                                     },
//                                     child: RichText(
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 3,
//                                         textAlign: TextAlign.center,
//                                         text: TextSpan(
//                                             text:
//                                                 'By continuing, you agree to the ',
//                                             style: AppTextStyle.regularGray
//                                                 .copyWith(fontSize: 13),
//                                             children: [
//                                               TextSpan(
//                                                   text: 'terms of use\n',
//                                                   style: AppTextStyle
//                                                       .regularGreyLight
//                                                       .copyWith(fontSize: 13)),
//                                               TextSpan(
//                                                   text: '& privacy policy',
//                                                   style: AppTextStyle
//                                                       .regularGreyLight
//                                                       .copyWith(fontSize: 13)),
//                                               TextSpan(
//                                                 text: ' of ',
//                                                 style: AppTextStyle.regularGray
//                                                     .copyWith(fontSize: 13),
//                                               ),
//                                               TextSpan(
//                                                 text: 'Preplaced',
//                                                 style: AppTextStyle
//                                                     .regularGreyLight
//                                                     .copyWith(fontSize: 13),
//                                               ),
//                                             ])),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                   height: AppConstants.normalPadding),
//                             ],
//                           ),
//                         ),
//                       )