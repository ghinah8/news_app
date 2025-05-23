import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/const_data/app_colors.dart';
import '../../../../core/const_data/app_image.dart';
import '../../../../core/const_data/text_style.dart';
import '../../../../media_query_service.dart';
import '../../../../theme/controller.dart';
import '../../../../widgets/general/bottom_back.dart';
import '../../../../widgets/helpful_widgets/email_input_field.dart';
import '../controller/edit_controller.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final EditController controller = Get.put(EditController());
    final ThemeController themeController = Get.find(); // استدعاء ThemeController

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white, // تغيير اللون بناءً على الثيم
        actions: [
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.heightPercentage(2),
              right: SizeConfig.widthPercentage(2),
            ),
            child: Container(
              alignment: Alignment.centerRight,
              child: IconBackButton(),
            ),
          ),
        ],
        title: Padding(
          padding: EdgeInsets.only(top: SizeConfig.heightPercentage(2)),
          child: Text(
            "تعديل المعلومات الشخصية",
            style: FontStyles.editprofileTitle.copyWith(
              color: themeController.isDarkMode.value ? Colors.white : Colors.black, // تغيير اللون بناءً على الثيم
            ),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white, // تغيير الخلفية بناءً على الثيم
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.heightPercentage(3)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Obx(() {
                        return CircleAvatar(
                          radius: SizeConfig.widthPercentage(21), // حجم الصورة
                          backgroundImage: controller.profileImage.value != null
                              ? FileImage(File(controller.profileImage.value!.path))
                              : AssetImage(AppImage.profile_image) as ImageProvider,
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(4)),
                  Text(
                    "ريم علي",
                    style: FontStyles.settingText.copyWith(
                      color: themeController.isDarkMode.value ? Colors.white : Colors.black, // تغيير اللون بناءً على الثيم
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(7)),
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.widthPercentage(68),
                    ),
                    child: Text(
                      "تعديل الاسم",
                      style: FontStyles.profilesetting1.copyWith(
                        color: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black, // تغيير اللون بناءً على الثيم
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(2)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthPercentage(5),
                    ),
                    child: EmailInputField(
                      hintText: 'الاسم الجديد',
                      controller: controller.nameController,
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(4)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthPercentage(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        Text(
                          "تعديل البريد الالكتروني",
                          style: FontStyles.profilesetting1.copyWith(
                            color: themeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black, // تغيير اللون بناءً على الثيم
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(2)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthPercentage(5),
                    ),
                    child: EmailInputField(
                      hintText: 'البريد الالكتروني الجديد',
                      controller: controller.emailController,
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(4)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthPercentage(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.widthPercentage(0)),
                          child: Transform.translate(
                            offset: Offset(
                              -SizeConfig.widthPercentage(1.25), // القيمة الأصلية -5 كنسبة من العرض
                              SizeConfig.heightPercentage(0),   // القيمة الأصلية 0 تبقى ثابتة
                            ),
                            child: Container(
                              width: SizeConfig.widthPercentage(23),
                              height: SizeConfig.heightPercentage(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.widthPercentage(2)),
                                border: Border.all(
                                  width: SizeConfig.widthPercentage(0.4),
                                  color: themeController.isDarkMode.value
                                      ? Colors.white.withOpacity(0.7)
                                      : Colors.black.withOpacity(0.7), // تغيير اللون بناءً على الثيم
                                ),
                                color: themeController.isDarkMode.value
                                    ? Mycolor.darkThem
                                    : Mycolor.white, // تغيير اللون بناءً على الثيم
                              ),
                              child: Center(
                                child: Text(
                                  'إلغاء',
                                  style: FontStyles.cancelButton.copyWith(
                                    color: themeController.isDarkMode.value
                                        ? Colors.white
                                        : Colors.black, // تغيير اللون بناءً على الثيم
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.widthPercentage(0)),
                          child: Transform.translate(
                            offset: Offset(
                              SizeConfig.widthPercentage(2.25), // القيمة الأصلية 9 كنسبة من العرض
                              SizeConfig.heightPercentage(0),  // القيمة الأصلية 0 تبقى ثابتة
                            ),
                            child: Container(
                              width: SizeConfig.widthPercentage(23),
                              height: SizeConfig.heightPercentage(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.widthPercentage(2)),
                                border: Border.all(
                                  width: SizeConfig.widthPercentage(0.4),
                                  color: themeController.isDarkMode.value
                                      ? Colors.white
                                      : Mycolor.black, // تغيير اللون بناءً على الثيم
                                ),
                                color: themeController.isDarkMode.value
                                    ? Mycolor.white
                                    : Mycolor.black, // تغيير اللون بناءً على الثيم
                              ),
                              child: Center(
                                child: Text(
                                  'تعديل',
                                  style: FontStyles.confirmButton.copyWith(
                                    color: themeController.isDarkMode.value
                                        ? Colors.black
                                        : Colors.white, // تغيير اللون بناءً على الثيم
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
