import 'package:flutter/material.dart';
import 'package:get/get.dart'; // استيراد GetX
import '../../core/const_data/app_colors.dart';
import '../../core/const_data/text_style.dart'; // تعديل هذا إذا كان هنالك تعريفات معينة هنا
import '../../media_query_service.dart';
import '../../theme/controller.dart';

class CustomSwitchTile extends StatefulWidget {
  final String title; // النص الرئيسي
  final bool initialValue; // القيمة الافتراضية (تشغيل أو إيقاف)
  final ValueChanged<bool> onChanged; // استدعاء عند تغيير الحالة

  const CustomSwitchTile({
    Key? key,
    required this.title,
    this.initialValue = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomSwitchTileState createState() => _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  late RxBool isEnabled; // متغير الحالة من نوع RxBool

  @override
  void initState() {
    super.initState();
    isEnabled = widget.initialValue.obs; // تعيين القيمة الافتراضية باستخدام RxBool
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // تهيئة SizeConfig

    // الحصول على الـ ThemeController للتحقق من الوضع الحالي (داكن أو فاتح)
    final ThemeController themeController = Get.find();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.heightPercentage(2.0)), // استخدام النسب المئوية من الشاشة
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // الزر (Switch) على اليسار
          Obx(() => Transform.scale(
            scale: 0.8, // تصغير حجم الـ Switch
            child: Switch(
              value: isEnabled.value, // استخدام القيمة من RxBool
              activeColor: themeController.isDarkMode.value ? Colors.white : Colors.black, // تغيير اللون بناءً على الوضع
              activeTrackColor: themeController.isDarkMode.value ? Mycolor.grayThem : Colors.grey.shade400,
              inactiveThumbColor: themeController.isDarkMode.value ? Colors.white : Colors.grey.shade400,
              inactiveTrackColor: themeController.isDarkMode.value ? Mycolor.grayThem : Colors.black,
              onChanged: (value) {
                isEnabled.value = value; // تغيير الحالة باستخدام RxBool
                widget.onChanged(value); // استدعاء الدالة التي تم تمريرها
              },
            ),
          )),

          // النص على اليمين
          Expanded(
            child: Transform.translate(
              offset: Offset(-12, 0), // تحريك النص قليلاً نحو اليسار
              child: Text(
                widget.title,
                style: themeController.isDarkMode.value
                    ? FontStyles.seteng.copyWith(color: Colors.white) // استخدام اللون الأبيض في الوضع الداكن
                    : FontStyles.seteng.copyWith(color: Colors.black), // استخدام اللون الأسود في الوضع الفاتح
                textAlign: TextAlign.right, // محاذاة النص إلى اليمين
              ),
            ),
          ),
        ],
      ),
    );
  }
}
