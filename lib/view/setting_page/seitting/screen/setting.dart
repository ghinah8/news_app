import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/const_data/app_colors.dart';
import '../../../../core/const_data/app_image.dart';
import '../../../../core/const_data/text_style.dart';
import '../../../../media_query_service.dart';
import '../../../../theme/controller.dart';
import '../../../../widgets/general/Custom_bottom_navbar.dart';
import '../../../../widgets/general/bottom_back.dart';
import '../../../../widgets/general/icon_button.dart';
import '../../../../widgets/helpful_widgets/customs_buttom.dart';
import '../../../about_app_page/screen/about_app_screen.dart';
import '../../Warnings/screen/warning.dart';
import '../../setting/screen/setting.dart';
import '../controller/controller.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final SettingController controller = Get.put(SettingController());
    final ThemeController themeController = Get.find();

    return Obx(() {
      // Activate theme based on dark mode
      return Scaffold(
        backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar section
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.widthPercentage(3),
                  right: SizeConfig.widthPercentage(1),
                  top: SizeConfig.heightPercentage(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // ColorFilter applied based on theme
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            themeController.isDarkMode.value
                                ? Colors.white.withOpacity(0.6)
                                : Colors.black.withOpacity(0.6),
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            AppImage.shape,
                            width: SizeConfig.widthPercentage(4),
                            height: SizeConfig.heightPercentage(4),
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: SizeConfig.widthPercentage(4)),
                        InkWell(
                          onTap: () {
                            Get.toNamed("/notifications_screen");
                          },
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              themeController.isDarkMode.value
                                  ? Colors.white.withOpacity(0.6)
                                  : Colors.black.withOpacity(0.6),
                              BlendMode.srcIn,
                            ),
                            child: Image.asset(
                              AppImage.notifications,
                              width: SizeConfig.widthPercentage(4.5),
                              height: SizeConfig.heightPercentage(4.5),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        controller.isPressed.value = !controller.isPressed.value;
                        Get.toNamed("/setting_tow");
                      },
                      child: IconBackButton(),
                    ),
                  ],
                ),
              ),
              // Main content
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthPercentage(2),
                  vertical: SizeConfig.heightPercentage(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "ريم علي",
                          style: FontStyles.settingText.copyWith(
                            color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.black,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed('/profile');
                          },
                          child: Text(
                            "تعديل الملف الشخصي",
                            style: FontStyles.editprofile.copyWith(
                              color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.black1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: SizeConfig.widthPercentage(5)),
                    ClipOval(
                      child: Image.asset(
                        AppImage.profile_image,
                        width: SizeConfig.widthPercentage(18),
                        height: SizeConfig.widthPercentage(18),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              // Settings items
              buildSettingItem(
                context,
                "الإعدادات",
                AppImage.settingsIcon,
                SettingTow(),
                "/setting_tow",
              ),
              buildSettingItem(
                context,
                "التنبيهات",
                AppImage.notifications,
                Warning(),
                "/warning",
              ),
              buildSettingItem(
                context,
                "حول التطبيق",
                AppImage.grop,
                AboutAppScreen(),
                "/about_app_screen",
              ),
              buildLogoutItem(context, themeController),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          onPressedHome: () {
            Get.toNamed("/home_page");
          },
          onPressedStats: () {
            Get.toNamed("/book_marks_screen");
          },
          onPressedBookmark: () {
            Get.toNamed("/surveys_screen");
          },
          onPressedProfile: () {
            Get.toNamed("/profile");
          },
          isSelectedHome: false,
          isSelectedpoll: false,
          isSelectedBookmarks: false,
          isSelectedProfile: false,
        ),
      );
    });
  }

  Widget buildSettingItem(BuildContext context, String text, String iconPath, Widget nextPage, String routeName) {
    final ThemeController themeController = Get.find();

    return InkWell(
      onTap: () {
        Get.toNamed(routeName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: SizeConfig.heightPercentage(1.0)),
        padding: EdgeInsets.only(right: SizeConfig.widthPercentage(4)),
        decoration: BoxDecoration(
          color: themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: CustomSettingItem(
          text: text,
          iconPath: iconPath,
          nextPage: nextPage,
          routeName: routeName,
        ),
      ),
    );
  }

  Widget buildLogoutItem(BuildContext context, ThemeController themeController) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthPercentage(3),
        vertical: SizeConfig.heightPercentage(2.5),
      ),
      child: InkWell(
        onTap: () {
          Get.defaultDialog(
            title: "تأكيد تسجيل الخروج",
            middleText: "هل أنت متأكد أنك تريد تسجيل الخروج؟",
            backgroundColor: Mycolor.lightgray,
            titleStyle: FontStyles.editprofile.copyWith(
              color: Mycolor.primaryColor,
            ),
            middleTextStyle: GoogleFonts.cairo(
              color: Mycolor.primaryColor,
              fontSize: SizeConfig.heightPercentage(16 / 800 * 100),
            ),
            actions: [
              buildDialogButton(context, "نعم", Mycolor.primaryColor, () {
                Get.find<SettingController>().logout();
                Get.back();
              }),
              SizedBox(width: SizeConfig.widthPercentage(2)),
              buildDialogButton(context, "لا", Mycolor.gray, () {
                Get.back();
              }),
            ],
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: SizeConfig.heightPercentage(1.0)),
          padding: EdgeInsets.only(left: SizeConfig.widthPercentage(5)),
          decoration: BoxDecoration(
            color: themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform.translate(
                offset: Offset(-SizeConfig.widthPercentage(5.5), 0),
                child: IconBackButtonn(
                  nextPage: paddingZero,
                  color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.gray,
                ),
              ),
              Row(
                children: [
                  Text(
                    "تسجيل الخروج",
                    style: FontStyles.settingText.copyWith(
                      color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.primaryColor,
                    ),
                  ),
                  SizedBox(width: SizeConfig.widthPercentage(2)),
                  Padding(
                    padding: EdgeInsets.only(right: SizeConfig.widthPercentage(2)),
                    child: Obx(() {
                      final color = themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black;
                      return ColorFiltered(
                        colorFilter: ColorFilter.mode(color ?? Colors.blue, BlendMode.srcIn),
                        child: Image.asset(
                          AppImage.logoutIcon,
                          width: SizeConfig.widthPercentage(6),
                          height: SizeConfig.widthPercentage(6),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDialogButton(BuildContext context, String label, Color color, VoidCallback onPressed) {
    return Container(
      width: SizeConfig.widthPercentage(18),
      height: SizeConfig.heightPercentage(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: FontStyles.yes.copyWith(color: Mycolor.white),
        ),
      ),
    );
  }
}
