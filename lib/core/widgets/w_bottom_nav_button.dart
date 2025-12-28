import 'package:e_commarce_site/core/constants/dimension_theme.dart';
import 'package:e_commarce_site/core/extensions/ex_build_context.dart';
import 'package:flutter/material.dart';

class WBottomNavButton extends StatelessWidget {
  final String label;
  final Function() ontap;
  final Function()? onTapIgnore;
  final bool isEnabled;
  const WBottomNavButton({
    super.key,
    required this.label,
    required this.ontap,
    this.onTapIgnore,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEnabled) {
          ontap.call();
        } else {
          onTapIgnore?.call();
        }
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(PTheme.borderRadius),
          color: isEnabled
              ? context.button?.primary
              : context.secondaryTextColor,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: context.textTheme?.titleLarge?.copyWith(
            color: context.backgroundColor,
          ),
        ),
      ),
    );
  }
}
