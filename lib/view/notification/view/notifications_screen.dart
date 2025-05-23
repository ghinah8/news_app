import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_image.dart';
import '../../../core/const_data/text_style.dart';
import '../../../media_query_service.dart';
import '../../../theme/controller.dart';
import '../../../widgets/general/Custom_bottom_navbar.dart';
import '../../../widgets/helpful_widgets/notifications_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig().init(context);
    final ThemeController themeController = Get.find(); // Get the theme controller

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Colors.white, // Change background color based on theme
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Colors.white, // AppBar background
          title: Text(
            "الإشعارات",
            style: FontStyles.notificationsTitle.copyWith(
              fontSize: SizeConfig.widthPercentage(5),
              color: themeController.isDarkMode.value ? Colors.white : Colors.black, // Text color based on theme
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: SizeConfig.widthPercentage(6),
              color: themeController.isDarkMode.value ? Colors.white : Colors.black, // Icon color based on theme
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.widthPercentage(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اليوم 11 كانون الأول ',
                      style: FontStyles.notificationDate.copyWith(
                        fontSize: SizeConfig.widthPercentage(4),
                        color: themeController.isDarkMode.value ? Colors.white : Colors.black, // Text color based on theme
                      ),
                      textAlign: TextAlign.right,
                    ),
                    NotificationsCard(
                      image: AppImage.RT,
                      content: "قامت روسيا اليوم بنشر خبر جديد  :إلغاء القمة الرباعية .. ماذا وراء تصريحات بايدن من تل أبيب؟",
                      time: "منذ 15 دقيقة",
                    ),
                    NotificationsCard(
                      image: AppImage.BBC,
                      content: "قامت بي بي سي بنشر خبر جديد  : هيئة الأسرى الفلسطينية تعلن عن أسماء 39 فلسطينياً ستفرج عنهم اسرائيل اليوم .",
                      time: "منذ 20 دقيقة",
                    ),
                    NotificationsCard(
                      image: AppImage.arabia,
                      content: "قامت العربية بنشر خبر جديد  :هدوء في غزة مع نهاية اليوم الأول من الهدنة .",
                      time: "منذ 21 دقيقة",
                    ),
                    SizedBox(height: SizeConfig.heightPercentage(2)),
                    // Responsive spacing
                    Text(
                      'الأربعاء  10 كانون الأول ',
                      style: FontStyles.notificationDate.copyWith(
                        fontSize: SizeConfig.widthPercentage(4),
                        color: themeController.isDarkMode.value ? Colors.white : Colors.black, // Text color based on theme
                      ),
                      textAlign: TextAlign.right,
                    ),
                    NotificationsCard(
                      image: AppImage.arabia,
                      content: "قامت العربية بنشر خبر جديد  :مقتل 8 مسلحين بغارات أمريكية بدير الزور .",
                      time: "منذ 10 ساعة",
                    ),
                    NotificationsCard(
                      image: AppImage.abuDhabi,
                      content: "قامت روسيا اليوم بنشر خبر جدي",
                      time: "منذ 12 ساعة",
                    ),
                    NotificationsCard(
                      image: AppImage.abuDhabi,
                      content: "قامت أبو ظبي الرياضية بتحديث حالتها: تيجالي يسجل نفس الهدف مرتين .",
                      time: "منذ عشرين دقيقة",
                    ),
                  ],
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BottomNavBar(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
