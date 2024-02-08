import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wayii/binding/home_binding.dart';
import 'package:wayii/modules/splash/splash_view.dart';

SystemUiOverlayStyle defaultOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarColor: Colors.black,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(defaultOverlay);
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MainWayii());
}

class MainWayii extends StatelessWidget {
  const MainWayii({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            title: 'Wayii',
            debugShowCheckedModeBanner: false,
            scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
            defaultTransition: Transition.fadeIn,
            initialBinding: HomeBinding(),
            home: const SplashView(),
          ),
        );
      },
    );
  }
}
