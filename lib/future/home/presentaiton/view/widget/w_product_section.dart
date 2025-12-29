
import 'package:e_commarce_site/core/constants/colors.dart';
import 'package:e_commarce_site/core/constants/dimension_theme.dart';
import 'package:e_commarce_site/core/constants/style.dart';
import 'package:e_commarce_site/core/extensions/ex_expanded.dart';
import 'package:e_commarce_site/core/extensions/ex_padding.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/s_home.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_product.dart';
import 'package:e_commarce_site/future/home/presentaiton/widget/w_offer_end_in_counter.dart';
import 'package:e_commarce_site/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class WProductSection extends StatelessWidget {
  final String lable;
  final bool isOneTDeal;
  final VoidCallback? onTap;
  const WProductSection({
    super.key,
    required this.lable,
    this.isOneTDeal = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isOneTDeal ? AppColors.lightColor() : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lable,
                style: interBold.copyWith(
                  color: !context.isDarkMode && isOneTDeal
                      ? AppColors.primary()
                      : AppColors.textPrimary(),
                  fontSize: h5,
                ),
              ).pR(),

              if (isOneTDeal)
                Row(
                  children: [
                    DiscountBadge(
                      backgroundColor: AppColors.danger,
                      imagePath: Assets.images.discount.flash.path,
                    ),
                    Spacer(),
                    CountdownTimerWidget(endTime: DateTime(2026, 12, 30)),
                  ],
                ).expd(),

              if (!isOneTDeal)
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                  ),
                  onPressed: onTap,
                  child: Text(
                    "View All",
                    style: interSemiBold.copyWith(
                      fontSize: h2,
                      color: AppColors.textPrimary(),
                    ),
                  ),
                ),
            ],
          ).pB(value: PTheme.paddingY),

          SizedBox(
            height: 194,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, index) {
                return WProduct(
                  isWished: index % 2 == 0,
                  wishAction: (val) {},
                ).pR();
              },
            ),
          ),
        ],
      ).pAll(),
    );
  }
}
