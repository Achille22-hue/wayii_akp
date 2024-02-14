// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/modules/category/detail_category_view.dart';

class CategoryCard extends StatefulWidget {
  Map<String, dynamic> category;
  CategoryCard({required this.category, Key? key}) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Get.to<Widget>(() => DetailCategortyView()),
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 10.w, left: 0.w),
        margin: EdgeInsets.symmetric(horizontal: 5.h),
        child: Container(
          width: 180.w,
          height: 150.h,
          padding: EdgeInsets.all(14.h),
          decoration: BoxDecoration(
            color: AppColors.kTertiaire,
            borderRadius: BorderRadius.circular(20.5),
          ),
          child: Column(
            children: [
              // Image.network(imageUrl, height: 70, fit: BoxFit.cover),
              SvgPicture.asset(
                AppAssets.wChillPartyCategory,
                width: 50.w,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                widget.category['category_name'],
                textAlign: TextAlign.center,
                style: AppTypography.kFuturaSemiBold18
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${widget.category['nbr_evern']} évènements',
                textAlign: TextAlign.center,
                style:
                    AppTypography.kFuturaLight14.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
