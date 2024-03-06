import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wayii/controllers/user_controllers.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({super.key});

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  final UserController cc = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          'Profil',
          style:
              AppTypography.kFuturaSemiBold24.copyWith(color: AppColors.kWhite),
        ),
        actions: [
          GestureDetector(
            onTap: () => {},
            child: Center(
              child: Text(
                "Modifier",
                style: AppTypography.kFuturaLight16
                    .copyWith(color: AppColors.kPrimary),
              ),
            ),
          ),
          SizedBox(width: 15.0.w),
        ],
      ),
      backgroundColor: AppColors.kSecondary,
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 30.h),
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: AppColors.kPrimary,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              cc.fullname.value.toString(),
              style: AppTypography.kFuturaSemiBold20.copyWith(
                color: AppColors.kWhite,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            cc.userData.value['email'] != null
                ? Text(
                    cc.userData.value['email'] ?? '',
                    style: AppTypography.kFuturaLight16.copyWith(
                      color: AppColors.kWhite,
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: 50.h,
            ),
            Column(
              children: [
                CardSetting(
                  onTap: () => {},
                  title: "Notifications",
                  icon: AppAssets.wNotificationIcon,
                ),
                CardSetting(
                  onTap: () => {},
                  title: "Aide et Support client",
                  icon: AppAssets.help,
                ),
                CardSetting(
                  onTap: () => {},
                  title: "A propos de Wayii",
                  icon: AppAssets.about,
                ),
              ],
            ),
            const Spacer(),
            CardSetting(
              onTap: () => {
                cc.disconnect(),
              },
              title: "Déconnexion",
              icon: AppAssets.logout,
              dec: false,
            ),
            SizedBox(
              height: 80.h,
            ),
          ],
        ),
      ),
    );
  }
}

class CardSetting extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final String title;
  final bool dec;
  const CardSetting(
      {required this.onTap,
      required this.icon,
      required this.title,
      this.dec = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      decoration: BoxDecoration(
          color: AppColors.kTertiaire,
          borderRadius: BorderRadius.all(Radius.circular(15.r))),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(icon),
        ),
        minLeadingWidth: 10.w,
        title: Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Text(
            title,
            style: AppTypography.kFuturaSemiBold16
                .copyWith(color: AppColors.kWhite),
          ),
        ),
        trailing: dec ? SvgPicture.asset(AppAssets.warrowLeft) : null,
      ),
    );
  }
}
