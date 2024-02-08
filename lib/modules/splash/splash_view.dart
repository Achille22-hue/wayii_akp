import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/modules/onboarding/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadAssetsAndNavigate();
  }

  Future<void> loadAssetsAndNavigate() async {
    await precacheImages();
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAll<Widget>(() => const OnboardingView());
    });
  }

  Future<void> precacheImages() async {
    await Future.wait(
      AppAssets.allImages.map(
        (String imagePath) => precacheImage(
          AssetImage(imagePath),
          context,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: AppColors.kPrimary,
        child: Column(
          children: [
            const Spacer(),
            const Spacer(),
            SvgPicture.asset(
              AppAssets.wlogo,
              height: 150.h,
              width: 150.w,
            ),
            const SizedBox(height: 10),
            const Spacer(),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.kWhite),
            ),
            SizedBox(height: 133.h),
          ],
        ),
      ),
    );
  }
}
