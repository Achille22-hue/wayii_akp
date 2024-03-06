import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayii/auth/signin_view.dart';
import 'package:wayii/controllers/user_controllers.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/modules/lendingPage/lending_page.dart';
import 'package:wayii/modules/onboarding/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final UserController cs = Get.find<UserController>();
  bool isFirstTimeUser = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImages();
  }

  @override
  void initState() {
    super.initState();
    checkFirstTimeUser();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        if (isFirstTimeUser) {
          Get.to<Widget>(() => const OnboardingView());
        } else {
          cs.isConnect.value
              ? Get.offAll<Widget>(() => const LandingPage())
              : Get.to<Widget>(() => const SignInView());
        }
      });
    });
  }

  Future<void> checkFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    setState(() {
      isFirstTimeUser = isFirstTime;
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
