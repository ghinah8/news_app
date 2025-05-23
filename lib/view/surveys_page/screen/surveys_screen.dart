import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_image.dart';
import '../../../core/const_data/text_style.dart';
import '../../../media_query_service.dart';
import '../../../theme/controller.dart';
import '../../../widgets/general/Custom_bottom_navbar.dart';
import '../../../widgets/general/bottom_back.dart';
import '../../../widgets/helpful_widgets/surveys_option_widget.dart';
import '../controller/surveys_controller.dart';

class SurveysScreen extends StatelessWidget {
  const SurveysScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // تهيئة SizeConfig
    SizeConfig().init(context);

    // استدعاء ThemeController للتحقق من حالة الثيم
    final ThemeController themeController = Get.find();

    return Scaffold(
      backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Colors.white, // تغيير الخلفية بناءً على الثيم

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Colors.white, // تغيير الخلفية بناءً على الثيم
        title: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.widthPercentage(30), // نسبة العرض
            right: SizeConfig.widthPercentage(13), // نسبة العرض
          ),
          child: Text(
            'استبيان اليوم',
            style: GoogleFonts.cairo(
              color: themeController.isDarkMode.value ? Colors.white : Colors.black, // تغيير اللون بناءً على الثيم
              fontSize: SizeConfig.widthPercentage(5), // حجم النص ديناميكي
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.widthPercentage(2), // نسبة العرض
            ),
            child: IconBackButton(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: SizeConfig.heightPercentage(3)), // نسبة الارتفاع
            Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.widthPercentage(3), // نسبة العرض
              ),
              child: Text(
                'ريال مدريد ينتصر في كلاسيكو الكرة الإسبانية على غريمه\n التقليدي برشلونة في مباراة مثيرة للجدل تحكيمياً\n '
                    'فهل كان انتصاراً مستحقاً أم أن الحكم قد حرم برشلونة من \nنقاط مهمة في الصراع على اللقب',
                style: GoogleFonts.cairo(
                  textStyle: FontStyles.notificationContant,
                  height: 1.8,
                  color: themeController.isDarkMode.value ? Colors.white : Colors.black, // تغيير اللون بناءً على الثيم
                ),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(height: SizeConfig.heightPercentage(2.5)), // نسبة الارتفاع
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthPercentage(3), // نسبة العرض
              ),
              child: Image.asset(AppImage.pollImage),
            ),
            SizedBox(height: SizeConfig.heightPercentage(2)), // نسبة الارتفاع
            GetBuilder<SurveyController>(
              init: SurveyController(),
              builder: (controller) {
                return SurveyOptionWidget(controller: controller);
              },
            ),
            Center(
              child: Container(
                width: SizeConfig.widthPercentage(45),
                height: SizeConfig.heightPercentage(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    SizeConfig.widthPercentage(2),
                  ),
                  border: Border.all(
                    width: SizeConfig.widthPercentage(0.3),
                    color: themeController.isDarkMode.value ? Colors.white : Mycolor.black, // تغيير اللون بناءً على الثيم
                  ),
                  color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.black, // تغيير اللون بناءً على الثيم
                ),
                child: InkWell(
                  onTap: () {

                  },
                  child: Center(
                    child: Text(
                      'مشاهدة نتائج التصويت',
                      style: GoogleFonts.cairo(
                        textStyle: FontStyles.authButtonText,
                        color: themeController.isDarkMode.value ? Colors.black : Colors.white, // تغيير اللون بناءً على الثيم
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightPercentage(4)), // نسبة الارتفاع
            Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.widthPercentage(3), // نسبة العرض
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.cairo(
                        fontSize: SizeConfig.widthPercentage(4), // حجم النص ديناميكي
                        color: themeController.isDarkMode.value ? Colors.white : Mycolor.black, // تغيير اللون بناءً على الثيم
                      ),
                      children: [
                        TextSpan(
                          text: 'يمكنك معرفة تفاصيل إضافية عن هذا الخبر من ', // النص الأساسي
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: 'هنا',
                          style: GoogleFonts.cairo(
                            color: themeController.isDarkMode.value ? Colors.white : Mycolor.black, // تغيير اللون بناءً على الثيم
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: themeController.isDarkMode.value ? Colors.white : Mycolor.black, // تغيير اللون بناءً على الثيم
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onPressedHome: () {
          Get.toNamed("/home_page"); // الانتقال إلى HomePage
        },
        onPressedStats: () {
          Get.toNamed("/book_marks_screen"); // الانتقال إلى SurveysScreen
        },
        onPressedBookmark: () {
          Get.toNamed("/surveys_screen"); // الانتقال إلى SurveysScreen

        },

        onPressedProfile: () {
          Get.toNamed("/profile"); // الانتقال إلى ProfilePage
        },
        isSelectedHome: false,
        isSelectedpoll: false,
        isSelectedBookmarks: true,
        isSelectedProfile: false,
      ),
    );
  }
}
