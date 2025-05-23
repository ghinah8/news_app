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
import '../controller/delete_account_controller.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final DeleteAccountController controller = Get.put(DeleteAccountController());
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
            " حذف الحساب ",
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
                          radius: SizeConfig.widthPercentage(21),
                          backgroundImage: controller.profileImage.value != null
                              ? FileImage(File(controller.profileImage.value!.path))
                              : AssetImage(AppImage.profile_image) as ImageProvider,
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(3)),
                  Text(
                    "ريم علي",
                    style: FontStyles.profileTitle.copyWith(
                      color: themeController.isDarkMode.value ? Colors.white : Colors.black, // تغيير اللون بناءً على الثيم
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(10)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthPercentage(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ":ادخل كلمة السر لحذف الحساب",
                          style: FontStyles.formTitle.copyWith(
                            color: themeController.isDarkMode.value
                                ? Colors.white.withOpacity(0.7) // تغيير اللون بناءً على الثيم
                                : Colors.black.withOpacity(0.7), // تغيير اللون بناءً على الثيم
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(2)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthPercentage(5)),
                    child: EmailInputField(
                      hintText: 'كلمة السر',
                      controller: controller.passwordController,
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(4)),
                  Padding(
                    padding: EdgeInsets.only(right: SizeConfig.widthPercentage(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: SizeConfig.widthPercentage(0)),
                          child: Transform.translate(
                            offset: Offset(
                              SizeConfig.widthPercentage(0.5), // عرض ديناميكي
                              SizeConfig.heightPercentage(0), // ارتفاع ديناميكي
                            ),
                            child: Container(
                              width: SizeConfig.widthPercentage(23),
                              height: SizeConfig.heightPercentage(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeConfig.widthPercentage(2)),
                                border: Border.all(
                                  width: SizeConfig.widthPercentage(0.4),
                                  color: themeController.isDarkMode.value
                                      ? Colors.white
                                      : Mycolor.black, // تغيير اللون بناءً على الثيم
                                ),
                                color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.black, // تغيير اللون بناءً على الثيم
                              ),
                              child: Center(
                                child: Text(
                                  'موافق',
                                  style: FontStyles.confirmButton.copyWith(
                                    color: themeController.isDarkMode.value ? Colors.black : Colors.white, // تغيير اللون بناءً على الثيم
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
