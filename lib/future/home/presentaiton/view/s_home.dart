import 'package:e_commarce_site/core/constants/colors.dart';
import 'package:e_commarce_site/core/constants/default_values.dart';
import 'package:e_commarce_site/core/constants/dimension_theme.dart';
import 'package:e_commarce_site/core/extensions/ex_expanded.dart';
import 'package:e_commarce_site/core/extensions/ex_padding.dart';
import 'package:e_commarce_site/core/functions/f_is_null.dart';
import 'package:e_commarce_site/core/helper/responsive_halper.dart';
import 'package:e_commarce_site/core/widgets/image/m_image_payload.dart';
import 'package:e_commarce_site/core/widgets/image/w_image.dart';
import 'package:e_commarce_site/core/widgets/w_container.dart';
import 'package:e_commarce_site/core/widgets/w_text_field.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_animated_banner.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_populer.dart';
import 'package:e_commarce_site/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';

class SHome extends StatefulWidget {
  const SHome({super.key});

  @override
  State<SHome> createState() => _SHomeState();
}

class _SHomeState extends State<SHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: _BottomNavBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Header
            Container(
              color: context.theme.primaryColor,
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
                              style: context.textTheme.bodyMedium,
                            ),
                            Text(
                              "Albert Stevano",
                              style: context.textTheme.bodySmall,
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
                      isScrollable: ResponsiveHelper.isMobilePhone(),
                      tabs: const [
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
              suffixIcon: Icon(Icons.search),
            ).pAll(),

            Expanded(
              child: TabBarView(
                children: [
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

  /// ================= Views =================
  Widget _categoryView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: PColors().lightColor(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("One Time Deal"),
                    Spacer(),
                    WContainer(
                      verticalPadding: 5,
                      horizontalPadding: 5,
                      borderInDark: true,
                      child: Row(
                        children: [
                          Text(
                            "Ends in",
                            style: context.textTheme.bodySmall,
                          ).pR(),
                          Text(
                            "06: 02: 04:08",
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ).pB(value: PTheme.paddingY),

                SizedBox(
                  height: 280,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (_, index) {
                      final isWished = index % 2 == 0;

                      return SizedBox(
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// 🔹 Image + Wish Button
                            Stack(
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
                                      PDefaultValues.profileImage,
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
                                      // setState(() {
                                      //   if (index%2==0) {
                                      //   } else {
                                      //     _wishedItems.add(index);
                                      //   }
                                      // });
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
                                              : context
                                                    .theme
                                                    .scaffoldBackgroundColor,
                                          BlendMode.srcIn,
                                        ),
                                      ).pAll(value: 8),
                                    ),
                                  ),
                                ),
                              ],
                            ).expd(),

                            const SizedBox(height: 8),

                            Text(
                              "Blue Color Short Dress sdfkjsd flasdjflsadj",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ).pB(),

                            Text(
                              "\$3237.87",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ).pB(),

                            Row(
                              children: [
                                Text(
                                  "\$3500",
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ).pR(),
                                const Text(
                                  "-5 %",
                                  style: TextStyle(
                                    color: PColors.taqColorLight,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ).pAll(),
          ),

          WAnimatedBanner().pAll(),

          SizedBox(
            height: 280,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, index) {
                final isWished = index % 2 == 0;

                return SizedBox(
                  width: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 🔹 Image + Wish Button
                      Stack(
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
                                PDefaultValues.profileImage,
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
                                // setState(() {
                                //   if (index%2==0) {
                                //   } else {
                                //     _wishedItems.add(index);
                                //   }
                                // });
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
                                        : context.theme.scaffoldBackgroundColor,
                                    BlendMode.srcIn,
                                  ),
                                ).pAll(value: 8),
                              ),
                            ),
                          ),
                        ],
                      ).expd(),

                      const SizedBox(height: 8),

                      Text(
                        "Blue Color Short Dress sdfkjsd flasdjflsadj",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ).pB(),

                      Text(
                        "\$3237.87",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ).pB(),

                      Row(
                        children: [
                          Text(
                            "\$3500",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ).pR(),
                          const Text(
                            "-5 %",
                            style: TextStyle(color: PColors.taqColorLight),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ).pAll(),

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
}

class _BottomNavBar extends StatefulWidget {
  const _BottomNavBar();

  @override
  State<_BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<_BottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(blurRadius: 12, color: Colors.black.withOpacity(.1)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navItem(Assets.icons.bottomNav.hoome, 0, "Home"),
          _navItem(Assets.icons.bottomNav.categories, 1, "Categories"),
          _navItem(Assets.icons.bottomNav.card, 2, "Card", count: 8),
          _navItem(Assets.icons.bottomNav.stores, 3, "Stores"),
          _navItem(Assets.icons.bottomNav.menu, 4, "Menu"),
        ],
      ),
    );
  }

  Widget _navItem(String icon, int index, String label, {int? count}) {
    final isActive = selectedIndex == index;

    return Stack(
      children: [
        Container(
          decoration: isActive
              ? BoxDecoration(
                  color: context.theme.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                )
              : null,
          child: IconButton(
            onPressed: () {
              setState(() => selectedIndex = index);
            },
            icon: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 20,
                  width: 20,
                  // fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    isActive
                        ? PColors.primayTextColorDark
                        : context.theme.disabledColor,

                    BlendMode.srcIn,
                  ),
                ).pR(),
                if (isActive)
                  Text(
                    label,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: PColors.primayTextColorDark,
                    ),
                  ),
              ],
            ),
          ).pH(),
        ),

        if (isNotNull(count) && !isActive)
          Positioned(
            right: 8,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Text("$count", style: context.textTheme.bodySmall),
            ),
          ),
      ],
    );
  }
}
