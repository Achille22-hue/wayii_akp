import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wayii/auth/components/custom_otp_textfield.dart';
import 'package:wayii/auth/signin_view.dart';
import 'package:wayii/controllers/user_controllers.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

class OtpValidationView extends StatefulWidget {
  const OtpValidationView({super.key});

  @override
  State<OtpValidationView> createState() => _OtpValidationViewState();
}

class _OtpValidationViewState extends State<OtpValidationView> {
  final UserController cc = Get.find<UserController>();
  int selectedValue = 1;
  bool isLoadingdata = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondarywithOpacity5,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              AppAssets.wSignUpBG,
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
                  Row(
                    children: [
                      Text(
                        "Validation",
                        textAlign: TextAlign.left,
                        style: AppTypography.kFuturaSemiBold24
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(width: 10.w),
                      isLoadingdata
                          ? const CircularProgressIndicator(
                              strokeWidth: 1,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.kWhite),
                            )
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Veuillez finaliser votre inscription en entrant le code envoyé à l’adresse mail  ${cc.userData.value['email']}",
                    textAlign: TextAlign.left,
                    style: AppTypography.kFuturaMedium14
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 25.h),
                  CustomOTPTextField(
                    onOTPInput: (value) async {
                      toogleIsloading(true);
                      await cc.otpVerification(value);
                      toogleIsloading(false);
                    },
                  ),
                  SizedBox(height: 40.h),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Vous n’avez pas reçu de code? ',
                      style: AppTypography.kFuturaMedium12
                          .copyWith(color: AppColors.kGrey70),
                      children: [
                        TextSpan(
                          text: 'Renvoyer un code',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to<Widget>(() => const SignInView());
                            },
                          style: AppTypography.kFuturaMedium12
                              .copyWith(color: AppColors.kPrimary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toogleIsloading(value) {
    setState(() {
      isLoadingdata = value;
    });
  }
}
