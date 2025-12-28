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
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          /// 🔹 Sliding Banners
          PageView.builder(
            controller: _controller,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (_, index) {
              final item = banners[index];
              return Container(
                decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),

          /// 🔹 Animated Indicator (Bottom Center)
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                banners.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentIndex == index ? 22 : 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? context.theme.primaryColor
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
