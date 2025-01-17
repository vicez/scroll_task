import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/bottom_nav_model.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.navItems,
    required this.onTap,
  });

  final List<BottomNavItem> navItems;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff0F1115),
      width: double.maxFinite,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 50,
        top: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: navItems.map((item) {
          final Size iconSize = item.iconName != 'profile'
              ? const Size(35, 35)
              : const Size(50, 50);

          return GestureDetector(
            onTap: onTap,
            child: Stack(
              children: [
                const SizedBox(width: 50),
                SvgPicture.asset(
                  'assets/icons/${item.iconName}.svg',
                  width: iconSize.width,
                  height: iconSize.height,
                  fit: BoxFit.contain,
                ),
                if (item.hasNotification || item.notificationCount != null)
                  Positioned(
                    top: 2,
                    right: 5,
                    child: Container(
                      width: 20,
                      height: 16,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xffB5B2FF),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        item.notificationCount != null
                            ? item.notificationCount.toString()
                            : '',
                        style: const TextStyle(
                          color: Color(0xff0F1115),
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
