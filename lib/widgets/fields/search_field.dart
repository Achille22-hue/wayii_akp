import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnabled;
  final bool isFilterIcon;
  final String? hintText;
  final void Function(String)? onChanged;
  const SearchField({
    required this.controller,
    this.isEnabled = true,
    this.isFilterIcon = true,
    this.onChanged,
    this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      enabled: isEnabled,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.ksignInputBg,
        hintText: hintText ?? 'Rechercher un évènement',
        hintStyle: AppTypography.kFuturaMedium18
            .copyWith(color: AppColors.ksignInputPlaceholdColor),
        border: InputBorder.none,
        prefixIcon: Padding(
          padding: EdgeInsets.all(10.h),
          child: SvgPicture.asset(
            AppAssets.wSearch,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
