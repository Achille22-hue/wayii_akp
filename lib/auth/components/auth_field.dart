import 'package:flutter/material.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

class AuthField extends StatefulWidget {
  final String title;
  final String hintText;
  final Color? titleColor;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final int? maxLines;
  const AuthField({
    required this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    this.titleColor,
    this.maxLines,
    this.textInputAction,
    this.keyboardType,
    this.isPassword = false,
    super.key,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          obscureText: widget.isPassword ? isObscure : false,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          style: AppTypography.kMedium14.copyWith(color: AppColors.kWhite),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.ksignInputBg,
            hintText: widget.hintText,
            hintStyle:
                const TextStyle(color: AppColors.ksignInputPlaceholdColor),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }
}
