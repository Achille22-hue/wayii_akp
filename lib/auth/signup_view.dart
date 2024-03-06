import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wayii/auth%20_creator/signup_view.dart';
import 'package:wayii/auth/signin_view.dart';
import 'package:wayii/auth/signup_account_creation.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/widgets/buttons/primary_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  int selectedValue = 1;
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
            SizedBox(height: 50.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.r),
                ),
                color: AppColors.kSecondarywithOpacity5,
              ),
              width: Get.width,
              margin: EdgeInsets.only(top: 535.0.h),
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
                    "Que voulez-vous faire sur Wayii",
                    textAlign: TextAlign.left,
                    style: AppTypography.kFuturaSemiBold24
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 10.h),
                  Theme(
                    data: ThemeData.light().copyWith(
                      unselectedWidgetColor: Colors.white,
                      disabledColor: Colors.white.withOpacity(0.5),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              activeColor: AppColors.kWhite,
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as int;
                                });
                              },
                            ),
                            Text(
                              'Acheter des tickets',
                              style: AppTypography.kFuturaMedium16
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              activeColor: AppColors.kWhite,
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as int;
                                });
                                Get.to<Widget>(() => const SignUpCreatorView());
                              },
                            ),
                            Text(
                              'Créer des évènements',
                              style: AppTypography.kFuturaMedium16
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  PrimaryButton(
                    onTap: () {
                      Get.to<Widget>(() => const SignAccountCreation());
                    },
                    text: 'Suivant',
                    fontSize: 20.sp,
                  ),
                  const SizedBox(height: 5),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Vous possédez déjà un compte? ',
                      style: AppTypography.kFuturaSemiBold14
                          .copyWith(color: AppColors.kGrey70),
                      children: [
                        TextSpan(
                          text: 'Connectez-vous',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to<Widget>(() => const SignInView());
                            },
                          style: AppTypography.kFuturaSemiBold14
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
}
