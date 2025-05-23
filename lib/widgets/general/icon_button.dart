import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/const_data/app_colors.dart';

class IconBackButtonn extends StatelessWidget {
  final Widget nextPage; // الصفحة التي سيتم الانتقال إليها
  final Color color; // لون الأيقونة
  final double size; // حجم الأيقونة (اختياري)

  const IconBackButtonn({
    super.key,
    required this.nextPage,
    this.color = Mycolor.black, // لون افتراضي إذا لم يتم تحديده
    this.size = 20.0, // حجم افتراضي إذا لم يتم تحديده
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          nextPage,
          transition: Transition.fade, // تأثير الانتقال
          duration: const Duration(milliseconds: 300), // مدة الانتقال
        );
      },
      child: Icon(
        Icons.arrow_back_ios_new_sharp,
        color: color, // اللون المُمرر
        size: size, // الحجم المُمرر
      ),
    );
  }
}
