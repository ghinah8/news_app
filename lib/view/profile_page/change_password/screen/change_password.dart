import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/const_data/app_colors.dart';
import '../../../../core/const_data/app_image.dart';
import '../../../../core/const_data/text_style.dart';
import '../../../../media_query_service.dart';
import '../../../../theme/controller.dart';
import '../../../../widgets/general/bottom_back.dart';
import '../../../../widgets/helpful_widgets/email_input_field.dart';
import '../controller/change_password_controller.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final ChangePasswordController controller = Get.put(ChangePasswordController());
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white,
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
            "تغيير كلمة السر",
            style: themeController.isDarkMode.value
                ? FontStyles.editprofileTitle.copyWith(color: Colors.white)
                : FontStyles.editprofileTitle.copyWith(color: Mycolor.black),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white,
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
                          radius: SizeConfig.widthPercentage(21),
                          backgroundImage: controller.profileImage.value != null
                              ? FileImage(File(controller.profileImage.value!.path))
                              : AssetImage(AppImage.profile_image)
                          as ImageProvider,
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(1.8)),
                  Text(
                    "ريم علي",
                    style: themeController.isDarkMode.value
                        ? FontStyles.profileTitle.copyWith(color: Colors.white)
                        : FontStyles.profileTitle.copyWith(color: Mycolor.black),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(5.2)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthPercentage(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ": ادخل كلمة السر القديمة",
                          style: themeController.isDarkMode.value
                              ? FontStyles.formTitle.copyWith(color: Colors.white)
                              : FontStyles.formTitle.copyWith(color: Mycolor.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(2)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthPercentage(5)),
                    child: EmailInputField(
                      hintText: 'كلمة السر القديمة',
                      controller: controller.oldPasswordController,
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(5.2)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthPercentage(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ": ادخل كلمة السر الجديدة",
                          style: themeController.isDarkMode.value
                              ? FontStyles.formTitle.copyWith(color: Colors.white)
                              : FontStyles.formTitle.copyWith(color: Mycolor.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(2)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthPercentage(5)),
                    child: EmailInputField(
                      hintText: 'كلمة السر الجديدة',
                      controller: controller.newPasswordController,
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(5.2)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthPercentage(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ": اعد كتابة كلمة السر الجديدة",
                          style: themeController.isDarkMode.value
                              ? FontStyles.formTitle.copyWith(color: Colors.white)
                              : FontStyles.formTitle.copyWith(color: Mycolor.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(2)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthPercentage(5)),
                    child: EmailInputField(
                      hintText: 'تأكيد كلمة السر',
                      controller: controller.reNewPasswordController,
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(5.2)),
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
                            offset: Offset(-5, 0),
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
                                      : Colors.black54,
                                ),
                                color: themeController.isDarkMode.value
                                    ? Mycolor.darkThem
                                    : Mycolor.white,
                              ),
                              child: Center(
                                child: Text(
                                  'إلغاء',
                                  style: themeController.isDarkMode.value
                                      ? FontStyles.cancelButton.copyWith(color: Colors.white)
                                      : FontStyles.cancelButton.copyWith(color: Mycolor.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: SizeConfig.widthPercentage(0),),
                          child: Transform.translate(
                            offset: Offset(9, 0),
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
                                      : Mycolor.black,
                                ),
                                color: themeController.isDarkMode.value
                                    ? Mycolor.white
                                    : Mycolor.black,
                              ),
                              child: Center(
                                child: Text(
                                  'تغير',
                                  style: themeController.isDarkMode.value
                                      ? FontStyles.confirmButton.copyWith(color: Colors.black)
                                      : FontStyles.confirmButton.copyWith(color: Mycolor.white),
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
