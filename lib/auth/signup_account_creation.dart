import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wayii/auth/components/auth_field.dart';
import 'package:wayii/auth/signin_view.dart';
import 'package:wayii/controllers/user_controllers.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/widgets/buttons/primary_button.dart';

class SignAccountCreation extends StatefulWidget {
  const SignAccountCreation({super.key});

  @override
  State<SignAccountCreation> createState() => _SignAccountCreationState();
}

class _SignAccountCreationState extends State<SignAccountCreation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pseudoController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final UserController cc = Get.find<UserController>();
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
                  Row(
                    children: [
                      Text(
                        "Inscrivez-vous",
                        textAlign: TextAlign.right,
                        style: AppTypography.kSemiBold20
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
                  Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        children: [
                          AuthField(
                            title: '',
                            hintText: 'nom de l’utilisateur*',
                            controller: _pseudoController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nom de l’utilisateur est requis';
                              } else if (value.length < 4) {
                                return 'Le nom de l’utilisateur dois dépasser 4 caractères.';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 10),
                          AuthField(
                            title: '',
                            hintText: 'numéro de téléphone*',
                            controller: _phoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Le numéro de téléphone est requis';
                              } else if (value.length < 8) {
                                return 'Le numéro de téléphone dois dépasser 7 caractères.';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 10),
                          AuthField(
                            title: '',
                            hintText: 'adresse mail*',
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'adresse mail est requis.';
                              } else if (!value.isEmail) {
                                return 'adresse mail invalide.';
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
                                return 'mot de passe est requis';
                              } else if (value.length < 8) {
                                return 'Mot de passe dois dépasser ou égale à 8 caractères.';
                              }
                              return null;
                            },
                            isPassword: true,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 10),
                          AuthField(
                            title: '',
                            hintText: 'confirmer mot de passe*',
                            controller: _confirmPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirmation de mot de passe est requis';
                              } else if (value.length < 8) {
                                return 'Mot de passe dois dépasser ou égale à 8 caractères.';
                              } else if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                return 'Les mots de passe ne correspondent pas.';
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
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                String email = _emailController.text;
                                String password = _passwordController.text;
                                String username = _emailController.text;
                                String fullname = _pseudoController.text;
                                String phone = _phoneController.text;

                                toogleIsloading();
                                await cc.registerClient({
                                  "email": email,
                                  "username": username,
                                  "password": password,
                                  "fullname": fullname,
                                  "phone": phone,
                                  "type": "client"
                                });
                                toogleIsloading();
                              }
                            },
                            text: 'Inscription',
                            fontSize: 20,
                            key: const Key("Inscription"),
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

  void toogleIsloading() {
    setState(() {
      isLoadingdata = !isLoadingdata;
    });
  }
}
