import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/modules/events/components/event_month_card.dart';

class EvernmentView extends StatefulWidget {
  const EvernmentView({super.key});

  @override
  State<EvernmentView> createState() => _EvernmentViewState();
}

class _EvernmentViewState extends State<EvernmentView> {
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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          EventMonthCard(),
          EventMonthCard(),
          EventMonthCard(),
          EventMonthCard(),
          EventMonthCard(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.only(
          bottom: 120.h,
          right: 20.w,
        ),
        child: FloatingActionButton(
          backgroundColor: AppColors.kPrimary,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
