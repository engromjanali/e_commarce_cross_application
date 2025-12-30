import 'package:e_commarce_site/core/functions/f_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ResponsiveHelper {
  static bool isMobilePhone() {
    if (!kIsWeb) {
      return true;
    } else {
      return false;
    }
  }

  static bool isWeb() {
    return kIsWeb;
  }

  static bool isMobile() {
    final size = MediaQuery.of(Get.context!).size.width;
    if (size < 650 || !kIsWeb) {
      return true;
    } else {
      return false;
    }
  }

  static bool isTab(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    if (size < 1300 && size >= 650) {
      return true;
    } else {
      return false;
    }
  }

  static bool isDesktop(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    if (size >= 1300) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> showDialogOrBottomSheet(
    BuildContext context,
    Widget view, {
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
  }) async {
    if (ResponsiveHelper.isDesktop(context)) {
      await showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (ctx) => Center(child: view),
      );
    } else {
      await showModalBottomSheet(
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        backgroundColor: Colors.transparent,
        isScrollControlled: isScrollControlled,
        useSafeArea: true,
        context: context,
        builder: (ctx) => view,
      );
    }
  }
}
