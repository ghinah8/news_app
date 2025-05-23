import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neww_app/view/country_page/screen/country_page.dart';
import '../../../../core/const_data/app_colors.dart';
import '../../../../core/const_data/app_image.dart';
import '../../../../core/const_data/text_style.dart';
import '../../../../media_query_service.dart'; // استدعاء كلاس SizeConfig
import '../../../../theme/controller.dart';
import '../../../../widgets/helpful_widgets/email_input_field.dart';
import '../../auth_controller/auth_controller.dart'; // استيراد المتحكم

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController()); // وضع المتحكم هنا داخل الدالة

    // تهيئة SizeConfig
    SizeConfig().init(context);

    // الحصول على المتحكم
    final authController = Get.find<AuthController>();
    final ThemeController themeController =
        Get.find(); // استدعاء المتحكم الخاص بالثيم

    return Scaffold(
      backgroundColor: themeController.isDarkMode.value
          ? Mycolor.darkThem // استخدم اللون الخاص بالوضع الداكن
          : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height:
                    SizeConfig.heightPercentage(11)), // 10% من ارتفاع الشاشة
            Center(
              child: Image.asset(
                themeController.isDarkMode.value
                    ? AppImage.nn // الصورة في وضع الثيم الداكن
                    : AppImage.newslogin, // الصورة في وضع الثيم الفاتح
                width: SizeConfig.widthPercentage(40), // 40% من عرض الشاشة
                height: SizeConfig.heightPercentage(20), // 20% من ارتفاع الشاشة
              ),
            ),
            SizedBox(
                height: SizeConfig.heightPercentage(3)), // 3% من ارتفاع الشاشة
            // حقول الإدخال
            EmailInputField(
              hintText: 'البريد الالكتروني',
              controller: authController.emailController,
            ),

            SizedBox(
                height: SizeConfig.heightPercentage(4)), // 5% من ارتفاع الشاشة
            EmailInputField(
              hintText: 'كلمة السر',
              controller: authController.passwordController,
            ),
            SizedBox(
                height: SizeConfig.heightPercentage(4)), // 5% من ارتفاع الشاشة
            ElevatedButton(
              onPressed: () async {
                Get.to(
                  CountryPage(),
                  transition: Transition.fade,
                  duration: const Duration(milliseconds: 300),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: themeController.isDarkMode.value
                    ? Colors.white
                    : Colors.black, // تغيير اللون حسب الثيم
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                elevation: 0,
                minimumSize: Size(
                  SizeConfig.widthPercentage(90), // 90% من عرض الشاشة
                  SizeConfig.heightPercentage(6.5), // 7% من ارتفاع الشاشة
                ),
              ),
              child: Text(
                "تسجيل الدخول",
                style: GoogleFonts.cairo(
                  textStyle: FontStyles.authButtonText.copyWith(
                    color: themeController.isDarkMode.value
                        ? Colors.black
                        : Colors.white, // تغيير لون النص بناءً على الثيم
                  ),
                ),
              ),
            ),

            SizedBox(height: SizeConfig.heightPercentage(2)),
            Text(
              'هل نسيت كلمة السر ؟',
              style: GoogleFonts.cairo(
                textStyle: FontStyles.forgetpasswordText.copyWith(
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black, // تغيير لون النص بناءً على الثيم
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightPercentage(4)),
            Text(
              'تسجيل الدخول بواسطة',
              style: GoogleFonts.cairo(
                textStyle: FontStyles.authInAnotherWay.copyWith(
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black, // تغيير لون النص بناءً على الثيم
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImage.google,
                  width: SizeConfig.widthPercentage(10),
                  height: SizeConfig.heightPercentage(10),
                ),
                SizedBox(width: SizeConfig.widthPercentage(2)),
                Image.asset(
                  AppImage.facebook,
                  width: SizeConfig.widthPercentage(10),
                  height: SizeConfig.heightPercentage(10),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightPercentage(1)),

            Text(
              'ليس لديك حساب ؟',
              style: GoogleFonts.cairo(
                textStyle: FontStyles.authInAnotherWay.copyWith(
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black, // تغيير لون النص بناءً على الثيم
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed("/sign_up_screen");
                print("تم الضغط على إنشاء حساب");
              },
              child: Text(
                'إنشاء حساب',
                style: GoogleFonts.cairo(
                  textStyle: FontStyles.createAccountText.copyWith(
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black, // تغيير لون النص بناءً على الثيم
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
