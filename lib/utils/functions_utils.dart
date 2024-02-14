import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

class FunctionsUtils {
  static pushAlert(type, message) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        message.toString(),
        style: AppTypography.kFuturaMedium16.copyWith(color: AppColors.kWhite),
        textAlign: TextAlign.center,
      ),
      backgroundColor: type == 400 ? Colors.red : Colors.green,
      margin: EdgeInsets.zero,
      borderRadius: 0,
      padding: EdgeInsets.only(top: 15.h, bottom: 2.h),
    );
  }

  static endpointError(responseBody) {
    Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
    if (jsonResponse.containsKey('error') &&
        jsonResponse['error'].containsKey('message')) {
      String errorMessage = jsonResponse['error']['message'];
      return errorMessage;
    } else {
      return null;
    }
  }
}
