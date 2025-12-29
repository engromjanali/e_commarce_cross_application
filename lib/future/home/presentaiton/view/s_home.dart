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
import 'package:e_commarce_site/future/home/presentaiton/view/s_explore.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_animated_banner.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_populer.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_product_section.dart';
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
                  WExplore(context),
                  brandView(context),
                  popularView(),
                  WExplore(context),
                  brandView(context),
                  popularView(),
                  WExplore(context),
                  brandView(context),
                  popularView(),
                  WExplore(context),
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

class WTodaysDeal extends StatelessWidget {
  const WTodaysDeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 313,
      decoration: BoxDecoration(
        color: AppColors.lightColor(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 248,
            decoration: BoxDecoration(
              color: AppColors.primary(),
              borderRadius: BorderRadius.circular(PTheme.borderRadius),
            ),
          ).pR().expd(value: 40),
          Container(
            child: Column(
              children: [
                WImage(
                  "https://res.cloudinary.com/dskavcx9z/image/upload/v1767030642/Rectangle_1_nqnuvf.png",
                  payload: MImagePayload(
                    height: 210,
                    width: 210,
                    borderRadius: 5,
                  ),
                ),
              ],
            ),
          ).expd(value: 60),
        ],
      ).pAll(),
    ).pAll();
  }
}
