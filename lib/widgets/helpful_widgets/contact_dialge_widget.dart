import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../media_query_service.dart';
import '../../core/const_data/app_colors.dart';
import '../../theme/controller.dart'; // التأكد من استيراد SizeConfig

class ContactDialogWidget extends StatelessWidget {
  final String title;
  final String buttonText;
  final List<Map<String, dynamic>> imagesWithColors;

  const ContactDialogWidget({
    Key? key,
    required this.title,
    required this.buttonText,
    required this.imagesWithColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final themeController = Get.find<ThemeController>();

    // تحديد الألوان بناءً على الثيم
    final backgroundColor = themeController.isDarkMode.value ? Mycolor.dialogThem : Mycolor.lightgray;
    final titleColor = themeController.isDarkMode.value ? Colors.black : Mycolor.darkgray;
    final buttonTextColor = themeController.isDarkMode.value ? Colors.black : Colors.blueGrey;
    final underlineColor = themeController.isDarkMode.value ? Mycolor.black : Colors.blueGrey;

    // حساب عرض النص ديناميكيًا
    double calculateTextWidth(String text, TextStyle style) {
      final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr,
      )..layout();
      return textPainter.size.width;
    }

    // عرض النص بناءً على `buttonText`
    final double textWidth = calculateTextWidth(
      buttonText,
      GoogleFonts.cairo(
        fontSize: MediaQuery.of(context).size.width * 0.04,
        color: buttonTextColor,
      ),
    );

    return Dialog(
      insetPadding: EdgeInsets.all(SizeConfig.widthPercentage(5)),
      child: Container(
        padding: EdgeInsets.all(SizeConfig.widthPercentage(7)),
        decoration: BoxDecoration(
          color: backgroundColor, // استخدام لون الخلفية بناءً على الثيم
          borderRadius: BorderRadius.circular(SizeConfig.widthPercentage(1)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: GoogleFonts.cairo(
                fontSize: SizeConfig.widthPercentage(4),
                color: titleColor, // لون النص بناءً على الثيم
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: SizeConfig.heightPercentage(2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: imagesWithColors
                  .map(
                    (item) => Image.asset(
                  item['imagePath'],
                  width: SizeConfig.widthPercentage(6),
                  height: SizeConfig.widthPercentage(6),
                ),
              )
                  .toList(),
            ),
            SizedBox(height: SizeConfig.heightPercentage(3)),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: SizeConfig.heightPercentage(2)),
                  Text(
                    buttonText,
                    style: GoogleFonts.cairo(
                      fontSize: SizeConfig.widthPercentage(4),
                      color: buttonTextColor, // لون النص بناءً على الثيم
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(1)),
                  Container(
                    height: SizeConfig.heightPercentage(0.2),
                    width: textWidth,
                    color: underlineColor, // لون الخط بناءً على الثيم
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
