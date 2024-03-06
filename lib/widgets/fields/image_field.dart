import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wayii/data/constants/app_colors.dart';

class ImageInputWidget extends StatefulWidget {
  const ImageInputWidget({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ImageInputWidgetState createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(
      () {
        if (pickedFile != null) {
          _imageFile = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _getImage,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h),
        height: 300.h,
        decoration: BoxDecoration(
          color: AppColors.kTertiaire,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: _imageFile == null
              ? const Icon(Icons.image, size: 50, color: Colors.grey)
              : Image.file(
                  _imageFile!,
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
