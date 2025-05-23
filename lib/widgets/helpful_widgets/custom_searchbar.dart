import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/const_data/app_colors.dart';
import '../../core/const_data/app_image.dart';
import '../../core/const_data/text_style.dart';
import '../../media_query_service.dart';
import '../../theme/controller.dart';

class CustomSearchBar extends StatelessWidget {
  final Widget? netxPage; // خاصية اختيارية لقبول الدالة

  const CustomSearchBar({
    super.key,
    this.netxPage,
  });

  @override
  Widget build(BuildContext context) {
    // الحصول على الـ ThemeController للتحقق من الوضع الحالي (داكن أو فاتح)
    final ThemeController themeController = Get.find();

    // تهيئة SizeConfig
    SizeConfig().init(context);

    return InkWell(
      child: Container(
        height: SizeConfig.heightPercentage(6), // الديناميكية في الارتفاع
        width: SizeConfig.widthPercentage(95), // عرض الحقل ديناميكي (مناسب للشاشة)
        child: TextField(
          onTap: () {
            Get.to(
              netxPage,
              transition: Transition.fade,
              duration: const Duration(milliseconds: 300),
            );
          },
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: 'بحث',
            hintStyle: FontStyles.searchbarText.copyWith(
              fontSize: SizeConfig.widthPercentage(5), // حجم الخط ديناميكي
              color: themeController.isDarkMode.value
                  ? Colors.grey // اللون في الوضع الداكن
                  : Colors.black, // اللون في الوضع الفاتح
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.heightPercentage(2),
                bottom: SizeConfig.heightPercentage(2),
                left: SizeConfig.widthPercentage(3),
              ), // حجم الحواف ديناميكي
              child: Image.asset(
                AppImage.search,
                width: SizeConfig.widthPercentage(6), // عرض الصورة ديناميكي
                height: SizeConfig.heightPercentage(3), // طول الصورة ديناميكي
                color: themeController.isDarkMode.value
                    ? Colors.white // تغيير اللون في الوضع الداكن
                    : Mycolor.black, // تغيير اللون في الوضع الفاتح
              ),
            ),
            filled: true,
            fillColor: themeController.isDarkMode.value
                ? Mycolor.darkThem // خلفية حقل البحث في الوضع الداكن
                : Mycolor.white, // خلفية حقل البحث في الوضع الفاتح
            contentPadding: EdgeInsets.symmetric(
              vertical: SizeConfig.heightPercentage(1.5),
              horizontal: SizeConfig.widthPercentage(3),
            ), // مسافات ديناميكية داخل الحقل
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                SizeConfig.widthPercentage(1), // نصف القطر ديناميكي
              ),
              borderSide: BorderSide(
                color: themeController.isDarkMode.value
                    ? Colors.white // اللون في الوضع الداكن
                    : Mycolor.black, // اللون في الوضع الفاتح
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                SizeConfig.widthPercentage(1), // نصف القطر ديناميكي
              ),
              borderSide: BorderSide(
                color: themeController.isDarkMode.value
                    ? Colors.white // اللون في الوضع الداكن
                    : Mycolor.black, // اللون في الوضع الفاتح
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                SizeConfig.widthPercentage(1), // نصف القطر ديناميكي
              ),
              borderSide: BorderSide(
                color: themeController.isDarkMode.value
                    ? Colors.white // اللون في الوضع الداكن
                    : Mycolor.black, // اللون في الوضع الفاتح
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
