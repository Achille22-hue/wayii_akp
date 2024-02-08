import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:wayii/data/constants/app_colors.dart';

class CustomLikeButton extends StatelessWidget {
  final Map<String, dynamic> event;
  const CustomLikeButton({
    required this.event,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4, top: 3, right: 1, bottom: 2),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: AppColors.kSecondary),
      child: LikeButton(
        size: 20,
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
            size: 20,
          );
        },
        onTap: (iseventLiked) {
          return Future.value(!iseventLiked);
        },
      ),
    );
  }
}
