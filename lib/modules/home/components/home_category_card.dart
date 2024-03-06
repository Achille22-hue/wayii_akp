// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/modules/category/detail_category_view.dart';

class HomeCategoryCard extends StatefulWidget {
  Map<String, dynamic> category;
  HomeCategoryCard({required this.category, Key? key}) : super(key: key);

  @override
  State<HomeCategoryCard> createState() => _HomeCategoryCardState();
}

class _HomeCategoryCardState extends State<HomeCategoryCard> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final String imageUrl =
        // ignore: prefer_interpolation_to_compose_strings
        "https://goudo-wayii.onrender.com" + widget.category["image"]['url'];
    return GestureDetector(
      onTap: () => {
        Get.to<Widget>(() => DetailCategortyView(category: widget.category))
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.h),
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColors.kTertiaire,
              borderRadius: BorderRadius.circular(20),
            ),
            // child: CachedNetworkImage(
            //     imageUrl: imageUrl,
            //     width: 40.w,
            //     fit: BoxFit.cover,
            //     errorListener: (e) => {print(e)},
            //     errorWidget: (context, url, error) {
            //       return SvgPicture.asset(
            //         AppAssets.wChillPartyCategory,
            //         width: 40.w,
            //       );
            //     }),
            child: SvgPicture.asset(
              AppAssets.wChillPartyCategory,
              width: 40.w,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            '${widget.category['label']}',
            textAlign: TextAlign.center,
            style:
                AppTypography.kFuturaMedium16.copyWith(color: AppColors.kWhite),
          ),
        ],
      ),
    );
  }
}
