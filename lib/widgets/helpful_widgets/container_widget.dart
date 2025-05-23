import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/const_data/app_colors.dart';
import '../../core/const_data/text_style.dart';
import '../../media_query_service.dart';
import '../../theme/controller.dart';
import '../general/icon_button.dart';

class CustomHeader extends StatelessWidget {
  final String title; // النص
  final Widget nextPage; // الصفحة التالية
  final Color iconColor; // لون الأيقونة

  const CustomHeader({
    Key? key,
    required this.title,
    required this.nextPage,
    this.iconColor = Colors.black, // لون افتراضي
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // تأكد من تهيئة SizeConfig في الشاشة الرئيسية
    SizeConfig().init(context);

    final ThemeController themeController = Get.find(); // استدعاء ThemeController للتحقق من حالة الثيم

    return Container(
      width: SizeConfig.widthPercentage(100), // عرض 100% من الشاشة
      height: SizeConfig.heightPercentage(5), // ارتفاع 5% من الشاشة
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // النص يبدأ من اليسار
        children: [
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.heightPercentage(0.5)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconBackButtonn(
                color: themeController.isDarkMode.value
                    ? Colors.white // تغيير اللون في الوضع الداكن
                    : Mycolor.black, // اللون الافتراضي في الوضع الفاتح
                nextPage: nextPage,
              ),
            ),
          ),
          Spacer(), // يضيف فراغ ديناميكي لدفع النص إلى أقصى اليمين
          Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.widthPercentage(2.5), // تعديل المسافة بشكل تناسبي
            ),
            child: Text(
              title,
              style: FontStyles.profilesetting.copyWith(
                color: themeController.isDarkMode.value
                    ? Colors.white // تغيير اللون في الوضع الداكن
                    : Colors.black, // اللون الافتراضي في الوضع الفاتح
              ),
              textAlign: TextAlign.right, // النص باتجاه اليمين
            ),
          ),
        ],
      ),
    );
  }
}
