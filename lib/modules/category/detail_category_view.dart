import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wayii/controllers/user_controllers.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/modules/events/event_card.dart';

class DetailCategortyView extends StatefulWidget {
  final Map<String, dynamic> category;
  const DetailCategortyView({required this.category, Key? key})
      : super(key: key);

  @override
  State<DetailCategortyView> createState() => _DetailCategortyViewState();
}

class _DetailCategortyViewState extends State<DetailCategortyView> {
  final UserController cc = Get.find<UserController>();
  late bool isLoadingdata;
  late List<Map<String, dynamic>> eventsList;

  @override
  void initState() {
    super.initState();
    isLoadingdata = true;
    eventsList = [];
    initializeEvents();
  }

  Future<void> initializeEvents() async {
    final String endpointCategories =
        '${cc.url}/categories/${widget.category['id']}?populate[image]=*&populate[events]=*';
    try {
      final response = await http.get(
        Uri.parse(endpointCategories),
        headers: {'Authorization': 'Bearer ${cc.jwt.value}'},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          isLoadingdata = false;
          eventsList = List<Map<String, dynamic>>.from([data]);
        });
      }
    } catch (e) {
      setState(() {
        isLoadingdata = false;
      });
      print('Une exception s\'est produite lors de la requête: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          '${widget.category['label']}',
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
      body: isLoadingdata
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.kPrimary,
              ),
            )
          : eventsList.isNotEmpty && eventsList[0]['events'].isNotEmpty
              ? AnimationLimiter(
                  child: GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: 153.w / 175.h,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8.0),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    children: List.generate(
                      eventsList[0]['events'].length,
                      (index) {
                        return AnimationConfiguration.staggeredGrid(
                          columnCount: 2,
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: FadeInAnimation(
                            duration: const Duration(seconds: 1),
                            child: EventCard(
                              event: eventsList[0]['events'][index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              : Center(
                  child: Text("Aucun évènement disponible",
                      style: AppTypography.kFuturaMedium20
                          .copyWith(color: AppColors.kWhite)),
                ),
    );
  }
}
