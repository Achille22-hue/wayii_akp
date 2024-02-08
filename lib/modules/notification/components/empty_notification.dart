import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15.h),
          child: SvgPicture.asset(
            AppAssets.wEmptyNotification,
            height: 100.h,
            width: 100.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10.h),
        Center(
          child: Text(
            'Aucune Notifications',
            style: AppTypography.kMedium16.copyWith(color: AppColors.kWhite),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            'Patientez, elles seront bientôt dans votre box',
            style: AppTypography.kLight14.copyWith(color: AppColors.kWhite),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
