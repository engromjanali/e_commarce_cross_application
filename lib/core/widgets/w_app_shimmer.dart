import '/core/extensions/ex_build_context.dart';
import '/core/extensions/ex_padding.dart';
import 'package:flutter/material.dart';
import '/core/widgets/w_container.dart';
import '/core/widgets/w_shimmer.dart';

class WAppsShimmer extends StatelessWidget {
  const WAppsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return WContainer(
      borderColor: Colors.transparent,
      borderRadius: 12,
      boxShadow: [
        BoxShadow(
          blurRadius: 12,
          spreadRadius: 0,
          offset: const Offset(1, 2),
          color: (context.textTheme?.titleMedium?.color ?? Colors.black)
              .withValues(alpha: 0.08),
        ),
      ],
      child: Row(
        children: [
          // Left shimmer image
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 48,
                width: 48,
                color: Colors.grey.shade300,
              ),
            ),
          ).pR(value: 16),

          // Text shimmer blocks
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 12,
                  width: 100,
                  color: Colors.grey.shade300,
                ),
              ).pB(value: 6),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: 10,
                  width: 60,
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
