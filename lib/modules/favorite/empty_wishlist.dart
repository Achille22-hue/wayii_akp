import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

class EmptyWishlist extends StatefulWidget {
  const EmptyWishlist({super.key});

  @override
  State<EmptyWishlist> createState() => _EmptyWishlistState();
}

class _EmptyWishlistState extends State<EmptyWishlist> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15.h),
          child: SvgPicture.asset(
            AppAssets.emptywishlist,
            height: 100.h,
            width: 100.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10.h),
        Center(
          child: Text(
            'Aucune Préférences',
            style: AppTypography.kFuturaSemiBold20
                .copyWith(color: AppColors.kWhite),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 300.h,
          child: Center(
            child: Text(
              'Rendez-vous sur les différents évènements pour les ajouter',
              style: AppTypography.kFuturaLight16
                  .copyWith(color: AppColors.kWhite),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
