// import 'dart:ui';
// import 'package:e_commarce_site/core/constants/dimension_theme.dart';
// import 'package:e_commarce_site/core/extensions/ex_build_context.dart';
// import 'package:e_commarce_site/core/extensions/ex_padding.dart';
// import 'package:e_commarce_site/core/services/navigation_service.dart';
// import 'package:e_commarce_site/core/widgets/w_button.dart';
// import 'package:e_commarce_site/core/widgets/w_close_button.dart';
// import 'package:e_commarce_site/gen/assets.gen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// /// 💬 WDialog
// /// A utility class for showing animated, customizable dialogs:
// /// • `show()` ➡️ Text-only confirm/cancel dialog 🧾
// /// • `showCustom()` ➡️ Pass your own widget list for full control 🧱
// /// • `confirmExitLogout()` ➡️ Styled logout confirmation with icon support 🔒
// /// 🪄 Dialogs feature a smooth scale transition with blur effect.
// /// ❌ Includes a close button at the top-right.
// /// 🔒 All dialogs are dismissible by default unless specified.
// class WDialog {
//   static Future<void> show({
//     required BuildContext context,
//     String? title,
//     String? content,
//     String confirmText = 'OK',
//     String cancelText = 'Cancel',
//     VoidCallback? onConfirm,
//     bool showCancel = true,
//   }) {
//     return Navigator.of(context).push(
//       _AnimatedDialogRoute(
//         dismissible: true,
//         builder: (context) => _DialogCommon(
//           children: [
//             if (title != null && title.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 12),
//                 child: Text(
//                   title,
//                   style: context.textTheme?.titleMedium,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             if (content != null && content.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 24),
//                 child: Text(
//                   content,
//                   style: context.textTheme?.bodyMedium,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 if (showCancel)
//                   TextButton(
//                     onPressed: () => Navigator.of(context).pop(),
//                     child: Text(cancelText),
//                   ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     onConfirm?.call();
//                   },
//                   child: Text(confirmText),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   static Future<dynamic> showCustom({
//     required BuildContext context,
//     required List<Widget> children,
//     bool dismissible = true,
//   }) {
//     return Navigator.of(context).push(
//       _AnimatedDialogRoute(
//         dismissible: dismissible,
//         builder: (context) => _DialogCommon(children: children),
//       ),
//     );
//   }

//   static Future<void> confirmExitLogout({
//     required BuildContext context,
//     String? title,
//     String? description,
//     VoidCallback? onYesPressed,
//     Color? titleColor,
//     bool? okButton,
//     double? iconHeight,
//     double? iconWidth,
//     bool isLogOut = false,
//   }) {
//     return Navigator.of(context).push(
//       _AnimatedDialogRoute(
//         dismissible: true,
//         builder: (context) => _WConfirmDialog(
//           okButton: okButton,
//           iconHeight: iconHeight,
//           iconWidth: iconWidth,
//           isLogOut: isLogOut,
//           title: title ?? 'Logout',
//           description: description ?? 'Are you sure you want to logout?',
//           onYesPressed: onYesPressed,
//         ),
//       ),
//     );
//   }
// }

// /// 🧱 _DialogCommon
// /// Shared layout for all dialogs with padding, border radius, and a close button.
// /// ⬇️ Accepts a list of children widgets to layout vertically.

// class _DialogCommon extends StatelessWidget {
//   final List<Widget> children;
//   const _DialogCommon({required this.children});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(PTheme.borderRadius),
//       ),
//       insetPadding: EdgeInsets.symmetric(
//         horizontal: PTheme.paddingX * 1.8,
//         vertical: PTheme.paddingY,
//       ),
//       backgroundColor: Colors.transparent,
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(
//                 horizontal: PTheme.paddingX,
//                 vertical: PTheme.paddingY,
//               ),
//               decoration: BoxDecoration(
//                 color: context.theme.brightness == Brightness.dark
//                     ? context.cardColor
//                     : context.backgroundColor,
//                 borderRadius: BorderRadius.circular(PTheme.borderRadius),
//               ),
//               child: Column(mainAxisSize: MainAxisSize.min, children: children),
//             ),
//             Positioned(top: -14, right: -14, child: const WClose()),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// 🔐 _WConfirmDialog
// /// A pre-styled confirmation dialog for logout or other sensitive actions:
// /// • ✅ Shows Yes/No or Okay buttons
// /// • 🎨 Optional title, description, SVG or icon
// /// • 🔄 Triggers callback on confirmation
// class _WConfirmDialog extends StatelessWidget {
//   final String? title;
//   final String description;
//   final VoidCallback? onYesPressed;
//   final bool? okButton;
//   final double? iconHeight;
//   final double? iconWidth;
//   final bool isLogOut;

//   const _WConfirmDialog({
//     this.title,
//     required this.description,
//     required this.onYesPressed,
//     this.okButton,
//     this.iconHeight,
//     this.iconWidth,
//     this.isLogOut = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return _DialogCommon(
//       children: [
//         gapY(20),
//         if (isLogOut)
//           SvgPicture.asset(Assets.logo.logout, height: iconHeight ?? 50.h)
//         else
//           Icon(Icons.exit_to_app, size: iconHeight ?? 50.h),
//         if (title != null)
//           Text(
//             title!,
//             textAlign: TextAlign.center,
//             style: context.textTheme?.titleMedium,
//           ).pH(),
//         Text(description, textAlign: TextAlign.center).pB(),
//         if (okButton == true)
//           WPrimaryButton(
//             text: "Okay",
//             onTap: () => Navigation.pop(),
//             width: 130.w,
//           )
//         else
//           Row(
//             children: [
//               Expanded(
//                 child: WPrimaryButton.border(
//                   text: 'No',
//                   onTap: () => Navigation.pop(),
//                 ),
//               ),
//               gapX(10),
//               Expanded(
//                 child: WPrimaryButton(
//                   text: 'Yes',
//                   onTap: () => onYesPressed?.call(),
//                 ),
//               ),
//             ],
//           ),
//       ],
//     );
//   }
// }

// /// 🎭 _AnimatedDialogRoute <>
// /// Custom page route that creates a blurred, animated scale dialog transition.
// /// • 🎞️ In/out transition with customizable duration
// /// • 🌫️ Uses BackdropFilter for blur
// /// • 🖱️ Can be dismissed by tapping outside (if `dismissible` is true)
// class _AnimatedDialogRoute<T> extends PageRouteBuilder<T> {
//   final WidgetBuilder builder;
//   bool dismissible;

//   _AnimatedDialogRoute({required this.builder, required this.dismissible})
//     : super(
//         opaque: false,
//         barrierDismissible: dismissible,
//         barrierColor: Colors.black54,
//         pageBuilder: (context, animation, secondaryAnimation) =>
//             builder(context),
//         transitionDuration: const Duration(milliseconds: 300),
//         reverseTransitionDuration: const Duration(milliseconds: 200),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
//             child: ScaleTransition(
//               scale: Tween<double>(begin: 0.7, end: 1.0).animate(
//                 CurvedAnimation(parent: animation, curve: Curves.easeInOut),
//               ),
//               child: child,
//             ),
//           );
//         },
//       );
// }
