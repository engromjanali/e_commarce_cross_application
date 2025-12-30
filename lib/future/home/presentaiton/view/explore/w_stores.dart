import 'package:e_commarce_site/core/constants/colors.dart' show AppColors;
import 'package:e_commarce_site/core/constants/default_values.dart';
import 'package:e_commarce_site/core/constants/dimension_theme.dart'
    show PTheme;
import 'package:e_commarce_site/core/constants/style.dart';
import 'package:e_commarce_site/core/extensions/ex_expanded.dart';
import 'package:e_commarce_site/core/extensions/ex_padding.dart';
import 'package:e_commarce_site/core/widgets/image/m_image_payload.dart';
import 'package:e_commarce_site/core/widgets/image/w_image.dart';
import 'package:e_commarce_site/core/widgets/w_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WStores extends StatelessWidget {
  const WStores({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(PTheme.borderRadius),
      child: SizedBox(
        height: double.infinity,
        width: 200,
        child: Column(
          children: [
            WImage(
              PDefaultValues.foodImage,
              payload: MImagePayload(
                height: 66,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? AppColors.lightColor().withAlpha(15)
                    : null,
                border: Border.all(color: AppColors.lightColor()),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(PTheme.borderRadius),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      WImage(
                        PDefaultValues.profileImage,
                        payload: MImagePayload(
                          height: 40,
                          width: 40,
                          isProfileImage: true,
                          isCircular: false,
                          borderRadius: PTheme.borderRadius,
                        ),
                      ).pR(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Morning Mart",
                            style: interRegular.copyWith(
                              fontSize: h3,
                              color: AppColors.textPrimary(),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.warning,
                                size: h2,
                              ),
                              Text(
                                "${4.6}",
                                style: interRegular.copyWith(fontSize: h2),
                              ),
                            ],
                          ),
                        ],
                      ).expd(),
                    ],
                  ).pB(value: 5).pDivider(color: AppColors.lightColor()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${100} Product",
                        style: interSemiBold.copyWith(
                          color: AppColors.success,
                          fontSize: h3,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "${12} Review",
                        style: dmSansBold.copyWith(
                          color: AppColors.textDisabled(),
                          fontSize: h2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ).pAll(value: 5),
            ).expd(),
          ],
        ),
      ),
    );
  }
}
