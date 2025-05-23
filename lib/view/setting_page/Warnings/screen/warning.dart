import 'package:flutter/material.dart';
import 'package:get/get.dart'; // استيراد GetX
import '../../../../core/const_data/app_colors.dart';
import '../../../../core/const_data/text_style.dart';
import '../../../../media_query_service.dart';
import '../../../../theme/controller.dart';
import '../../../../widgets/general/bottom_back.dart';
import '../../../../widgets/general/icon_button.dart';
import '../../../../widgets/helpful_widgets/widget_setting.dart';
import '../../../../widgets/helpful_widgets/widget_warning.dart';
import '../../seitting/screen/setting.dart';
import '../controller/warning_controller.dart'; // استيراد الـ Controller

class Warning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // تهيئة SizeConfig لتوفير القيم النسبية
    SizeConfig().init(context);

    // الحصول على الـ ThemeController
    final ThemeController themeController = Get.find();

    return Scaffold(
      backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white, // تغيير اللون الخلفي بناءً على الوضع

      appBar: AppBar(
        backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white, // تغيير اللون بناءً على الوضع
        automaticallyImplyLeading: false, // إزالة السهم الافتراضي
      ),
      body: Column(
        children: [
          // نقل العنوان وزر الرجوع هنا في الـ body
          Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.heightPercentage(0),
              left: SizeConfig.widthPercentage(43),
              right: SizeConfig.widthPercentage(0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // رفع النص باستخدام Transform.translate
                Transform.translate(
                  offset: Offset(
                      0, SizeConfig.heightPercentage(-0.8)), // رفع النص قليلاً
                  child: Text(
                    'التنبيهات',
                    style: themeController.isDarkMode.value ? FontStyles.setee.copyWith(color: Mycolor.white) : FontStyles.setee, // استخدام النص وفقًا للثيم
                  ),
                ),
                // رفع الزر (IconBackButton) بنفس الطريقة
                Transform.translate(
                  offset: Offset(
                      0,
                      SizeConfig.heightPercentage(
                          -0.6)), // رفع الزر بنسبة 0.6% من ارتفاع الشاشة
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: SizeConfig.widthPercentage(
                            2.0)), // استخدم النسبة المئوية لتحديد البادينغ
                    child: const IconBackButton(), // زر الرجوع على اليمين
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.heightPercentage(2)),

          // إضافة Expanded هنا ليعمل الـ ListView بشكل صحيح
          Expanded(
            child: ListView(
              children: [
                GetBuilder<SwitchController>(
                  init: SwitchController(),
                  builder: (controller) {
                    return CustomSwitchTile(
                      title: 'تنبيهات الأخبار العاجلة',
                      initialValue: controller.newsAlert,
                      onChanged: (value) {
                        controller.updateNewsAlert(value);
                      },
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: SizeConfig.widthPercentage(4.0),  // استخدم النسبة المئوية لتحديد البادينغ على اليمين
                    top: SizeConfig.heightPercentage(1.0),   // استخدم النسبة المئوية لتحديد البادينغ من الأعلى
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'اختر مصدر التنبيهات العاجلة',
                        style: FontStyles.sele.copyWith(
                          color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.gray, // استخدام اللون المناسب وفقًا للثيم
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Divider(
                        color: themeController.isDarkMode.value ? Mycolor.gray : Mycolor.lightgray, // استخدام اللون بناءً على الوضع
                        indent: 190.0,
                        endIndent: 0.0,
                        height: 0,
                      ),
                      SizedBox(
                        height: SizeConfig.heightPercentage(4),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.6,
                  color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.lightgray, // استخدام اللون بناءً على الوضع
                  endIndent: 0,
                  indent: 0,
                ),
                SizedBox(
                  height: SizeConfig.heightPercentage(1),
                ),
                GetBuilder<SwitchController>(
                  init: SwitchController(),
                  builder: (controller) {
                    return CustomSwitchTile(
                      title: 'تنبيهات أهم الأخبار',
                      initialValue: controller.newsAlert,
                      onChanged: (value) {
                        controller.updateNewsAlert(value);
                      },
                    );
                  },
                ),
                SizedBox(
                  height: SizeConfig.heightPercentage(1),
                ),
                Divider(
                  thickness: 1.7,
                  color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.lightgray, // استخدام اللون بناءً على الوضع
                  indent: 0,
                  endIndent: 0,
                ),
                SizedBox(
                  height: SizeConfig.heightPercentage(1),
                ),
                GetBuilder<SwitchController>(
                  init: SwitchController(),
                  builder: (controller) {
                    return CustomSwitchTile(
                      title: 'تنبيهات نتائج المباريات الرياضية',
                      initialValue: controller.sportsAlert,
                      onChanged: (value) {
                        controller.updateSportsAlert(value);
                      },
                    );
                  },
                ),
                SizedBox(
                  height: SizeConfig.heightPercentage(1),
                ),
                Divider(
                  thickness: 1.7,
                  color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.lightgray, // استخدام اللون بناءً على الوضع
                  indent: 0,
                  endIndent: 0,
                ),
                SizedBox(
                  height: SizeConfig.heightPercentage(1),
                ),
                GetBuilder<SwitchController>(
                  init: SwitchController(),
                  builder: (controller) {
                    return CustomSwitchTile(
                      title: 'التذكير بالإجابة على الاقتراع اليومي',
                      initialValue: controller.pollReminder,
                      onChanged: (value) {
                        controller.updatePollReminder(value);
                      },
                    );
                  },
                ),
                SizedBox(
                  height: SizeConfig.heightPercentage(1),
                ),
                Divider(
                  thickness: 1.7,
                  color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.lightgray, // استخدام اللون بناءً على الوضع
                  indent: 0,
                  endIndent: 0,
                ),
                SizedBox(
                  height: SizeConfig.heightPercentage(4),
                ),
                Transform.translate(
                  offset: Offset(
                    SizeConfig.widthPercentage(-3.0),  // استخدم النسبة المئوية لتحديد الإزاحة الأفقية
                    0,  // الإزاحة الرأسية تظل كما هي (0)
                  ),
                  child: Text(
                    'أصوات التنبيهات',
                    style: FontStyles.ble.copyWith(
                      color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.black, // تخصيص اللون بناءً على الوضع
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: SizeConfig.heightPercentage(0.5)),
                GetBuilder<SwitchController>(
                  init: SwitchController(),
                  builder: (controller) {
                    return CustomSwitchTile(
                      title: 'تفعيل الاهتزاز',
                      initialValue: controller.vibration,
                      onChanged: (value) {
                        controller.updateVibration(value);
                      },
                    );
                  },
                ),
                SizedBox(height: SizeConfig.heightPercentage(0.5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBackButtonn(
                      nextPage: Setting(),
                      color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.black, // تخصيص اللون بناءً على الثيم
                    ),
                    Transform.translate(
                      offset: Offset(
                        SizeConfig.widthPercentage(-3.0),  // استخدم النسبة المئوية لتحديد الإزاحة الأفقية
                        0,  // الإزاحة الرأسية تبقى ثابتة كما هي
                      ),
                      child: Text(
                        'اختر نغمة التنبيه',
                        style: FontStyles.ble.copyWith(
                          color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.black, // تخصيص اللون بناءً على الثيم
                        ),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.heightPercentage(4)),
                Transform.translate(
                  offset: Offset(
                    SizeConfig.widthPercentage(-3.0),  // استخدم النسبة المئوية لتحديد الإزاحة الأفقية بناءً على عرض الشاشة
                    0,  // الإزاحة الرأسية تظل كما هي
                  ),
                  child: Text(
                    ':اختر طريقة عرض التنبيهات على شاشة القفل',
                    style: FontStyles.ble.copyWith(
                      color: themeController.isDarkMode.value ? Mycolor.white : Mycolor.black, // تخصيص اللون بناءً على الثيم
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: SizeConfig.heightPercentage(1.4)),
                Padding(
                  padding: EdgeInsets.only(
                    right: SizeConfig.widthPercentage(2.0),  // استخدم النسبة المئوية لتحديد البادينغ بناءً على عرض الشاشة
                  ),
                  child: RadioButtonsWithText(
                    labels: [
                      'عرض جميع الإشعارات ومحتواها',
                      'عرض جميع الإشعارات ولكن إخفاء محتواها',
                      'عدم عرض الإشعارات على الإطلاق'
                    ],
                    selectedIndex: 0,
                    onChanged: (index) {
                      print('تم اختيار الدائرة: $index');
                    },
                  ),
                ),
                SizedBox(height: SizeConfig.heightPercentage(6)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
