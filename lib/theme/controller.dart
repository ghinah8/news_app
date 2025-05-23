import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  // الحالة الحالية للثيم (افتراضيًا الوضع الفاتح)
  RxBool isDarkMode = false.obs;

  // متغير لإدارة إعدادات حجم الخط
  RxInt fontSizeIndex = 0.obs;  // 0: متوسط، 1: كبير، 2: كبير جدًا

  // متغير لإدارة إعدادات التشغيل التلقائي
  RxInt autoPlayIndex = 0.obs;  // 0: عدم التشغيل، 1: تشغيل على الواي فاي فقط، 2: تشغيل على جميع الشبكات

  @override
  void onInit() {
    super.onInit();
    loadTheme(); // تحميل الثيم عند بدء التطبيق
  }

  // تحميل الثيم من SharedPreferences
  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
  }

  // تغيير الثيم وحفظه في SharedPreferences
  void toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode.value);

    // تغيير الثيم في التطبيق
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
  }

  // تغيير حجم الخط
  void changeFontSize(int index) {
    fontSizeIndex.value = index;
    // يمكنك إضافة منطق هنا لتغيير حجم الخط في التطبيق بناءً على index
  }

  // تغيير إعدادات التشغيل التلقائي
  void changeAutoPlay(int index) {
    autoPlayIndex.value = index;
    // يمكنك إضافة منطق هنا لتغيير إعدادات التشغيل التلقائي بناءً على index
  }
}
