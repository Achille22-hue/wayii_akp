// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wayii/controllers/user_controllers.dart';
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
  final UserController cc = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        // ignore: prefer_interpolation_to_compose_strings
        "https://goudo-wayii.onrender.com" + widget.category["image"]['url'];
    return GestureDetector(
      onTap: () => {
        Get.to<Widget>(() => DetailCategortyView(category: widget.category)),
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
              // CachedNetworkImage(
              //   imageUrl: imageUrl,
              //   width: 50.w,
              //   fit: BoxFit.cover,
              //   errorWidget: (context, url, error) {
              //     // ignore: avoid_print
              //     print('Erreur lors du chargement de l\'image: $error');
              //     return SvgPicture.asset(
              //       AppAssets.wChillPartyCategory,
              //       width: 50.w,
              //     );
              //   },
              // ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                '${widget.category['label']}',
                textAlign: TextAlign.center,
                style: AppTypography.kFuturaSemiBold18
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${widget.category["events"].length.toString()} évènements',
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
