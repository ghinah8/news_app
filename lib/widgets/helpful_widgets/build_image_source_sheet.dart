import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../theme/controller.dart';
import '../../view/profile_page/profile/controller/profile_controller.dart';

Widget buildImageSourceSheet(ProfileController controller) {
  final ThemeController themeController = Get.find(); // استدعاء ThemeController للتحقق من حالة الثيم

  return SafeArea(
    child: Wrap(
      children: [
        ListTile(
          leading: Icon(
            Icons.camera_alt,
            color: themeController.isDarkMode.value ? Colors.white : Colors.black, // تغيير اللون بناءً على الثيم
          ),
          title: Text(
            "الكاميرا",
            style: TextStyle(
              color: themeController.isDarkMode.value ? Colors.white : Colors.black, // تغيير اللون بناءً على الثيم
            ),
          ),
          onTap: () {
            Get.back();
            controller.pickImage(ImageSource.camera);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.photo,
            color: themeController.isDarkMode.value ? Colors.white : Colors.black, // تغيير اللون بناءً على الثيم
          ),
          title: Text(
            "الاستوديو",
            style: TextStyle(
              color: themeController.isDarkMode.value ? Colors.white : Colors.black, // تغيير اللون بناءً على الثيم
            ),
          ),
          onTap: () {
            Get.back();
            controller.pickImage(ImageSource.gallery);
          },
        ),
      ],
    ),
  );
}
