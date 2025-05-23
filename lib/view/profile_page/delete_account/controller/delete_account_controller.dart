import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DeleteAccountController extends GetxController {
  Rx<XFile?> profileImage = Rx<XFile?>(null);

  var password = ''.obs; // متغير كلمة المرور

  // TextEditingController لحقل كلمة المرور
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // ربط المتغير الافتراضي بقيمة الحقل
    passwordController.text = password.value;

    // تحديث القيم عند تغيير النص في حقل كلمة المرور
    passwordController.addListener(() {
      password.value = passwordController.text;
    });
  }

  @override
  void onClose() {
    // تنظيف الكونترولر عند الانتهاء
    passwordController.dispose();
    super.onClose();
  }
}
