import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_image.dart';
import '../../../core/const_data/text_style.dart';
import '../../../media_query_service.dart';
import '../../../theme/controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تأخير الانتقال إلى صفحة تسجيل الدخول بعد 3 ثوانٍ
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAndToNamed(
            "/log_in_screen"); // الانتقال إلى شاشة تسجيل الدخول باستخدام GetX
      });
    });

    // تهيئة SizeConfig
    SizeConfig().init(context);

    // استدعاء المتحكم للثيم
    final ThemeController themeController = Get.find();

    // تحديد الألوان بناءً على الثيم
    final backgroundColor =
        themeController.isDarkMode.value ? Mycolor.darkThem : Colors.white;
    final textColor =
        themeController.isDarkMode.value ? Colors.white : Colors.black;

    // تحديد الصورة الأولى بناءً على الثيم
    final earthBackgroundImage = themeController.isDarkMode.value
        ? AppImage.world // صورة الثيم الداكن
        : AppImage.earthBackground; // صورة الثيم الفاتح

    // تحديد الصورة الثانية بناءً على الثيم
    final newsLoginImage = themeController.isDarkMode.value
        ? AppImage.nn2 // صورة خاصة بالثيم الداكن
        : AppImage.newslogin1; // صورة الثيم الفاتح

    return Scaffold(
      backgroundColor: backgroundColor, // تحديد خلفية الشاشة بناءً على الثيم
      body: Center(
        child: Stack(
          alignment: Alignment.center, // توسيط العناصر في Stack
          children: [
            Positioned(
              top: SizeConfig.heightPercentage(
                  33), // موقع الصورة الأولى كنسبة مئوية من ارتفاع الشاشة
              left: SizeConfig.widthPercentage(1), // الهامش الأيسر
              right: SizeConfig.widthPercentage(1), // الهامش الأيمن
              child: Image.asset(
                earthBackgroundImage, // استخدام الصورة المناسبة بناءً على الثيم
                width: SizeConfig.widthPercentage(80), // 80% من عرض الشاشة
                height: SizeConfig.heightPercentage(50), // 50% من ارتفاع الشاشة
                fit: BoxFit.cover, // لتغطية الصورة بشكل مناسب
              ),
            ),
            Positioned(
              top: SizeConfig.heightPercentage(
                  49), // موقع الصورة الثانية كنسبة مئوية من ارتفاع الشاشة
              left: SizeConfig.widthPercentage(4), // الهامش الأيسر
              right: SizeConfig.widthPercentage(12), // الهامش الأيمن
              child: Image.asset(
                newsLoginImage, // استخدام الصورة الثانية بناءً على الثيم
                width: SizeConfig.widthPercentage(40), // 40% من عرض الشاشة
                height: SizeConfig.heightPercentage(9), // 20% من ارتفاع الشاشة
              ),
            ),
            Positioned(
              top: SizeConfig.heightPercentage(
                  62), // موقع النص كنسبة مئوية من ارتفاع الشاشة
              child: Text(
                "تطبيق أخباري مجاني متنوع و متعدد المصادر",
                style: GoogleFonts.cairo(
                  textStyle: FontStyles.subtitle.copyWith(
                    color: textColor, // تحديد لون النص بناءً على الثيم
                    fontSize: SizeConfig.widthPercentage(
                        4.5), // تحديد حجم الخط بناءً على عرض الشاشة
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
