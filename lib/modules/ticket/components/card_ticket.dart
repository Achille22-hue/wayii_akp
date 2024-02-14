import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

class CardTicket extends StatelessWidget {
  final bool isValable;
  const CardTicket({required this.isValable, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.w),
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: 330.h,
                height: 150.h,
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
                decoration: const BoxDecoration(
                  color: AppColors.kTertiaire,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
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
                      width: 140.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Evènement",
                            style: AppTypography.kFuturaLight12
                                .copyWith(color: AppColors.kWhite),
                          ),
                          Text(
                            "CBGB Public Enemy",
                            style: AppTypography.kFuturaSemiBold20
                                .copyWith(color: AppColors.kWhite),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 150.h,
                  width: 55.h,
                  decoration: BoxDecoration(
                    color: isValable ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        isValable ? "VALABLE" : "EXPIRE",
                        style: AppTypography.kFuturaMedium20.copyWith(
                          color: AppColors.kWhite,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 42.h,
                child: SvgPicture.asset(
                  AppAssets.wSeparationTiket,
                  height: 180.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
