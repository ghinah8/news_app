import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChangePasswordController extends GetxController {
  Rx<XFile?> profileImage = Rx<XFile?>(null);

  // Observable variables for password fields
  var oldPassword = ''.obs;
  var newPassword = ''.obs;
  var reNewPassword = ''.obs;

  // TextEditingControllers for the password fields
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController reNewPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Bind observable variables to text editing controllers
    oldPasswordController.text = oldPassword.value;
    newPasswordController.text = newPassword.value;
    reNewPasswordController.text = reNewPassword.value;

    // Update observable values when text changes in the controllers
    oldPasswordController.addListener(() {
      oldPassword.value = oldPasswordController.text;
    });
    newPasswordController.addListener(() {
      newPassword.value = newPasswordController.text;
    });
    reNewPasswordController.addListener(() {
      reNewPassword.value = reNewPasswordController.text;
    });
  }

  @override
  void onClose() {
    // Dispose controllers when no longer needed
    oldPasswordController.dispose();
    newPasswordController.dispose();
    reNewPasswordController.dispose();
    super.onClose();
  }
}
