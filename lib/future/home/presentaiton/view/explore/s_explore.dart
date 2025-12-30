import 'package:e_commarce_site/core/constants/colors.dart';
import 'package:e_commarce_site/core/constants/dimension_theme.dart';
import 'package:e_commarce_site/core/constants/style.dart';
import 'package:e_commarce_site/core/extensions/ex_padding.dart';
import 'package:e_commarce_site/core/functions/f_printer.dart';
import 'package:e_commarce_site/core/helper/responsive_halper.dart';
import 'package:e_commarce_site/core/widgets/image/w_image.dart';
import 'package:e_commarce_site/core/widgets/w_pop_button.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/s_home.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_animated_banner.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_product.dart';
import 'package:e_commarce_site/future/home/presentaiton/view/widget/w_product_section.dart';
import 'package:e_commarce_site/future/home/presentaiton/widget/w_offer_end_in_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

const List<String> items = [
  "https://uae.microless.com/cdn/no_image.jpg",
  "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgUgs8_kmuhScsx-J01d8fA1mhlCR5-1jyvMYxqCB8h3LCqcgl9Q",
  "https://media.ed.edmunds-media.com/gmc/sierra-3500hd/2018/td/2018_gmc_sierra-3500hd_f34_td_411183_1600.jpg",
  "https://www.galeanasvandykedodge.net/assets/stock/ColorMatched_01/White/640/cc_2018DOV170002_01_640/cc_2018DOV170002_01_640_PSC.jpg",
  "https://media.onthemarket.com/properties/6191869/797156548/composite.jpg",
  "https://uae.microless.com/cdn/no_image.jpg",
  "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgUgs8_kmuhScsx-J01d8fA1mhlCR5-1jyvMYxqCB8h3LCqcgl9Q",
  "https://media.ed.edmunds-media.com/gmc/sierra-3500hd/2018/td/2018_gmc_sierra-3500hd_f34_td_411183_1600.jpg",
  "https://www.galeanasvandykedodge.net/assets/stock/ColorMatched_01/White/640/cc_2018DOV170002_01_640/cc_2018DOV170002_01_640_PSC.jpg",
  "https://media.onthemarket.com/properties/6191869/797156548/composite.jpg",
  "https://uae.microless.com/cdn/no_image.jpg",
  "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgUgs8_kmuhScsx-J01d8fA1mhlCR5-1jyvMYxqCB8h3LCqcgl9Q",
  "https://media.ed.edmunds-media.com/gmc/sierra-3500hd/2018/td/2018_gmc_sierra-3500hd_f34_td_411183_1600.jpg",
  "https://www.galeanasvandykedodge.net/assets/stock/ColorMatched_01/White/640/cc_2018DOV170002_01_640/cc_2018DOV170002_01_640_PSC.jpg",
  "https://media.onthemarket.com/properties/6191869/797156548/composite.jpg",
  "https://uae.microless.com/cdn/no_image.jpg",
  "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgUgs8_kmuhScsx-J01d8fA1mhlCR5-1jyvMYxqCB8h3LCqcgl9Q",
  "https://media.ed.edmunds-media.com/gmc/sierra-3500hd/2018/td/2018_gmc_sierra-3500hd_f34_td_411183_1600.jpg",
  "https://www.galeanasvandykedodge.net/assets/stock/ColorMatched_01/White/640/cc_2018DOV170002_01_640/cc_2018DOV170002_01_640_PSC.jpg",
  "https://media.onthemarket.com/properties/6191869/797156548/composite.jpg",
  "https://uae.microless.com/cdn/no_image.jpg",
  "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgUgs8_kmuhScsx-J01d8fA1mhlCR5-1jyvMYxqCB8h3LCqcgl9Q",
  "https://media.ed.edmunds-media.com/gmc/sierra-3500hd/2018/td/2018_gmc_sierra-3500hd_f34_td_411183_1600.jpg",
  "https://www.galeanasvandykedodge.net/assets/stock/ColorMatched_01/White/640/cc_2018DOV170002_01_640/cc_2018DOV170002_01_640_PSC.jpg",
  "https://media.onthemarket.com/properties/6191869/797156548/composite.jpg",
  "https://uae.microless.com/cdn/no_image.jpg",
  "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgUgs8_kmuhScsx-J01d8fA1mhlCR5-1jyvMYxqCB8h3LCqcgl9Q",
  "https://media.ed.edmunds-media.com/gmc/sierra-3500hd/2018/td/2018_gmc_sierra-3500hd_f34_td_411183_1600.jpg",
  "https://www.galeanasvandykedodge.net/assets/stock/ColorMatched_01/White/640/cc_2018DOV170002_01_640/cc_2018DOV170002_01_640_PSC.jpg",
  "https://media.onthemarket.com/properties/6191869/797156548/composite.jpg",
];

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
        WAnimatedBanner(showIndicator: false).pAll(),

        /// new user executive
        WProductSection(lable: "New User Executive"),

        /// Top Stores
        WProductSection(lable: "Top Stores", isTopStores: true),

        /// 🔹 Category Grid
        SizedBox(
          height: 50,
          child: ListView.builder(
            itemCount: 12,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                TextButton(child: Text("button$index"), onPressed: () {}),
          ),
        ),
        MasonryGridView.count(
          shrinkWrap: true,
          crossAxisCount: ResponsiveHelper.isMobile()
              ? 2
              : ResponsiveHelper.isTab(context)
              ? 4
              : 6,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemCount: items.length,
          itemBuilder: (context, index) {
            // printer(
            //   ResponsiveHelper.isMobile()
            //       ? 2
            //       : ResponsiveHelper.isTab(context)
            //       ? 4
            //       : 6,
            // );
            return Column(
              children: [
                WProduct(isWished: true, isGridProduct: true),
                if (index % 2 == 1) Text("data"),
              ],
            );
          },
        ),
      ],
    ),
  );
}
