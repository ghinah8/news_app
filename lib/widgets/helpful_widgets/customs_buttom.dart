import 'package:flutter/material.dart';
import '../../core/const_data/app_colors.dart';
import '../../core/const_data/text_style.dart';
import '../../media_query_service.dart';
import '../../theme/controller.dart';
import '../general/icon_button.dart';
import 'package:get/get.dart'; // استيراد GetX

class CustomSettingItem extends StatelessWidget {
  final String text;
  final String iconPath;
  final Widget nextPage;
  final String routeName; // تعديل: اسم المسار بدلاً من الصفحة

  const CustomSettingItem({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.nextPage,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // تهيئة SizeConfig داخل build
    SizeConfig().init(context);

    // الحصول على ThemeController
    final ThemeController themeController = Get.find();

    return Obx(() {
      // اختيار الألوان بناءً على حالة الثيم

      // ignore: unused_local_variable
      Color backgroundColor = themeController.isDarkMode.value
          ? Mycolor.darkThem // خلفية الوضع الداكن
          : Mycolor.white; // خلفية الوضع الفاتح

      // اختيار الألوان بناءً على حالة الثيم
      Color textColor = themeController.isDarkMode.value
          ? Colors.white // نص أبيض في الوضع الداكن
          : Colors.black; // نص أسود في الوضع الفاتح

      Color iconColor = themeController.isDarkMode.value
          ? Colors.white // أيقونة بيضاء في الوضع الداكن
          : Colors.black; // أيقونة سوداء في الوضع الفاتح

      return Padding(
        padding: EdgeInsets.symmetric(
          vertical:
              SizeConfig.heightPercentage(1), // المسافة الرأسية نسبة للارتفاع
        ),
        child: GestureDetector(
          onTap: () {
            // الانتقال إلى الصفحة المطلوبة باستخدام GetX
            Get.toNamed(routeName);
          },
          child: Row(
            children: [
              // زر الرجوع (أيقونة الرجوع) على أقصى اليسار
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.widthPercentage(
                      2.5), // مسافة ديناميكية بناءً على عرض الشاشة
                ),
                child: IconBackButtonn(
                  nextPage: nextPage,
                  color: iconColor, // تغيير اللون بناءً على الثيم
                ),
              ),
              // المسافة بين زر الرجوع والنص مع الأيقونة
              SizedBox(width: SizeConfig.widthPercentage(2)),
              // النص والأيقونة على الجهة اليمنى
              Expanded(
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // محاذاة العناصر إلى اليمين
                  children: [
                    // النص
                    Text(
                      text,
                      style: FontStyles.seteng.copyWith(
                        color: textColor, // تغيير لون النص بناءً على الثيم
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.widthPercentage(
                          3), // المسافة بين النص والأيقونة
                    ),
                    // الأيقونة
                    Image.asset(
                      iconPath,
                      width: SizeConfig.widthPercentage(
                          5), // حجم الأيقونة نسبي للعرض
                      height: SizeConfig.heightPercentage(
                          5), // حجم الأيقونة نسبي للارتفاع
                      color: iconColor, // تغيير لون الأيقونة بناءً على الثيم
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
