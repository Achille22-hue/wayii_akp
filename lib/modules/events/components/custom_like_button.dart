import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:wayii/controllers/events_controllers.dart';
import 'package:wayii/data/constants/app_colors.dart';

class CustomLikeButton extends StatelessWidget {
  final Map<String, dynamic> event;
  const CustomLikeButton({
    required this.event,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EventsController ec = Get.find<EventsController>();

    return Container(
      padding: EdgeInsets.only(left: 5.h, top: 2.h, right: 3.h, bottom: 3.h),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: AppColors.kSecondary),
      child: LikeButton(
        size: 20.sp,
        padding: EdgeInsets.zero,
        circleColor: const CircleColor(
          start: AppColors.kPrimary,
          end: AppColors.kPrimary,
        ),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: AppColors.kPrimary,
          dotSecondaryColor: AppColors.kPrimary,
        ),
        isLiked: false,
        likeBuilder: (iseventLiked) {
          return Icon(
            iseventLiked ? Icons.favorite : Icons.favorite_border_rounded,
            color: iseventLiked ? AppColors.kPrimary : AppColors.kWhite,
            size: 20.sp,
          );
        },
        onTap: (iseventLiked) {
          ec.addWishlist(event['id']);
          return Future.value(!iseventLiked);
        },
      ),
    );
  }
}
