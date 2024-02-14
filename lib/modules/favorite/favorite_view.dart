import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/data/helpers/data.dart';
import 'package:wayii/modules/events/event_card.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          'Préférences',
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
      body: AnimationLimiter(
        child: GridView.count(
          shrinkWrap: true,
          childAspectRatio: 153.w / 175.h,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8.0),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          children: List.generate(
            eventsList.length,
            (index) {
              return AnimationConfiguration.staggeredGrid(
                columnCount: 2,
                position: index,
                duration: const Duration(milliseconds: 375),
                child: FadeInAnimation(
                  duration: const Duration(seconds: 1),
                  child: FadeInAnimation(
                    child: EventCard(
                      event: eventsList[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
