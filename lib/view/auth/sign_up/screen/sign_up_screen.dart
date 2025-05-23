import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/const_data/app_colors.dart';
import '../../../../core/const_data/app_image.dart';
import '../../../../core/const_data/text_style.dart';
import '../../../../media_query_service.dart';
import '../../../../theme/controller.dart';
import '../../../../widgets/general/bottom_back.dart';
import '../../../../widgets/helpful_widgets/email_input_field.dart';
import '../../auth_controller/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // وضع المتحكم هنا داخل الدالة
    Get.put(AuthController()); // تأكد من إضافة المتحكم هنا إذا كنت تريد إضافته بشكل يدوي

    SizeConfig().init(context); // تهيئة SizeConfig
    final authController = Get.find<AuthController>(); // استدعاء المتحكم الخاص بالتسجيل
    final ThemeController themeController = Get.find(); // استدعاء المتحكم الخاص بالثيم

    // تحديد اللون بناءً على الثيم
    final backgroundColor = themeController.isDarkMode.value
        ? Mycolor.darkThem // لون داكن
        : Colors.white; // لون فاتح

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconBackButton(),
          ),
        ],
        backgroundColor: backgroundColor, // نفس اللون كما في الجسم
        iconTheme: IconThemeData(
          color: themeController.isDarkMode.value ? Colors.white : Colors.black, // تغيير لون الأيقونات بناءً على الثيم
        ),
      ),
      body: Container(
        color: backgroundColor, // نفس اللون كما في الـ AppBar
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthPercentage(5), // حواف أفقية 5% من العرض
              vertical: SizeConfig.heightPercentage(2), // حواف عمودية 2% من الارتفاع
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: SizeConfig.widthPercentage(6),
                    left: SizeConfig.widthPercentage(6),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      themeController.isDarkMode.value
                          ? AppImage.nn // صورة في وضع الثيم الداكن
                          : AppImage.newslogin, // صورة في وضع الثيم الفاتح
                      width: SizeConfig.widthPercentage(40), // عرض 50% من الشاشة
                      height: SizeConfig.heightPercentage(17), // ارتفاع 25%
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.heightPercentage(4.5)), // مسافة بين العناصر

                // حقول الإدخال
                EmailInputField(
                  hintText: "البريد الالكتروني",
                  controller: authController.emailController,
                ),

                SizedBox(height: SizeConfig.heightPercentage(3)),
                EmailInputField(
                  hintText: 'اسم المستخدم',
                  controller: authController.nameController,
                ),

                SizedBox(height: SizeConfig.heightPercentage(3)),
                EmailInputField(
                  hintText: 'كلمة السر',
                  controller: authController.passwordController,
                ),
                SizedBox(height: SizeConfig.heightPercentage(3)),
                EmailInputField(
                  hintText: 'تأكيد كلمة السر',
                  controller: authController.passwordConfirmationController,
                ),

                SizedBox(height: SizeConfig.heightPercentage(3)),

                ElevatedButton(
                  onPressed: () {
                    authController.signUp(); // استدعاء الدالة للتسجيل
                    print("تم الضغط على إنشاء حساب");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeController.isDarkMode.value
                        ? Colors.white // خلفية زر في الثيم الداكن
                        : Colors.black, // خلفية زر في الثيم الفاتح
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConfig.widthPercentage(2)), // حواف مستديرة
                    ),
                    elevation: 0,
                    minimumSize: Size(
                      SizeConfig.widthPercentage(90), // عرض 90% من الشاشة
                      SizeConfig.heightPercentage(6.5), // ارتفاع 7% من الشاشة
                    ),
                  ),
                  child: Text(
                    "إنشاء الحساب",
                    style: GoogleFonts.cairo(
                      textStyle: FontStyles.authButtonText.copyWith(
                        color: themeController.isDarkMode.value
                            ? Colors.black
                            : Colors.white, // تغيير لون النص بناءً على الثيم
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.heightPercentage(5)),

                Text(
                  'إنشاء الحساب بواسطة',
                  style: GoogleFonts.cairo(
                    textStyle: FontStyles.authInAnotherWay.copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black, // تغيير لون النص بناءً على الثيم
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.heightPercentage(2)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImage.google,
                      width: SizeConfig.widthPercentage(10), // حجم ديناميكي
                    ),
                    SizedBox(width: SizeConfig.widthPercentage(2)),
                    Image.asset(
                      AppImage.facebook,
                      width: SizeConfig.widthPercentage(10), // حجم ديناميكي
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
