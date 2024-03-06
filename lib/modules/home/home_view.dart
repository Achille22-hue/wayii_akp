import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wayii/controllers/category_controllers.dart';
import 'package:wayii/controllers/events_controllers.dart';
import 'package:wayii/controllers/user_controllers.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/modules/category/category_view.dart';
import 'package:wayii/modules/events/event_card.dart';
import 'package:wayii/modules/events/event_month.dart';
import 'package:wayii/modules/home/components/home_appBar.dart';
import 'package:wayii/modules/home/components/home_category_card.dart';
import 'package:wayii/widgets/fields/search_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final UserController cc = Get.find<UserController>();
  final CategoryController catc = Get.find<CategoryController>();
  final EventsController ec = Get.find<EventsController>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: const HomeAppBar(),
      backgroundColor: AppColors.kSecondary,
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: 22.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: GestureDetector(
                onTap: () {},
                child: SearchField(
                  controller: searchController,
                ),
              ),
            ),
            SizedBox(height: 16.w),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Text(
                    'Catégories',
                    style: AppTypography.kFuturaSemiBold20
                        .copyWith(color: AppColors.kWhite),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to<Widget>(() => const CategoryView());
                    },
                    child: SvgPicture.asset(AppAssets.wLeftArrow),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            catc.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.kWhite),
                    ),
                  )
                : const SizedBox(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 115.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: catc.categoriesList.value.isNotEmpty
                    ? catc.categoriesList.value.map((category) {
                        return HomeCategoryCard(category: category);
                      }).toList()
                    : [],
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Text(
                    'Evénements du mois',
                    style: AppTypography.kFuturaSemiBold20
                        .copyWith(color: AppColors.kWhite),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to<Widget>(() => const EventMonthView());
                    },
                    child: SvgPicture.asset(AppAssets.wLeftArrow),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            ec.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.kWhite),
                    ),
                  )
                : const SizedBox(),
            AnimationLimiter(
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: 153.w / 175.h,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8.0),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                children: List.generate(
                  ec.eventsList.value.length,
                  (index) {
                    return AnimationConfiguration.staggeredGrid(
                      columnCount: 2,
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: FadeInAnimation(
                        duration: const Duration(seconds: 1),
                        child: FadeInAnimation(
                          child: EventCard(
                            event: ec.eventsList.value[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
