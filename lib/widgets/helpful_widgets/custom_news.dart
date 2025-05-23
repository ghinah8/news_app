import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/const_data/text_style.dart';
import '../../media_query_service.dart';
import '../../theme/controller.dart';

class CustomNews extends StatelessWidget {
  CustomNews({
    required this.id, // إضافة المعرف
    required this.country,
    required this.newstitle,
    this.newstime,
    required this.newsimage,
    this.newscontant,
  });

  final int id; // تعريف المتغير الخاص بالمعرف
  final String country;
  final String newstitle;
  final String? newstime;
  final String newsimage;
  final String? newscontant;

  @override
  Widget build(BuildContext context) {
    // الحصول على الـ ThemeController للتحقق من الوضع الحالي (داكن أو فاتح)
    final ThemeController themeController = Get.find();

    return Container(
      child: InkWell(
        onTap: () => Get.toNamed(
          "/news_screen", // المسار إلى صفحة تفاصيل الخبر
          arguments: id, // تمرير المعرف id كـ argument
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // نصف قطر الزوايا الدائرية
                child: Image.network(
                  newsimage,
                  width: SizeConfig.widthPercentage(95), // عرض الصورة بنسبة 95%
                  height: SizeConfig.heightPercentage(28), // طول الصورة بنسبة 28%
                  fit: BoxFit.cover, // لتغطية الحاوية بالكامل
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightPercentage(1.5), // المسافة بين العناصر
            ),
            Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.widthPercentage(2), // مسافة ديناميكية بناءً على عرض الشاشة
              ),
              child: Text(
                country,
                style: themeController.isDarkMode.value
                    ? FontStyles.newssourcenome.copyWith(color: Colors.white) // تغيير اللون في الوضع الداكن
                    : FontStyles.newssourcenome.copyWith(color: Colors.black), // اللون في الوضع الفاتح
              ),
            ),
            SizedBox(
              height: SizeConfig.heightPercentage(1.5), // المسافة بين العناصر
            ),
            Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.widthPercentage(2), // مسافة padding مناسبة للشاشات المختلفة
              ),
              child: Text(
                newstitle,
                textAlign: TextAlign.right, // محاذاة النص لليمين
                style: themeController.isDarkMode.value
                    ? FontStyles.newstitlenome.copyWith(color: Colors.white) // اللون في الوضع الداكن
                    : FontStyles.newstitlenome.copyWith(color: Colors.black), // اللون في الوضع الفاتح
              ),
            ),
            SizedBox(height: SizeConfig.heightPercentage(1)),
            if (newstime != null)
              Padding(
                padding: EdgeInsets.only(
                  right: SizeConfig.widthPercentage(2), // مسافة padding متناسبة مع عرض الشاشة
                ),
                child: Text(
                  newstime!,
                  style: themeController.isDarkMode.value
                      ? FontStyles.newsTimeandSource.copyWith(color: Colors.white) // اللون في الوضع الداكن
                      : FontStyles.newsTimeandSource.copyWith(color: Colors.black), // اللون في الوضع الفاتح
                ),
              ),
            SizedBox(height: SizeConfig.heightPercentage(3)),
            if (newscontant != null)
              Padding(
                padding: EdgeInsets.only(
                  right: SizeConfig.widthPercentage(2),
                ),
                child: Text(
                  newscontant!,
                  style: themeController.isDarkMode.value
                      ? FontStyles.newscontantinome.copyWith(color: Colors.white) // اللون في الوضع الداكن
                      : FontStyles.newscontantinome.copyWith(color: Colors.black), // اللون في الوضع الفاتح
                  textAlign: TextAlign.right,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
