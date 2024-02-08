import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wayii/auth/otp_validation_view.dart';
import 'package:wayii/auth/validation_complete_view.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/modules/lendingPage/lending_page.dart';

class UserController extends GetxController {
  late Rx<bool> isConnect = Rx<bool>(false);
  final String url = "https://goudo-wayii.onrender.com/api";
  late Rx<Map> userData = Rx<Map>({});
  late Rx<String> username = Rx<String>("");
  late Rx<String> jwt = Rx<String>("");

  Future<void> loginClient(Map<String, dynamic> formData) async {
    final String loginClientEndpoint = '$url/auth/local/';
    try {
      final response = await http.post(
        Uri.parse(loginClientEndpoint),
        body: formData,
      );
      if (response.statusCode == 200) {
        await endpointSucces(response.body);
        print(response.body);
        pushAlert(200, "Content de vous revoir $username");
        Get.to<Widget>(() => const LandingPage());
      } else {
        dynamic errorMessage = endpointError(response.body);
        if (errorMessage != null) {
          pushAlert(400, errorMessage);
        } else {
          pushAlert(400, 'Numéro ou mot de passe incorrect');
        }
      }
    } catch (e) {
      pushAlert(400, 'Une erreur s\'est produite. Réessayez...');
    }
  }

  Future<void> registerClient(Map<String, dynamic> formData) async {
    final String loginClientEndpoint = '$url/auth/local/register';
    try {
      final response = await http.post(
        Uri.parse(loginClientEndpoint),
        body: formData,
      );
      if (response.statusCode == 200) {
        endpointSucces(response.body);
        await pushAlert(200, 'Validation de votre compte $username');
        Get.to<Widget>(() => const OtpValidationView());
      } else {
        dynamic errorMessage = endpointError(response.body);
        if (errorMessage != null) {
          pushAlert(400, errorMessage);
        } else {
          pushAlert(400, 'Erreur lors de l\'inscription');
        }
      }
    } catch (e) {
      pushAlert(400, 'Une erreur s\'est produite. Réessayez...');
    }
  }

  Future<void> otpVerification(String otpCode) async {
    final String loginClientEndpoint = '$url/auth/local/confirm';
    try {
      final response = await http.post(
        Uri.parse(loginClientEndpoint),
        body: {"email": userData.value['email'], "code": otpCode},
      );
      if (response.statusCode == 200) {
        endpointSucces(response.body);
        await pushAlert(200, 'Validation du compte effectué avec succès ');
        Get.to<Widget>(() => const ValidationCompletView());
      } else {
        dynamic errorMessage = endpointError(response.body);
        if (errorMessage != null) {
          pushAlert(400, errorMessage);
        } else {
          pushAlert(400, 'Erreur lors de l\'inscription');
        }
      }
    } catch (e) {
      pushAlert(400, 'Une erreur s\'est produite. Réessayez...');
    }
  }

  endpointError(responseBody) {
    Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
    if (jsonResponse.containsKey('error') &&
        jsonResponse['error'].containsKey('message')) {
      String errorMessage = jsonResponse['error']['message'];
      if (jsonResponse.containsKey('jwt')) {
        jwt.value = jsonResponse['jwt'];
      }
      update();
      return errorMessage;
    } else {
      return null;
    }
  }

  endpointSucces(responseBody) {
    Map jsonResponse = jsonDecode(responseBody);
    if (jsonResponse.containsKey('user')) {
      Map userInfo = jsonResponse['user'];
      userData.value = userInfo;
      isConnect.value = true;
      username.value = userInfo['username'];
      userData.refresh();
      update();
    } else {
      userData.value = {};
      userData.refresh();
    }
  }

  pushAlert(type, message) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        message.toString(),
        style: AppTypography.kMedium16.copyWith(color: AppColors.kWhite),
        textAlign: TextAlign.center,
      ),
      backgroundColor: type == 400 ? Colors.red : Colors.green,
      margin: EdgeInsets.zero,
      borderRadius: 0,
      padding: EdgeInsets.only(top: 15.h, bottom: 2.h),
    );
  }
}
