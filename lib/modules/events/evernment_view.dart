import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wayii/controllers/user_controllers.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/modules/events/add_ticket.dart';
import 'package:wayii/modules/events/components/event_month_card.dart';

class EvernmentView extends StatefulWidget {
  const EvernmentView({super.key});

  @override
  State<EvernmentView> createState() => _EvernmentViewState();
}

class _EvernmentViewState extends State<EvernmentView> {
  final UserController cc = Get.find<UserController>();
  final myEvent = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          'Mes évènements',
          style:
              AppTypography.kFuturaSemiBold24.copyWith(color: AppColors.kWhite),
        ),
        actions: [
          GestureDetector(
            onTap: () => {},
            child: SvgPicture.asset(AppAssets.wSearchBtn, width: 20.w),
          ),
          SizedBox(width: 15.0.w),
        ],
      ),
      body: myEvent.isNotEmpty
          ? ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                EventMonthCard(),
                EventMonthCard(),
                EventMonthCard(),
                EventMonthCard(),
                EventMonthCard(),
              ],
            )
          : Center(
              child: Text(
                '''Vous n'avez pas d'événement''',
                style: AppTypography.kFuturaSemiBold20
                    .copyWith(color: AppColors.kWhite),
                textAlign: TextAlign.center,
              ),
            ),
      floatingActionButton: cc.userData.value.containsKey("role") &&
              cc.userData.value["role"] is Map<String, dynamic> &&
              cc.userData.value["role"].containsKey("name") &&
              cc.userData.value["role"]["name"] == "client"
          ? Container(
              margin: EdgeInsets.only(
                bottom: 120.h,
                right: 20.w,
              ),
              child: FloatingActionButton(
                backgroundColor: AppColors.kPrimary,
                onPressed: () {
                  Get.to<Widget>(() => const AddTicketStep1());
                },
                child: const Icon(Icons.add),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
