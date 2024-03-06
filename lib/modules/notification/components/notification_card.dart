import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

class NotificationCard extends StatelessWidget {
  final Map<String, dynamic> notifications;
  const NotificationCard({required this.notifications, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.w),
      child: Stack(
        children: [
          Card(
            color: AppColors.kTertiaire,
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
              leading: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: SvgPicture.asset(AppAssets.wNotificationActive),
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notifications['message'],
                      style: AppTypography.kFuturaMedium16
                          .copyWith(color: AppColors.kWhite),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      notifications['date'],
                      style: AppTypography.kFuturaMedium16
                          .copyWith(color: AppColors.kWhite),
                    ),
                  ],
                ),
              ),
            ),
          ),
          notifications['isView'] == "true"
              ? Positioned(
                  right: 0,
                  child: SvgPicture.asset(AppAssets.wNewNotification),
                )
              : Container(),
        ],
      ),
    );
  }
}
