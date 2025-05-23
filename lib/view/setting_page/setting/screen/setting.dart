import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/const_data/app_colors.dart';
import '../../../../core/const_data/text_style.dart';
import '../../../../media_query_service.dart';
import '../../../../theme/controller.dart';
import '../../../../widgets/general/bottom_back.dart';
import '../../../../widgets/general/icon_button.dart';
import '../../../../widgets/helpful_widgets/widget_setting.dart';
import '../../../country_page/screen/country_page.dart';
import '../../../interests_page/Screen/interests_page.dart';
import '../../../sources_page/screen/news_source_screen.dart';

class SettingTow extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // تهيئة MediaQuery

    return Obx(() => Scaffold(
          backgroundColor: themeController.isDarkMode.value
              ? Mycolor.darkThem
              : Mycolor.white,
          body: Column(
            children: [
              // شريط العنوان مع زر العودة
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.heightPercentage(6),
                  left: SizeConfig.widthPercentage(45),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الإعدادات',
                      style: FontStyles.setee.copyWith(
                        color: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: SizeConfig.widthPercentage(2.0)),
                      child: IconBackButton(),
                    ),
                  ],
                ),
              ),
              // محتوى الصفحة
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthPercentage(3.6),
                    vertical: SizeConfig.heightPercentage(2.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // قسم تعديل حجم الخط
                      _buildSection(
                        title: 'تعديل حجم الخط',
                        description: 'اختر الحجم المناسب للخط',
                        options: ['متوسط', 'كبير', 'كبير جدا'],
                        selectedIndex: themeController.fontSizeIndex,
                        textColor: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.white,
                        titleTextColor: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.grey,
                        descriptionTextColor: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                      ),

                      Divider(thickness: 1.3, color: Mycolor.lightgray),

                      // قسم إعدادات التشغيل التلقائي
                      _buildSection(
                        title: 'إعدادات التشغيل التلقائي',
                        description:
                            'اختر الوضع الملائم لتشغيل الفيديوهات تلقائيا',
                        options: [
                          '.wifi على بيانات الهاتف وشبكات ',
                          'فقط.wifi على شبكات ',
                          'عدم تشغيل الفيديوهات تلقائيا',
                        ],
                        selectedIndex: themeController.autoPlayIndex,
                        textColor: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.white,
                        titleTextColor: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.grey,
                        descriptionTextColor: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                      ),

                      Divider(thickness: 1.3, color: Mycolor.lightgray),

                      // قسم إعدادات الوضع الليلي
                      _buildSection(
                        title: 'إعدادات الوضع الليلي',
                        description: 'اختر إعدادات الوضع الليلي الملائمة',
                        options: [
                          'الوضع الليلي',
                          'الوضع النهاري',
                          'تلقائي (حسب إعدادات الجهاز)',
                        ],
                        selectedIndex: RxInt(themeController.isDarkMode.value
                            ? 0
                            : 1), // تحديث القيمة بشكل صحيح
                        onChanged: (int index) {
                          if (index == 0) {
                            // الوضع النهاري
                            themeController.isDarkMode.value = false;
                          } else if (index == 1) {
                            // الوضع الليلي
                            themeController.isDarkMode.value = true;
                          } else if (index == 2) {
                            // الوضع التلقائي بناءً على إعدادات النظام
                            var brightness = SchedulerBinding.instance.window
                                .platformBrightness; // استخدام SchedulerBinding
                            // إذا كان النظام في وضع Light، نقلبه إلى Dark
                            if (brightness == Brightness.light) {
                              themeController.isDarkMode.value = true;
                            } else {
                              themeController.isDarkMode.value = false;
                            }
                          }

                          themeController
                              .toggleTheme(); // تحديث الثيم بعد اختيار الإعداد
                        },

                        textColor: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.white,
                        titleTextColor: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.grey,
                        descriptionTextColor: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black,
                      ),

                      Divider(thickness: 1.3, color: Mycolor.lightgray),

                      // أقسام الروابط
                      _buildCustomTextRow('تعديل معلومات تسجيل الدخول', null),
                      _buildCustomTextRow('تعديل المصادر', NewsSourceScreen()),
                      _buildCustomTextRow('تعديل البلد', CountryPage()),
                      _buildCustomTextRow('تعديل نوع الأخبار', InterestsPage()),
                      SizedBox(height: SizeConfig.heightPercentage(3)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  // إنشاء أقسام الخيارات
  Widget _buildSection({
    required String title,
    required String description,
    required List<String> options,
    required RxInt selectedIndex,
    Function(int)? onChanged,
    required Color textColor,
    required Color titleTextColor,
    required Color descriptionTextColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.heightPercentage(1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: FontStyles.selectedText.copyWith(
              color: titleTextColor,
            ),
          ),
          SizedBox(height: SizeConfig.heightPercentage(0.2)),
          Text(
            description,
            style: GoogleFonts.cairo(
              fontSize: SizeConfig.heightPercentage(2),
              color: descriptionTextColor.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: SizeConfig.heightPercentage(1.5)),
          Obx(() => RadioButtonsWithText(
                labels: options,
                selectedIndex: selectedIndex.value,
                onChanged: onChanged ?? (int newIndex) {},
              )),
        ],
      ),
    );
  }

  // إنشاء صفوف النصوص القابلة للضغط
  Widget _buildCustomTextRow(String text, Widget? nextPage) {
    Color textColor = text == 'تعديل معلومات تسجيل الدخول'
        ? (themeController.isDarkMode.value ? Colors.white : Colors.grey)
        : (themeController.isDarkMode.value ? Colors.white : Mycolor.black);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.heightPercentage(1)),
      child: Row(
        children: [
          if (nextPage != null)
            IconBackButtonn(nextPage: nextPage, color: textColor),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  if (nextPage != null) {
                    Get.to(() => nextPage);
                  }
                },
                child: Text(
                  text,
                  style: GoogleFonts.cairo(
                    fontSize: SizeConfig.heightPercentage(1.8),
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
