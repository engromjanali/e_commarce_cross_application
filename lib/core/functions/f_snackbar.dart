import 'package:another_flushbar/flushbar.dart';
import 'package:e_commarce_site/core/constants/dimension_theme.dart';
import 'package:e_commarce_site/core/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

/// 🍔 showSnackBar(message)
/// - 🎨 Custom Flushbar styling
/// - 📢 Optional [title], [message]
/// - 🎯 Types: success ✅, warning ⚠️, important ❗
/// 🔧 Use for alerts, confirmations, or errors.

enum SnackBarType { warning, success, important }

void showSnackBar(
  String? message, {
  SnackBarType? snackBarType = SnackBarType.success,
  String? title,
}) {
  Flushbar(
    title: title,
    message:
        message ??
        "Oops! Something went wrong. Please check your internet connection and try again. If the issue persists, contact support.",
    leftBarIndicatorColor: snackBarType == SnackBarType.success
        ? Colors.green
        : snackBarType == SnackBarType.warning
        ? Colors.orange
        : Colors.red,
    icon: Icon(
      Icons.warning_amber_outlined,
      color: snackBarType == SnackBarType.success
          ? Colors.green
          : snackBarType == SnackBarType.warning
          ? Colors.orange
          : Colors.red,
    ),
    duration: const Duration(seconds: 3),
    borderRadius: BorderRadius.circular(8),
    margin: EdgeInsets.symmetric(horizontal: PTheme.paddingX),
    flushbarPosition: FlushbarPosition.TOP,
  // ).show(NavigationService.currentContext);
    ).show(Get.context!);
}
