import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/modules/category/components/category_card.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categoriesList = [
      {
        'id': '1',
        'icons': '',
        'category_name': 'Chill/Party',
        'nbr_evern': '12',
      },
      {
        'id': '2',
        'icons': '',
        'category_name': 'Chill/Party',
        'nbr_evern': '12',
      },
      {
        'id': '3',
        'icons': '',
        'category_name': 'Chill/Party',
        'nbr_evern': '12',
      },
      {
        'id': '3',
        'icons': '',
        'category_name': 'Chill/Party',
        'nbr_evern': '12',
      }
    ];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Catégories',
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
        ),
        backgroundColor: AppColors.kSecondary,
        body: Container(
          padding: EdgeInsets.only(top: 15.h),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0.w,
              mainAxisSpacing: 10.0.w,
            ),
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              return CategoryCard(category: categoriesList[index]);
            },
          ),
        ));
  }
}
