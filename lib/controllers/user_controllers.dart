import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wayii/auth/otp_validation_view.dart';
import 'package:wayii/auth/signin_view.dart';
import 'package:wayii/auth/validation_complete_view.dart';
import 'package:wayii/modules/lendingPage/lending_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayii/utils/functions_utils.dart';

class UserController extends GetxController {
  late Rx<bool> isConnect = Rx<bool>(false);
  final String url = "https://goudo-wayii.onrender.com/api";
  late Rx<Map> userData = Rx<Map>({});
  late Rx<String> fullname = Rx<String>("");
  late Rx<String?> jwt;

  @override
  void onInit() async {
    super.onInit();
    initializeToken();
  }

  void initializeToken() async {
    jwt = Rx<String?>(await getToken());
  }

  Future<void> disconnect() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove("tokenKey");
      await prefs.remove('token_expiry');
      isConnect.value = false;
      userData.value = {};
      fullname.value = "";
      jwt.value = "";
      update();
      Get.to(() => const SignInView());
    } catch (e) {
      // ignore: avoid_print
      print('Une erreur s\'est produite lors de la déconnexion: $e');
      FunctionsUtils.pushAlert(
          400, 'Une erreur s\'est produite lors de la déconnexion.');
    }
  }

  Future<void> initializeUserData(token) async {
    final String userInfoEndpoint = '$url/users/me?populate=role';
    try {
      final response = await http.get(
        Uri.parse(userInfoEndpoint),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        userData.value = data;
        fullname.value = data['fullname'];
        update();
      } else {
        final errorMessage = FunctionsUtils.endpointError(response.body);
        FunctionsUtils.pushAlert(
            400,
            errorMessage ??
                'Une erreur est survenue lors de la récupération des informations utilisateur.');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Une exception s\'est produite lors de la requête: $e');
      FunctionsUtils.pushAlert(
          400, 'Une erreur s\'est produite lors de la connexion au serveur.');
    }
  }

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final expiryDate = DateTime.now().add(const Duration(days: 30));
    await prefs.setString("tokenKey", token);
    await prefs.setString('token_expiry', expiryDate.toIso8601String());
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final expiryDateString = prefs.getString('token_expiry');
    if (expiryDateString != null) {
      final expiryDate = DateTime.parse(expiryDateString);
      if (DateTime.now().isBefore(expiryDate)) {
        isConnect.value = true;
        String? token = prefs.getString("tokenKey");
        initializeUserData(token);
        return token;
      } else {
        isConnect.value = false;
        await prefs.remove("tokenKey");
        await prefs.remove('token_expiry');
      }
    }
    return '';
  }

  Future<void> loginClient(Map<String, dynamic> formData) async {
    final String loginClientEndpoint = '$url/auth/local/';
    try {
      final response = await http.post(
        Uri.parse(loginClientEndpoint),
        body: formData,
      );
      if (response.statusCode == 200) {
        await endpointSucces(response.body);
        FunctionsUtils.pushAlert(200, "Content de vous revoir $fullname");
        Get.to<Widget>(() => const LandingPage());
      } else {
        dynamic errorMessage = FunctionsUtils.endpointError(response.body);
        if (errorMessage != null) {
          FunctionsUtils.pushAlert(400, errorMessage);
        } else {
          FunctionsUtils.pushAlert(400, 'Numéro ou mot de passe incorrect');
        }
      }
    } catch (e) {
      FunctionsUtils.pushAlert(400, 'Une erreur s\'est produite. Réessayez...');
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
        await FunctionsUtils.pushAlert(
            200, 'Validation de votre compte $fullname');
        Get.to<Widget>(() => const OtpValidationView());
      } else {
        dynamic errorMessage = FunctionsUtils.endpointError(response.body);
        if (errorMessage != null) {
          FunctionsUtils.pushAlert(400, errorMessage);
        } else {
          FunctionsUtils.pushAlert(400, 'Erreur lors de l\'inscription');
        }
      }
    } catch (e) {
      FunctionsUtils.pushAlert(400, 'Une erreur s\'est produite. Réessayez...');
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
        FunctionsUtils.pushAlert(
            200, 'Validation du compte effectué avec succès ');
        Get.to<Widget>(() => const ValidationCompletView());
      } else {
        dynamic errorMessage = FunctionsUtils.endpointError(response.body);
        if (errorMessage != null) {
          FunctionsUtils.pushAlert(400, errorMessage);
        } else {
          FunctionsUtils.pushAlert(400, 'Erreur lors de l\'inscription');
        }
      }
    } catch (e) {
      print(e);
      FunctionsUtils.pushAlert(400, 'Une erreur s\'est produite. Réessayez...');
    }
  }

  endpointSucces(responseBody) async {
    Map jsonResponse = jsonDecode(responseBody);
    if (jsonResponse.containsKey('user')) {
      Map userInfo = jsonResponse['user'];
      await saveToken(jsonResponse['jwt']);
      userData.value = userInfo;
      fullname.value = userInfo['fullname'];
      jwt.value = await getToken();
      userData.refresh();
      update();
    } else {
      userData.value = {};
      userData.refresh();
    }
  }
}
