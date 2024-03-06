import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wayii/data/constants/app_assets.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/widgets/buttons/primary_button.dart';

class EventDetailView extends StatefulWidget {
  final Map<String, dynamic> event;
  const EventDetailView({required this.event, super.key});

  @override
  State<EventDetailView> createState() => _EventDetailViewState();
}

class _EventDetailViewState extends State<EventDetailView> {
  String? _selectedItem = 'Type de tickets';
  int? _selectedNbrTicket = 1;
  int price = 5000;
  final List<String> _dropdownItems = [
    'Type de tickets',
    'Gratuits',
    'Standards',
    'V.I.P.',
    'Premium'
  ];
  final List<int> _dropdownNbrTicket = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    print(widget.event);
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.wvibes,
            width: MediaQuery.of(context).size.width,
            height: 600.h,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.r),
              ),
              color: AppColors.kSecondarywithOpacity5,
            ),
            width: Get.width,
            margin: EdgeInsets.only(top: 440.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: SvgPicture.asset(AppAssets.wRectangle),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '''${widget.event['title']}''',
                      textAlign: TextAlign.right,
                      style: AppTypography.kFuturaSemiBold20
                          .copyWith(color: Colors.white),
                    ),
                    const Icon(
                      Icons.favorite_border_outlined,
                      color: AppColors.kPrimary,
                    ),
                  ],
                ),
                Text(
                  "${widget.event['organizers']}",
                  textAlign: TextAlign.right,
                  style: AppTypography.kFuturaSemiBold16
                      .copyWith(color: AppColors.kPrimary),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notes",
                          textAlign: TextAlign.right,
                          style: AppTypography.kFuturaLight16
                              .copyWith(color: AppColors.kPrimary),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: AppColors.kPrimary,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "4.8/5",
                              textAlign: TextAlign.right,
                              style: AppTypography.kFuturaSemiBold16
                                  .copyWith(color: AppColors.kWhite),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Ventes",
                          textAlign: TextAlign.right,
                          style: AppTypography.kFuturaLight16
                              .copyWith(color: AppColors.kPrimary),
                        ),
                        Text(
                          "1.500",
                          textAlign: TextAlign.right,
                          style: AppTypography.kFuturaSemiBold16
                              .copyWith(color: AppColors.kWhite),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: AppColors.kTertiaire,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.event['started_at']}",
                            style: AppTypography.kFuturaLight18
                                .copyWith(color: AppColors.kWhite),
                          ),
                          Text(
                            "${widget.event['place']}",
                            style: AppTypography.kFuturaLight18
                                .copyWith(color: AppColors.kWhite),
                          ),
                        ],
                      ),
                      // Container(
                      //   width: 70.w,
                      //   height: 70.h,
                      //   color: AppColors.kPrimary,
                      // ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.kTertiaire,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.r),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 10.h),
                        child: DropdownButton<String>(
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                              _dropdownItems.remove('Type de tickets');
                            });
                          },
                          style: AppTypography.kFuturaMedium16
                              .copyWith(color: AppColors.kWhite),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.kWhite,
                          ),
                          isExpanded: true,
                          items: _dropdownItems
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          dropdownColor: AppColors.kTertiaire,
                          underline: Container(
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.kTertiaire,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.r),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 10.h),
                        child: DropdownButton<int>(
                          value: _selectedNbrTicket,
                          onChanged: (int? newValue) {
                            setState(() {
                              price = 5000 * (newValue ?? 0);
                              _selectedNbrTicket = newValue;
                            });
                          },
                          style: AppTypography.kFuturaMedium16
                              .copyWith(color: AppColors.kWhite),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.kWhite,
                          ),
                          isExpanded: true,
                          items: _dropdownNbrTicket
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                          dropdownColor: AppColors.kTertiaire,
                          underline: Container(
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Montant",
                          style: AppTypography.kFuturaLight16
                              .copyWith(color: AppColors.kPrimary),
                        ),
                        Text(
                          "${price} FCFA",
                          style: AppTypography.kFuturaSemiBold20
                              .copyWith(color: AppColors.kWhite),
                        ),
                      ],
                    ),
                    PrimaryButton(
                      onTap: () async {},
                      text: 'Obtenir ticket',
                      fontSize: 20.sp,
                      width: 200.w,
                      key: const Key('obtenir_ticket'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
