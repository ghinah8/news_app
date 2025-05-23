import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/const_data/app_colors.dart';
import '../../core/const_data/text_style.dart';
import '../../theme/controller.dart';
import '../../view/surveys_page/controller/surveys_controller.dart';
import '../../media_query_service.dart'; // استدعاء SizeConfig

class SurveyOptionWidget extends StatelessWidget {
  final SurveyController controller;

  const SurveyOptionWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // تهيئة SizeConfig
    SizeConfig().init(context);

    // استدعاء ThemeController للتحقق من حالة الثيم
    final ThemeController themeController = Get.find();

    return Column(
      children: [
        _buildOption(
          context,
          controller,
          themeController, // تمرير الـ themeController
          index: 0,
          text: "ريال مدريد كان الأفضل و كان انتصارا مستحقا",
        ),
        Transform.translate(
          offset: Offset(
            0,
            -SizeConfig.heightPercentage(1.5), // بدل 10 ثابتة
          ),
          child: _buildOption(
            context,
            controller,
            themeController, // تمرير الـ themeController
            index: 1,
            text: "الحكم قد ظلم البارسا و حرمه من الانتصار",
          ),
        ),
        Transform.translate(
          offset: Offset(
            0,
            -SizeConfig.heightPercentage(3), // بدل 20 ثابتة
          ),
          child: _buildOption(
            context,
            controller,
            themeController, // تمرير الـ themeController
            index: 2,
            text: "ليس لدي اهتمام بمتابعة كرة القدم",
          ),
        ),
      ],
    );
  }

  Widget _buildOption(BuildContext context, SurveyController controller,
      ThemeController themeController, {required int index, required String text}) {
    return GestureDetector(
      onTap: () {
        controller.updateSelectedIndex(index);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthPercentage(2), // بدل مسافة أفقية ثابتة
              ),
              child: Text(
                text,
                style: GoogleFonts.cairo(
                  textStyle: FontStyles.notificationContant.copyWith(
                    color: themeController.isDarkMode.value ? Colors.white : Colors.black, // تغيير اللون بناءً على الثيم
                  ),
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Radio<int>(
            value: index,
            groupValue: controller.selectedIndex,
            onChanged: (value) {
              if (value != null) {
                controller.updateSelectedIndex(value);
              }
            },
            activeColor: themeController.isDarkMode.value ? Colors.white : Mycolor.black, // تغيير لون الراديو بناءً على الثيم
          ),
        ],
      ),
    );
  }
}
