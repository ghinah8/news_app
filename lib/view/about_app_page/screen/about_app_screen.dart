import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_image.dart';
import '../../../core/const_data/text_style.dart';
import '../../../media_query_service.dart';
import '../../../theme/controller.dart';
import '../../../widgets/general/bottom_back.dart';
import '../../../widgets/helpful_widgets/contact_dialge_widget.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // تهيئة MediaQuery
    SizeConfig().init(context);

    // استدعاء المتحكم للثيم
    final ThemeController themeController = Get.find();

    // تحديد الألوان بناءً على الثيم
    final backgroundColor = themeController.isDarkMode.value ? Mycolor.darkThem : Colors.white;
    final textColor = themeController.isDarkMode.value ? Colors.white : Colors.black;

    // البيانات الديناميكية للنصوص والأيقونات
    final String dialogTitle = 'اختر أحد تطبيقات التواصل الاجتماعي للتواصل';
    final String shareDialogTitle = 'اختر أحد تطبيقاتك لنشر التطبيق';
    final String buttonText = 'نسخ البريد الإلكتروني الخاص بالتطبيق';
    final List<Map<String, dynamic>> socialIconsWithColors = [
      {'imagePath': AppImage.whatsapp},
      {'imagePath': AppImage.instagram},
      {'imagePath': AppImage.telegram},
      {'imagePath': AppImage.facebookAccount},
      {'imagePath': AppImage.email},
      {'imagePath': AppImage.twitter},
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem: Mycolor.white,  // تغيير الخلفية بناءً على الثيم
        title: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.widthPercentage(34),
            right: SizeConfig.widthPercentage(13),
          ),
          child: Text(
            'حول التطبيق',
            style: GoogleFonts.cairo(
              color: textColor,  // تغيير لون النص بناءً على الثيم
              fontSize: SizeConfig.widthPercentage(5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.widthPercentage(2)),
            child: IconBackButton(),
          ),
        ],
      ),
      backgroundColor: backgroundColor, // تغيير الخلفية بناءً على الثيم
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.heightPercentage(10)),
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.widthPercentage(4)),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Get.dialog(
                    ContactDialogWidget(
                      title: dialogTitle,
                      buttonText: buttonText,
                      imagesWithColors: [
                        {'imagePath': AppImage.whatsapp},
                        {'imagePath': AppImage.instagram},
                        {'imagePath': AppImage.facebookAccount},
                        {'imagePath': AppImage.twitter},
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.dialog(
                          ContactDialogWidget(
                            title: dialogTitle,
                            buttonText: buttonText,
                            imagesWithColors: [
                              {'imagePath': AppImage.whatsapp},
                              {'imagePath': AppImage.instagram},
                              {'imagePath': AppImage.facebookAccount},
                              {'imagePath': AppImage.twitter},
                            ],
                          ),
                        ),
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          size: SizeConfig.widthPercentage(5),
                          color: textColor,  // تغيير اللون بناءً على الثيم
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "تواصل معنا",
                        style: FontStyles.authInAnotherWay.copyWith(
                          color: textColor, // تغيير اللون بناءً على الثيم
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightPercentage(3)),
            const Divider(),
            SizedBox(height: SizeConfig.heightPercentage(3)),
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.widthPercentage(4)),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          size: SizeConfig.widthPercentage(5),
                          color: textColor,  // تغيير اللون بناءً على الثيم
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "قيّم التطبيق",
                        style: FontStyles.authInAnotherWay.copyWith(
                          color: textColor, // تغيير اللون بناءً على الثيم
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightPercentage(3)),
            const Divider(),
            SizedBox(height: SizeConfig.heightPercentage(3)),
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.widthPercentage(4)),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () => Get.dialog(
                    ContactDialogWidget(
                      title: shareDialogTitle,
                      buttonText: 'نسخ رابط النشر',
                      imagesWithColors: socialIconsWithColors,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.dialog(
                          ContactDialogWidget(
                            title: shareDialogTitle,
                            buttonText: 'نسخ رابط النشر',
                            imagesWithColors: socialIconsWithColors,
                          ),
                        ),
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          size: SizeConfig.widthPercentage(5),
                          color: textColor,  // تغيير اللون بناءً على الثيم
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "شارك التطبيق",
                        style: FontStyles.authInAnotherWay.copyWith(
                          color: textColor, // تغيير اللون بناءً على الثيم
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightPercentage(3)),
            const Divider(),
            SizedBox(height: SizeConfig.heightPercentage(3)),
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.widthPercentage(4)),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          size: SizeConfig.widthPercentage(5),
                          color: textColor,  // تغيير اللون بناءً على الثيم
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "الإبلاغ عن مشكلة",
                        style: FontStyles.authInAnotherWay.copyWith(
                          color: textColor, // تغيير اللون بناءً على الثيم
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightPercentage(3)),
            const Divider(),
            SizedBox(height: SizeConfig.heightPercentage(3)),
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.widthPercentage(4)),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          size: SizeConfig.widthPercentage(5),
                          color: textColor,  // تغيير اللون بناءً على الثيم
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "سياسة الخصوصية",
                        style: FontStyles.authInAnotherWay.copyWith(
                          color: textColor, // تغيير اللون بناءً على الثيم
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightPercentage(3)),
            const Divider(),
            SizedBox(height: SizeConfig.heightPercentage(3)),
            Padding(
              padding: EdgeInsets.only(right: SizeConfig.widthPercentage(4)),
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          size: SizeConfig.widthPercentage(5),
                          color: textColor,  // تغيير اللون بناءً على الثيم
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "شروط الاستخدام",
                        style: FontStyles.authInAnotherWay.copyWith(
                          color: textColor, // تغيير اللون بناءً على الثيم
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightPercentage(10)),
          ],
        ),
      ),
    );
  }
}
