import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wayii/auth%20_creator/otp_validation_view.dart';
import 'package:wayii/auth/components/auth_field.dart';
import 'package:wayii/auth/signin_view.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/widgets/buttons/primary_button.dart';

class SignAccountCreationCreator extends StatefulWidget {
  const SignAccountCreationCreator({super.key});

  @override
  State<SignAccountCreationCreator> createState() =>
      _SignAccountCreationCreatorState();
}

class _SignAccountCreationCreatorState
    extends State<SignAccountCreationCreator> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
              margin: EdgeInsets.only(top: 267.0.h),
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
                    "Inscrivez-vous",
                    textAlign: TextAlign.right,
                    style:
                        AppTypography.kSemiBold20.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 10.h),
                  Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        children: [
                          AuthField(
                            title: '',
                            hintText: 'nom de l’utilisateur*',
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              } else if (!value.isEmail) {
                                return 'Invalid email address';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 10),
                          AuthField(
                            title: '',
                            hintText: 'numéro de téléphone*',
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              } else if (value.length < 8) {
                                return 'Password should be at least 8 characters long';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                          ),
                          const SizedBox(height: 10),
                          AuthField(
                            title: '',
                            hintText: 'adresse mail*',
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              } else if (value.length < 8) {
                                return 'Password should be at least 8 characters long';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                          ),
                          const SizedBox(height: 10),
                          AuthField(
                            title: '',
                            hintText: 'mot de passe*',
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              } else if (value.length < 8) {
                                return 'Password should be at least 8 characters long';
                              }
                              return null;
                            },
                            isPassword: true,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                          ),
                          const SizedBox(height: 10),
                          AuthField(
                            title: '',
                            hintText: 'confirmer mot de passe*',
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              } else if (value.length < 8) {
                                return 'Password should be at least 8 characters long';
                              }
                              return null;
                            },
                            isPassword: true,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                          ),
                          GestureDetector(
                            onTap: () => {},
                            child: Container(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Mot de passe oublié ?',
                                textAlign: TextAlign.end,
                                style: AppTypography.kMedium12
                                    .copyWith(color: AppColors.kGrey70),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          PrimaryButton(
                            onTap: () {
                              Get.to<Widget>(
                                  () => const OtpValidationCreatorView());
                            },
                            text: 'Inscription',
                            fontSize: 20,
                          ),
                          const SizedBox(height: 5),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Vous possédez déjà un compte? ',
                              style: AppTypography.kMedium12
                                  .copyWith(color: AppColors.kGrey70),
                              children: [
                                TextSpan(
                                  text: 'Connectez-vous',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to<Widget>(() => const SignInView());
                                    },
                                  style: AppTypography.kMedium12
                                      .copyWith(color: AppColors.kPrimary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
