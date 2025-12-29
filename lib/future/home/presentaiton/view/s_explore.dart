import 'package:e_commarce_site/core/constants/colors.dart';
import 'package:e_commarce_site/core/constants/dimension_theme.dart';
import 'package:e_commarce_site/core/constants/style.dart';
import 'package:e_commarce_site/core/extensions/ex_padding.dart';
import 'package:e_commarce_site/core/helper/responsive_halper.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/s_home.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_animated_banner.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_product.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_product_section.dart';
import 'package:e_commarce_site/future/home/presentaiton/widget/w_offer_end_in_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

// Widget categoryView(BuildContext context) {
//   return SingleChildScrollView(
//     child: Column(
//       children: [
//         Container(
//           color: AppColors.lightColor(buildContext: context),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     "One Time Deal",
//                     style: interBold.copyWith(
//                       color: !context.isDarkMode ? AppColors.primary() : null,
//                       fontSize: h5,
//                     ),
//                   ),
//                   Spacer(),
//                   CountdownTimerWidget(endTime: DateTime(2026, 12, 30)),
//                 ],
//               ).pB(value: PTheme.paddingY),

//               SizedBox(
//                 height: 194,
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 10,
//                   separatorBuilder: (_, __) => const SizedBox(width: 12),
//                   itemBuilder: (_, index) {
//                     return WProduct(
//                       isWished: index % 2 == 0,
//                       wishAction: (val) {},
//                     ).pR();
//                   },
//                 ),
//               ),
//             ],
//           ).pAll(),
//         ),

//         WAnimatedBanner().pAll(),

//         SizedBox(
//           height: 194,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: 10,
//             separatorBuilder: (_, __) => const SizedBox(width: 12),
//             itemBuilder: (_, index) {
//               return WProduct(
//                 isWished: index % 2 == 0,
//                 wishAction: (val) {},
//               ).pR();
//             },
//           ),
//         ),

//         const SizedBox(height: 20),

//         WTodaysDeal(),

//         /// 🔹 Category Grid
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: ResponsiveHelper.isDesktop(context)
//                 ? 4
//                 : ResponsiveHelper.isTab(context)
//                 ? 3
//                 : 2,
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//             childAspectRatio: 0.85,
//           ),
//           itemCount: 8,
//           itemBuilder: (_, index) {
//             return Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Text("Category $index"),
//             );
//           },
//         ),
//       ],
//     ),
//   );
// }

Widget WExplore(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        // one time product
        WProductSection(lable: "One Time Deal", isOneTDeal: true),

        WAnimatedBanner().pAll(),

        // future Prducts
        WProductSection(lable: "Future Prducts"),
        const SizedBox(height: 20),

        WTodaysDeal(),

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
