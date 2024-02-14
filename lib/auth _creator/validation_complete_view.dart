import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wayii/auth/signin_view.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/widgets/buttons/primary_button.dart';

class ValidationCompletCreatorView extends StatefulWidget {
  const ValidationCompletCreatorView({super.key});

  @override
  State<ValidationCompletCreatorView> createState() =>
      _ValidationCompletCreatorViewState();
}

class _ValidationCompletCreatorViewState
    extends State<ValidationCompletCreatorView> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondarywithOpacity5,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              AppAssets.wSignUpCreatorBG,
              width: MediaQuery.of(context).size.width,
              height: Get.height,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 50),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.r),
                ),
                color: AppColors.kSecondarywithOpacity5,
              ),
              width: Get.width,
              margin: EdgeInsets.only(top: 491.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: SvgPicture.asset(AppAssets.wRectangle),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "Validation",
                    textAlign: TextAlign.left,
                    style: AppTypography.kFuturaSemiBold24
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 20.h),
                  SvgPicture.asset(AppAssets.wValidationClomplete),
                  SizedBox(height: 20.h),
                  Text(
                    "Votre inscription a été validé et votre compte est à présent créé",
                    textAlign: TextAlign.left,
                    style: AppTypography.kFuturaMedium24
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 22.h),
                  PrimaryButton(
                    onTap: () {
                      Get.to<Widget>(() => const SignInView());
                    },
                    text: 'Connexion',
                    fontSize: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
