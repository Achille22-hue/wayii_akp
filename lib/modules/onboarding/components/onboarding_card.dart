import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/models/onboarding.dart';

class OnboardingCard extends StatelessWidget {
  final Onboarding onboarding;
  const OnboardingCard({required this.onboarding, super.key});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 1400),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            onboarding.title,
            textAlign: TextAlign.center,
            style:
                AppTypography.kSemiBold32.copyWith(color: AppColors.kPrimary),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Text(
              onboarding.info,
              textAlign: TextAlign.center,
              style: AppTypography.kMedium14.copyWith(color: AppColors.kWhite),
            ),
          ),
        ],
      ),
    );
  }
}
