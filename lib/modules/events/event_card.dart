import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/modules/events/components/custom_like_button.dart';

class EventCard extends StatelessWidget {
  final Map<String, dynamic> event;
  const EventCard({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to<Widget>(() => ProductDetailView(product: product));
      },
      child: Column(
        children: [
          Hero(
            tag: event['id'],
            child: Container(
              height: 167.h,
              width: 153.w,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: AssetImage(AppAssets.wEventchillBG),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    height: 23.h,
                    child: CustomLikeButton(
                      event: event,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            event['event_name'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.kMedium14.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
