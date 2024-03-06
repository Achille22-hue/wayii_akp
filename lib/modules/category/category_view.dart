import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wayii/controllers/category_controllers.dart';
import 'package:wayii/controllers/user_controllers.dart';
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
  final UserController cc = Get.find<UserController>();
  final CategoryController catc = Get.find<CategoryController>();

  bool isLoadingdata = true;
  late List<Map<String, dynamic>> categoriesList;

  @override
  void initState() {
    categoriesList = catc.categoriesList.value;
    initializeCategories();
    super.initState();
  }

  Future<void> initializeCategories() async {
    final String endpointCategories = '${cc.url}/categories?populate=*';
    try {
      final response = await http.get(
        Uri.parse(endpointCategories),
        headers: {'Authorization': 'Bearer ${cc.jwt.value}'},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          categoriesList = List<Map<String, dynamic>>.from(data["results"]);
        });
      }
      setState(() {
        isLoadingdata = false;
      });
    } catch (e) {
      setState(() {
        isLoadingdata = false;
      });
      // ignore: avoid_print
      print('Une exception s\'est produite lors de la requête: $e');
    }
  }

  Future<void> _refresh() async {
    initializeCategories();
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Catégories',
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
      backgroundColor: AppColors.kSecondary,
      body: Container(
        padding: EdgeInsets.only(top: 15.h),
        child: Column(
          children: [
            if (categoriesList.isNotEmpty)
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refresh,
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}
