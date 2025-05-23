import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditController extends GetxController {
  Rx<XFile?> profileImage = Rx<XFile?>(null);
  var name = ''.obs;
  var email = ''.obs;

  // TextEditingControllers للحقول
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // ربط المتغيرات الافتراضية بقيم الحقول
    nameController.text = name.value;
    emailController.text = email.value;

    // تحديث القيم عند تغيير النصوص
    nameController.addListener(() {
      name.value = nameController.text;
    });
    emailController.addListener(() {
      email.value = emailController.text;
    });
  }

  @override
  void onClose() {
    // تنظيف الكنتولرات عند الانتهاء
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
