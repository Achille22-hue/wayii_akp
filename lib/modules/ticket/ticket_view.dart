import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/modules/ticket/components/ticket_expire.dart';
import 'package:wayii/modules/ticket/components/ticket_valide.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.kSecondary,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Text(
            'Mes Tickets',
            style: AppTypography.kFuturaSemiBold24
                .copyWith(color: AppColors.kWhite),
          ),
          actions: [
            GestureDetector(
              onTap: () => {},
              child: SvgPicture.asset(AppAssets.wSearchBtn, width: 20.w),
            ),
            SizedBox(width: 15.0.w),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(65.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 1.h),
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                color: AppColors.kTertiaire,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.kPrimary,
                ),
                labelColor: AppColors.kSecondary,
                padding: const EdgeInsets.symmetric(vertical: 0),
                unselectedLabelColor: AppColors.kGreenLight,
                labelPadding: EdgeInsets.symmetric(horizontal: 2.w),
                tabs: [
                  Tab(
                    child: Text(
                      "Valables",
                      style: AppTypography.kFuturaSemiBold18,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Expirés",
                      style: AppTypography.kFuturaSemiBold18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            TicketValide(),
            TicketExpire(),
          ],
        ),
      ),
    );
  }
}
