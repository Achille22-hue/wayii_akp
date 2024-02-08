import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayii/auth/signin_view.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/models/onboarding.dart';
import 'package:wayii/modules/gradients/custom_gradient_card.dart';
import 'package:wayii/modules/onboarding/components/custom_dots_indicator.dart';
import 'package:wayii/modules/onboarding/components/onboarding_card.dart';
import 'package:wayii/widgets/buttons/onbarding_next_button.dart';
import 'package:wayii/widgets/buttons/primary_button.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(onboardingList[_currentIndex].bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomGradientCard(
          gradient: AppColors.customOnboardingGradient,
          child: Column(
            children: [
              const Spacer(),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingList.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingCard(
                      onboarding: onboardingList[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              (_currentIndex != onboardingList.length - 1)
                  ? CustomDotsIndicator(
                      dotsCount: onboardingList.length,
                      position: _currentIndex,
                    )
                  : const SizedBox(height: 0),
              const SizedBox(height: 30),
              (_currentIndex == onboardingList.length - 1)
                  ? PrimaryButton(
                      onTap: () {
                        if (_currentIndex == onboardingList.length - 1) {
                          Get.offAll<Widget>(() => const SignInView());
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                          );
                        }
                      },
                      text: 'C’est parti !',
                    )
                  : OnboardingNextButton(
                      onTapPasser: () {
                        _pageController
                            .jumpToPage(_pageController.page!.toInt() + 2);
                      },
                      onTapSuivant: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
