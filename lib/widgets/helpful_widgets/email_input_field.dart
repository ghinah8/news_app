import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../core/const_data/app_colors.dart';
import '../../media_query_service.dart';
import '../../theme/controller.dart';

class EmailInputField extends StatelessWidget {
  final String hintText;
  final TextStyle? hintTextStyle;
  final TextEditingController? controller;

  EmailInputField({
    required this.hintText,
    this.hintTextStyle,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final ThemeController themeController = Get.find();

    return Container(
      width: SizeConfig.widthPercentage(90),
      height: SizeConfig.heightPercentage(6),
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthPercentage(0.01)),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintTextStyle ??
              GoogleFonts.cairo(
                color: themeController.isDarkMode.value
                    ? Colors.white.withOpacity(0.6)
                    : Mycolor.editnameoremail.withOpacity(0.5),
                fontSize: SizeConfig.blockWidth * 4,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: themeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: themeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: themeController.isDarkMode.value
                  ? Mycolor.white
                  : Mycolor.editnameoremail,
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthPercentage(2.5),
            vertical: SizeConfig.heightPercentage(2.5),
          ),
        ),
        style: GoogleFonts.cairo(
          color: themeController.isDarkMode.value ? Colors.white : Colors.black,
          fontSize: SizeConfig.widthPercentage(4),
        ),
      ),
    );
  }
}
