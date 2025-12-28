import 'package:e_commarce_site/core/constants/dimension_theme.dart';
import 'package:e_commarce_site/core/extensions/ex_build_context.dart';
import 'package:flutter/material.dart';

class WCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  const WCard({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? context.cardColor,
        borderRadius: BorderRadius.circular(PTheme.borderRadius),
      ),
      child: child,
    );
  }
}
