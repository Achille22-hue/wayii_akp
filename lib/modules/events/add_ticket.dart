import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wayii/auth/components/auth_field.dart';
import 'package:wayii/data/constants/app_colors.dart';
import 'package:wayii/data/constants/app_typography.dart';
import 'package:wayii/widgets/buttons/primary_button.dart';
import 'package:wayii/widgets/fields/image_field.dart';

class AddTicketStep1 extends StatefulWidget {
  const AddTicketStep1({Key? key}) : super(key: key);

  @override
  State<AddTicketStep1> createState() => _AddTicketStep1State();
}

class _AddTicketStep1State extends State<AddTicketStep1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _organizerController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const int currentStep = 1;
    const int totalSteps = 5;

    double progress = currentStep / totalSteps;

    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          'Nouvel évènement',
          style:
              AppTypography.kFuturaSemiBold24.copyWith(color: AppColors.kWhite),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25.0.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            margin: EdgeInsets.only(bottom: 20.h),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                gradient: LinearGradient(
                  colors: const [
                    AppColors.kTertiaire,
                    AppColors.kPrimary,
                    AppColors.kTertiaire,
                  ],
                  stops: [
                    progress / 2,
                    progress,
                    progress,
                  ],
                ),
              ),
              child: SizedBox(height: 5.h),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthField(
                      title: '',
                      hintText: 'Nom de l’évènement*',
                      controller: _nameController,
                      validator: (value) {
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 10.h),
                    AuthField(
                      title: '',
                      hintText: 'Catégorie d’évènement*',
                      controller: _categoryController,
                      validator: (value) {
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 10.h),
                    AuthField(
                      title: '',
                      hintText: 'Organisateurs*',
                      controller: _organizerController,
                      validator: (value) {
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 10.h),
                    AuthField(
                      title: '',
                      hintText: 'Lieu de l’évènement*',
                      controller: _locationController,
                      validator: (value) {
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: AuthField(
                            title: '',
                            hintText: 'Date de début*',
                            controller: _startDateController,
                            validator: (value) {
                              return null;
                            },
                            keyboardType: TextInputType.datetime,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(width: 10.h),
                        Expanded(
                          child: AuthField(
                            title: '',
                            hintText: 'Date de fin*',
                            controller: _endDateController,
                            validator: (value) {
                              return null;
                            },
                            keyboardType: TextInputType.datetime,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    AuthField(
                      title: '',
                      hintText: 'Heure de l’évènement*',
                      controller: _timeController,
                      validator: (value) {
                        return null;
                      },
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.done,
                    ),
                    const ImageInputWidget(),
                  ],
                ),
              ),
              PrimaryButton(
                onTap: () {},
                text: 'Suivant',
                fontSize: 20.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
