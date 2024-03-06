import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

class EventMonthCard extends StatelessWidget {
  const EventMonthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 400.h,
      ),
      height: 150.h,
      margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
      decoration: const BoxDecoration(
        color: AppColors.kTertiaire,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 130.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                image: AssetImage(AppAssets.wEventchillBG),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 5.h,
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Evènement",
                  style: AppTypography.kFuturaLight12
                      .copyWith(color: AppColors.kWhite),
                ),
                Text(
                  "Alcochete MAIA Santos",
                  style: AppTypography.kFuturaSemiBold20
                      .copyWith(color: AppColors.kWhite),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Tickets",
                          style: AppTypography.kFuturaLight12
                              .copyWith(color: AppColors.kWhite),
                        ),
                        Text(
                          "02",
                          style: AppTypography.kFuturaSemiBold14
                              .copyWith(color: AppColors.kWhite),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Date",
                          style: AppTypography.kFuturaLight12
                              .copyWith(color: AppColors.kWhite),
                        ),
                        Text(
                          "Mar 17 Jul",
                          style: AppTypography.kFuturaSemiBold14
                              .copyWith(color: AppColors.kWhite),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
