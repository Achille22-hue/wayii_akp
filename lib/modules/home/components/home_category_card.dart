// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

class HomeCategoryCard extends StatefulWidget {
  Map<String, dynamic> category;
  HomeCategoryCard({required this.category, Key? key}) : super(key: key);

  @override
  State<HomeCategoryCard> createState() => _HomeCategoryCardState();
}

class _HomeCategoryCardState extends State<HomeCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.h),
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColors.kTertiaire,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              AppAssets.wChillPartyCategory,
              width: 40,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            widget.category['category_name'],
            textAlign: TextAlign.center,
            style: AppTypography.kMedium14.copyWith(color: AppColors.kWhite),
          ),
        ],
      ),
    );
  }
}
