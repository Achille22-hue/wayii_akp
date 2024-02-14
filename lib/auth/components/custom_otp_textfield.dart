import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

class CustomOTPTextField extends StatelessWidget {
  final Function(String) onOTPInput;
  const CustomOTPTextField({required this.onOTPInput, super.key});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      handleControllers: (controllers) {},
      numberOfFields: 5,
      borderColor: AppColors.kPrimary,
      focusedBorderColor: AppColors.kPrimary,
      disabledBorderColor: Colors.transparent,
      enabledBorderColor: Colors.transparent,
      borderRadius: BorderRadius.circular(5.r),
      cursorColor: AppColors.kPrimary,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      showFieldAsBox: true,
      borderWidth: 0.5.w,
      textStyle: const TextStyle(
        color: AppColors.kPrimary, // Couleur du texte saisi
        fontSize: 20.0, // Taille de la police
      ),
      filled: true,
      fillColor: AppColors.ksignInputPlaceholdColor,
      fieldWidth: 55.w,
      decoration: const InputDecoration(
        labelStyle: TextStyle(color: AppColors.kPrimary),
      ),
      styles: [
        AppTypography.kFuturaSemiBold24,
        AppTypography.kFuturaSemiBold24,
        AppTypography.kFuturaSemiBold24,
        AppTypography.kFuturaSemiBold24,
        AppTypography.kFuturaSemiBold24,
      ],
      onSubmit: onOTPInput,
    );
  }
}
