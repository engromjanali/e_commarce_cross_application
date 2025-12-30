import 'package:e_commarce_site/core/constants/colors.dart';
import 'package:e_commarce_site/core/constants/style.dart';
import 'package:e_commarce_site/core/extensions/ex_padding.dart';
import 'package:e_commarce_site/core/functions/f_is_null.dart';
import 'package:e_commarce_site/core/widgets/w_icon.dart';
import 'package:e_commarce_site/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int)? currentPage;
  const BottomNavBar({super.key, this.currentPage});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.background(buildContext: null),
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(blurRadius: 12, color: Colors.black.withOpacity(.1)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navItem(Assets.icons.bottomNav.home, 0, "Home"),
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
          height: 30,
          decoration: isActive
              ? BoxDecoration(
                  color: AppColors.primary(),
                  borderRadius: BorderRadius.circular(20),
                )
              : null,
          child: GestureDetector(
            onTap: () {
              setState(() => selectedIndex = index);
              widget.currentPage?.call(selectedIndex);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                WIcon(
                  path: icon,
                  height: isActive ? 16 : 24,
                  width: isActive ? 16 : 24,
                  fit: BoxFit.contain,
                  color: isActive ? Colors.white : AppColors.textDisabled(),
                ).pR(),
                if (isActive)
                  Text(
                    label,
                    style: interSemiBold.copyWith(color: Colors.white),
                  ),
              ],
            ),
          ).pH(value: 14).pV(value: 7),
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
              child: Text(
                "$count",
                style: interRegular.copyWith(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
