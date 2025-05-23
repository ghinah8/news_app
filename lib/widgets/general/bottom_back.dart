import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/const_data/app_colors.dart';
import '../../theme/controller.dart';

class IconBackButton extends StatelessWidget {
  final double size; // حجم الأيقونة

  const IconBackButton({
    super.key,
    this.size = 23.0, // الحجم الافتراضي: 23
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find(); // التحكم بالثيم

    return GestureDetector(
      onTap: () {
        Get.back(); // العودة للصفحة السابقة
        print("العودة إلى الصفحة السابقة");
      },
      child: Obx(() => Icon(
        Icons.arrow_forward_ios, // الأيقونة
        color: themeController.isDarkMode.value
            ? Colors.white // لون الأيقونة في الوضع الليلي
            : Mycolor.black, // لون الأيقونة في الوضع النهاري
        size: size, // الحجم الممرر أو الافتراضي
      )),
    );
  }
}
