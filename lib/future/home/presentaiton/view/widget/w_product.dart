
import 'dart:ui';

import 'package:e_commarce_site/core/constants/colors.dart';
import 'package:e_commarce_site/core/constants/default_values.dart';
import 'package:e_commarce_site/core/constants/style.dart';
import 'package:e_commarce_site/core/extensions/ex_padding.dart';
import 'package:e_commarce_site/core/widgets/image/m_image_payload.dart';
import 'package:e_commarce_site/core/widgets/image/w_image.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/s_home.dart';
import 'package:e_commarce_site/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WProduct extends StatelessWidget {
  bool isWished;
  final Function(bool)? wishAction;
  WProduct({super.key, required this.isWished, this.wishAction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Image + Wish Button
          SizedBox(
            height: 120,
            child: StatefulBuilder(
              builder: (_, setLocalState) => Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: WImage(
                        PDefaultValues.foodImage,
                        payload: MImagePayload(fit: BoxFit.fill),
                      ),
                    ),
                  ),

                  /// ❤️ Wish / Unwish Button
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        setLocalState(() {
                          isWished = !isWished;
                          wishAction?.call(isWished);
                        });
                      },
                      child: Container(
                        // padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          isWished
                              ? Assets.icons.wished
                              : Assets.icons.unwished,
                          height: 12,
                          width: 12,
                          // fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            isWished
                                ? PColors.taqColorLight
                                : AppColors.background(),
                            BlendMode.srcIn,
                          ),
                        ).pAll(value: 8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 66,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Blue Color Short Dress sdfkjsd flasdjflsadj",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: productTitleTextStyle,
                ),
                Text("\$3237.87", style: productPriceTextStyle),
                Row(
                  children: [
                    Text(
                      "\$3500",
                      style: discountPercentageTextStyle.copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.textDisabled(),
                        color: AppColors.textDisabled(),
                        decorationThickness: 2,
                      ),
                    ).pR(),
                    WDiscount(label: "-5 %"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
