// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

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
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 0),
        child: Container(
          width: 180.w,
          height: 175.h,
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
                width: 70.w,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                widget.category['category_name'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${widget.category['nbr_evern']} évènements',
                textAlign: TextAlign.center,
                style: AppTypography.kLight14.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
