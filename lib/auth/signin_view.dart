import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wayii/auth/components/auth_field.dart';
import 'package:wayii/auth/signup_view.dart';
import 'package:wayii/controllers/user_controllers.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/modules/home/home_view.dart';
import 'package:wayii/widgets/buttons/primary_button.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserController cc = Get.find<UserController>();
  bool isLoadingdata = false;

  final UserController cs = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (cs.isConnect.value) {
        Get.to<Widget>(() => const HomeView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondarywithOpacity5,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              AppAssets.wOnboardingBG3,
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
              margin: EdgeInsets.only(top: 470.0.h),
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
                        "Connectez-vous",
                        textAlign: TextAlign.right,
                        style: AppTypography.kFuturaSemiBold20
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(width: 10.w),
                      isLoadingdata
                          ? const CircularProgressIndicator(
                              strokeWidth: 1,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.kWhite),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        children: [
                          AuthField(
                            title: '',
                            hintText: 'email*',
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'adresse mail est requis.';
                              } else if (!value.isEmail) {
                                return 'adresse mail invalide.';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 10),
                          AuthField(
                            title: '',
                            hintText: 'mot de passe*',
                            controller: _passwordController,
                            validator: (value) {
                              return isPassword(value);
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
                                style: AppTypography.kFuturaSemiBold14
                                    .copyWith(color: AppColors.kGrey70),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          PrimaryButton(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                String identifier = _emailController.text;
                                String password = _passwordController.text;
                                toogleIsloading(true);
                                await cc.loginClient({
                                  'identifier': identifier,
                                  'password': password
                                });
                                toogleIsloading(false);
                              }
                            },
                            text: 'Connexion',
                            fontSize: 20.sp,
                            key: const Key('connexionButton'),
                          ),
                          SizedBox(height: 3.h),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Vous ne possédez pas de compte? ',
                              style: AppTypography.kFuturaSemiBold14
                                  .copyWith(color: AppColors.kGrey70),
                              children: [
                                TextSpan(
                                  text: 'Inscrivez-vous',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to<Widget>(() => const SignUpView());
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

  isPassword(value) {
    if (value == null || value.isEmpty) {
      return 'Mot de passe requis';
    } else if (value.length < 8) {
      return 'Le mot de passe doit comporter au moins 8 caractères';
    }
    return null;
  }
}
