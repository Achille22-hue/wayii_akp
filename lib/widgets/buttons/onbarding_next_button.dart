import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';

class OnboardingNextButton extends StatefulWidget {
  final VoidCallback onTapPasser;
  final VoidCallback onTapSuivant;

  const OnboardingNextButton({
    required this.onTapPasser,
    required this.onTapSuivant,
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingNextButton> createState() => _OnboardingNextButtonState();
}

class _OnboardingNextButtonState extends State<OnboardingNextButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildButton("Passer", AppColors.kWhite, widget.onTapPasser),
        buildButton("Suivant", AppColors.kPrimary, widget.onTapSuivant),
      ],
    );
  }

  Widget buildButton(String buttonText, Color buttonColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        onTap();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            buttonText,
            style: AppTypography.kFuturaSemiBold14.copyWith(color: buttonColor),
          ),
          const SizedBox(height: 8.0),
          ScaleTransition(
            scale: _tween.animate(
              CurvedAnimation(
                parent: _controller,
                curve: Curves.easeOut,
                reverseCurve: Curves.easeIn,
              ),
            ),
            child: Container(
              height: 2.0.h,
              width: MediaQuery.of(context).size.width / 7,
              color: buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}
