// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:badges/badges.dart' as badges;
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/modules/notification/notification_view.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leadingWidth: 160.w,
      leading: Container(
        height: 50.h,
        width: 50.w,
        alignment: Alignment.center,
        child: SvgPicture.asset(AppAssets.wHomeLogo),
      ),
      actions: [
        CustomIcons(
          onTap: () {
            Get.to<Widget>(() => const NotificationView());
          },
          icon: AppAssets.wNotificationIcon,
        ),
        SizedBox(width: 10.0.w),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomIcons extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  const CustomIcons({required this.icon, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        width: 44.w,
        alignment: Alignment.center,
        child: badges.Badge(
          badgeContent: const Text(
            "0",
            style: TextStyle(color: Colors.white),
          ),
          badgeStyle: const badges.BadgeStyle(
            badgeColor: AppColors.kPrimary,
          ),
          // ignore: sort_child_properties_last
          child: SvgPicture.asset(icon),
          badgeAnimation: const badges.BadgeAnimation.scale(
            animationDuration: Duration(milliseconds: 1),
            colorChangeAnimationDuration: Duration(seconds: 1),
            loopAnimation: false,
            curve: Curves.fastOutSlowIn,
            colorChangeAnimationCurve: Curves.easeInCubic,
          ),
        ),
      ),
    );
  }
}
