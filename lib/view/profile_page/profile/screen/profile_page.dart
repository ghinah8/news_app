import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/const_data/app_colors.dart';
import '../../../../core/const_data/app_image.dart';
import '../../../../core/const_data/text_style.dart';
import '../../../../media_query_service.dart';
import '../../../../theme/controller.dart';
import '../../../../widgets/general/Custom_bottom_navbar.dart';
import '../../../../widgets/general/bottom_back.dart';
import '../../../../widgets/helpful_widgets/build_image_source_sheet.dart';
import '../../../../widgets/helpful_widgets/container_widget.dart';
import '../../change_password/screen/change_password.dart';
import '../../delete_account/screen/delete_account.dart';
import '../../edit_profile/screen/Edit_profile.dart';
import '../controller/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final ProfileController controller = Get.put(ProfileController());
    final ThemeController themeController = Get.find(); // استدعاء ThemeController للتحقق من الثيم

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
            "ريم علي",
            style: FontStyles.profileTitle.copyWith(
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
                          radius: SizeConfig.widthPercentage(21), // 85/394
                          backgroundImage: controller.profileImage.value != null
                              ? FileImage(File(controller.profileImage.value!.path))
                              : AssetImage(AppImage.profile_image) as ImageProvider,
                        );
                      }),
                      Positioned(
                        bottom: SizeConfig.heightPercentage(3),
                        right: SizeConfig.widthPercentage(30),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => buildImageSourceSheet(controller),
                            );
                          },
                          child: Container(
                            width: SizeConfig.widthPercentage(12), // 50/394
                            height: SizeConfig.widthPercentage(12), // 50/394
                            decoration: BoxDecoration(
                              color: Mycolor.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: SizeConfig.widthPercentage(2), // 8/394
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(SizeConfig.widthPercentage(3.8)), // 15/394
                              child: Image.asset(
                                AppImage.edite_profile,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(2)),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => buildImageSourceSheet(controller),
                      );
                    },
                    child: Text(
                      "تعديل صورة الملف الشخصي",
                      style: FontStyles.chandeprofilephoto.copyWith(
                        color: themeController.isDarkMode.value ? Colors.white : Colors.black, // تغيير اللون بناءً على الثيم
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(1)),
                  Container(
                    width: SizeConfig.widthPercentage(42), // 165/394
                    height: 0,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 1, color: themeController.isDarkMode.value ? Colors.white : Mycolor.black))), // تغيير اللون بناءً على الثيم
                  ),
                  SizedBox(height: SizeConfig.heightPercentage(2)),
                  Container(
                    width: SizeConfig.widthPercentage(100),
                    height: SizeConfig.heightPercentage(55), // 440/800
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.heightPercentage(2)),
                        InkWell(
                          onTap: () => Get.toNamed('/editProfile'), // التنقل إلى الصفحة المطلوبة
                          child: Padding(
                            padding: EdgeInsets.only(right: SizeConfig.widthPercentage(1.5)),
                            child: CustomHeader(
                              title: "تعديل المعلومات الشخصية",
                              nextPage: EditProfile(),
                              iconColor: themeController.isDarkMode.value ? Colors.white : Mycolor.black, // تغيير اللون بناءً على الثيم
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.heightPercentage(10)),
                        InkWell(
                          onTap: () => Get.toNamed('/changePassword'), // التنقل إلى الصفحة المطلوبة
                          child: Padding(
                            padding: EdgeInsets.only(right: SizeConfig.widthPercentage(1.5)),
                            child: CustomHeader(
                              title: "تغيير كلمة السر",
                              nextPage: ChangePassword(),
                              iconColor: themeController.isDarkMode.value ? Colors.white : Mycolor.black, // تغيير اللون بناءً على الثيم
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.heightPercentage(10)),
                        InkWell(
                          onTap: () => Get.offAndToNamed("/log_in_screen"), // التنقل إلى الصفحة المطلوبة
                          child: Padding(
                            padding: EdgeInsets.only(right: SizeConfig.widthPercentage(1.5)),
                            child: CustomHeader(
                              title: "تسجيل الخروج",
                              nextPage: DeleteAccount(),
                              iconColor: themeController.isDarkMode.value ? Colors.white : Mycolor.black, // تغيير اللون بناءً على الثيم
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.heightPercentage(10)),
                        InkWell(
                          onTap: () => Get.toNamed('/deleteAccount'), // التنقل إلى الصفحة المطلوبة
                          child: Padding(
                            padding: EdgeInsets.only(right: SizeConfig.widthPercentage(1.5)),
                            child: CustomHeader(
                              title: "حذف حسابي ",
                              nextPage: DeleteAccount(),
                              iconColor: themeController.isDarkMode.value ? Colors.white : Mycolor.black, // تغيير اللون بناءً على الثيم
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
      bottomNavigationBar: BottomNavBar(
        onPressedHome: () {
          Get.toNamed("/home_page");
        },
        onPressedBookmark: () {
          Get.toNamed("/surveys_screen");
        },
        onPressedStats: () {
          Get.toNamed("/book_marks_screen");
        },
        onPressedProfile: () {
          Get.toNamed("/profile");
        },
        isSelectedHome: false,
        isSelectedpoll: false,
        isSelectedBookmarks: false,
        isSelectedProfile: true,
      ),
    );
  }
}
