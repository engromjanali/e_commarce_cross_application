import 'dart:async';

import 'package:e_commarce_site/core/constants/colors.dart';
import 'package:e_commarce_site/core/constants/default_values.dart';
import 'package:e_commarce_site/core/constants/dimension_theme.dart';
import 'package:e_commarce_site/core/constants/style.dart';
import 'package:e_commarce_site/core/extensions/ex_box_constants.dart';
import 'package:e_commarce_site/core/extensions/ex_build_context.dart';
import 'package:e_commarce_site/core/extensions/ex_expanded.dart';
import 'package:e_commarce_site/core/extensions/ex_padding.dart';
import 'package:e_commarce_site/core/functions/f_is_null.dart';
import 'package:e_commarce_site/core/functions/f_printer.dart';
import 'package:e_commarce_site/core/helper/responsive_halper.dart';
import 'package:e_commarce_site/core/widgets/image/m_image_payload.dart';
import 'package:e_commarce_site/core/widgets/image/w_image.dart';
import 'package:e_commarce_site/core/widgets/w_container.dart';
import 'package:e_commarce_site/core/widgets/w_custom_checkbox.dart';
import 'package:e_commarce_site/core/widgets/w_text_field.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_animated_banner.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_populer.dart';
import 'package:e_commarce_site/future/home/presentaiton/widget/w_nav_bar.dart';
import 'package:e_commarce_site/future/home/presentaiton/widget/w_offer_end_in_counter.dart';
import 'package:e_commarce_site/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart'
    show ContextExtensionss;

class SHome extends StatefulWidget {
  const SHome({super.key});

  @override
  State<SHome> createState() => _SHomeState();
}

class _SHomeState extends State<SHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Header
            Container(
              color: AppColors.primary(),
              child: SafeArea(
                child: Column(
                  children: [
                    gapY(10),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, Welcome 👋",
                              style: encodeSansRegular.copyWith(fontSize: h3),
                            ),
                            Text(
                              "Albert Stevano",
                              style: encodeSansBold.copyWith(fontSize: h5),
                            ),
                          ],
                        ),
                        const Spacer(),
                        WImage(
                          PDefaultValues.profileImage,
                          payload: MImagePayload(
                            height: 50,
                            width: 50,
                            isCircular: true,
                            fit: BoxFit.fill,
                            isProfileImage: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TabBar(
                      isScrollable: true,
                      indicatorColor: context.indicatorColor,
                      labelStyle: interSemiBold.copyWith(
                        fontSize: h4,
                        color: PColors.backGroundColorLight,
                      ),
                      unselectedLabelStyle: interRegular.copyWith(
                        fontSize: h3,
                        color: PColors.backGroundColorLight,
                      ),
                      tabAlignment: TabAlignment.start,
                      tabs: const [
                        Tab(text: "Explore"),
                        Tab(text: "Sports"),
                        Tab(text: "Women's"),

                        Tab(text: "Explore"),
                        Tab(text: "Sports"),
                        Tab(text: "Women's"),

                        Tab(text: "Explore"),
                        Tab(text: "Sports"),
                        Tab(text: "Women's"),

                        Tab(text: "Explore"),
                        Tab(text: "Sports"),
                        Tab(text: "Women's"),
                      ],
                    ),
                  ],
                ).pH(),
              ),
            ),

            WTextField(
              hintText: "What are you looking for?",
              suffixIcon: LayoutBuilder(
                builder: (context, constants) {
                  constants.printConstants(name: "Search Icon");
                  return Container(
                    height: constants.minHeight,
                    width: constants.minHeight * (4 / 3),
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.primary(),
                      borderRadius: BorderRadius.circular(PTheme.borderRadius),
                    ),
                    child: const Icon(Icons.search, color: Colors.white),
                  );
                },
              ),
            ).pAll(),

            Expanded(
              child: TabBarView(
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  _categoryView(context),
                  brandView(context),
                  popularView(),
                  _categoryView(context),
                  brandView(context),
                  popularView(),
                  _categoryView(context),
                  brandView(context),
                  popularView(),
                  _categoryView(context),
                  brandView(context),
                  popularView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ================= Views =================
Widget _categoryView(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        // one time product
        WProductSection(lable: "One Time Deal", isOneTDeal: true),

        WAnimatedBanner().pAll(),

        // future Prducts
        WProductSection(lable: "Future Prducts"),
        const SizedBox(height: 20),

        /// 🔹 Category Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveHelper.isDesktop(context)
                ? 4
                : ResponsiveHelper.isTab(context)
                ? 3
                : 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemCount: 8,
          itemBuilder: (_, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text("Category $index"),
            );
          },
        ),
      ],
    ),
  );
}

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

class WDiscount extends StatelessWidget {
  final String label;
  const WDiscount({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return WContainer(
      borderInDark: true,
      borderColor: AppColors.danger,
      verticalPadding: 3,
      horizontalPadding: 5,
      borderRadius: 5,
      color: context.isDarkMode ? Color(0x26FF5555) : Color(0x0dFF5555),
      child: Text(
        label,
        style: discountPercentageTextStyle.copyWith(
          color: AppColors.danger,
          // fontSize: h1,
        ),
      ),
    );
  }
}

class DiscountBadge extends StatelessWidget {
  final String discountText;
  final String? imagePath;
  final Color backgroundColor;
  final Color textColor;

  const DiscountBadge({
    super.key,
    this.discountText = "Upto 20%",
    this.backgroundColor = const Color(0xFFE63946),
    this.textColor = Colors.white,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: [
        if (isNotNull(imagePath))
          Image.asset(imagePath!, height: 30, fit: BoxFit.fitHeight),
        Positioned(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              discountText,
              style: dmSansBold.copyWith(fontSize: h1, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

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
      color: isOneTDeal ? PColors().lightColor(buildContext: context) : null,
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
