import 'package:e_commarce_site/core/constants/colors.dart';
import 'package:e_commarce_site/core/constants/style.dart';
import 'package:e_commarce_site/core/extensions/ex_expanded.dart';
import 'package:e_commarce_site/core/extensions/ex_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class BannerItem {
  final Color color;
  final String title;

  BannerItem({required this.color, required this.title});
}

class WAnimatedBanner extends StatefulWidget {
  const WAnimatedBanner({super.key});

  @override
  State<WAnimatedBanner> createState() => _WAnimatedBannerState();
}

class _WAnimatedBannerState extends State<WAnimatedBanner> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<BannerItem> banners = [
    BannerItem(color: Colors.blue, title: "Big Sale"),
    BannerItem(color: Colors.orange, title: "New Arrival"),
    BannerItem(color: Colors.green, title: "Special Offer"),
  ];

  @override
  void initState() {
    super.initState();
    _autoSlide();
  }

  void _autoSlide() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      _currentIndex = (_currentIndex + 1) % banners.length;
      _controller.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );

      _autoSlide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 🔹 Sliding Banners
        SizedBox(
          height: 110,
          width: double.infinity,
          child: PageView.builder(
            controller: _controller,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (_, index) {
              final item = banners[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: item.color,
                  ),
                  // alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.amber,
                        // child: Text("data"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 15,
                          width: 67,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                            ),
                            boxShadow: [
                              BoxShadow(color: AppColors.primary()),
                              BoxShadow(
                                color: AppColors.primary().withAlpha(20),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Shop Now",
                                textAlign: TextAlign.center,
                                style: interRegular.copyWith(fontSize: h1),
                              ),
                              Icon(Icons.arrow_forward_ios_outlined, size: h1),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ).pB(),

        // /// 🔹 Animated Indicator (Bottom Center)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 5,
              width: _currentIndex == index ? 22 : 8,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? context.theme.primaryColor
                    : AppColors.textDisabled(),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
