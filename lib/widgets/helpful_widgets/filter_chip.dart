import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/const_data/app_colors.dart';
import '../../media_query_service.dart';
import '../../theme/controller.dart';
import '../../view/search_page/controller/search_controller.dart';

Widget filterChip(String label, SearchPageController controller) {
  // الحصول على ThemeController للتحقق من الوضع (داكن أو فاتح)
  final ThemeController themeController = Get.find();

  return GestureDetector(
    onTap: () {
      controller.selectedFilter.value = label;
    },
    child: Obx(() => Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthPercentage(4),
        vertical: SizeConfig.heightPercentage(1),
      ),
      decoration: BoxDecoration(
        color: controller.selectedFilter.value == label
            ? themeController.isDarkMode.value ? Mycolor.darkThem : Colors.blue[100] // تغيير اللون عند تحديد الفلتر بناءً على الثيم
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: themeController.isDarkMode.value ? Mycolor.darkThem : Colors.white, // تغيير لون الحدود بناءً على الثيم
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: SizeConfig.widthPercentage(3.5),
          color: controller.selectedFilter.value == label
              ? themeController.isDarkMode.value ? Colors.white : Colors.black // تغيير اللون بناءً على الثيم عند التحديد
              : themeController.isDarkMode.value ? Colors.white70 : Colors.black87, // تغيير اللون بناءً على الثيم عندما لا يتم التحديد
        ),
      ),
    )),
  );
}
