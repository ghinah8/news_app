import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../media_query_service.dart';
import 'app_colors.dart';

class FontStyles {
  // title for Edit profile Screen & Change Password Screen & Delete Account & SettingNotifications Screen &Setting2 Screen & About App Screen
  static final editprofileTitle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 4.2,
  );
  static final notificationContent = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.widthPercentage(3.75),

  );
  static final notificationTime = GoogleFonts.cairo(
    color: Mycolor.gray,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.widthPercentage(3),
  );
  static final seteng = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w600, // الوزن 400 كما في الإعدادات
    fontSize: 16, // حجم الخط 18px
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  static final ble = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w500, // الوزن 400 كما في الإعدادات
    fontSize: 16, // حجم الخط 18px
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  static final setee = GoogleFonts.inter(
    color: Mycolor.black,
    fontWeight: FontWeight.w700, // الوزن 400 كما في الإعدادات
    fontSize: 18, // حجم الخط 18px
    height: 33.73 / 18, // ارتفاع السطر مع مراعاة الحجم
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  static final selectedText = GoogleFonts.cairo(
    color: Mycolor.gray1,
    fontWeight: FontWeight.w600, // الوزن 400 كما في الإعدادات
    fontSize: 17, // حجم الخط 18px
    height: 33.73 / 18, // ارتفاع السطر مع مراعاة الحجم
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  static final sele = GoogleFonts.cairo(
    color: Mycolor.gray1,
    fontWeight: FontWeight.w600, // الوزن 400 كما في الإعدادات
    fontSize: 18, // حجم الخط 18px
    height: 33.73 / 18, // ارتفاع السطر مع مراعاة الحجم
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  static final customTextStyle = GoogleFonts.cairo(
    color: Mycolor.white,
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 44.98 / 24,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  static final newshour = GoogleFonts.cairo(
    color: Mycolor.black.withOpacity(0.7),
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 4,
  );


  static final newschannel = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4,
  );
  static final newsfollowchannel = GoogleFonts.cairo(
    color: Mycolor.white,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4,
  );
  static final newscontantinome = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 3.5,
  );
  static final newstitlenome = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 3.8,
  );
  static final newssourcenome = GoogleFonts.cairo(
    color: Mycolor.countrynews,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 4,
  );

  static final favouritecomment = GoogleFonts.cairo(
    color: Mycolor.countrynews,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 4,
  );


  //title for search, bookmarks and poll screens
  static final searchTitle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 6,
  );
  static final set = GoogleFonts.inter(
    color: Mycolor.black,
    fontWeight: FontWeight.w400, // الوزن 400 كما في الإعدادات
    fontSize: 20, // حجم الخط 18px
    height: 33.73 / 18, // ارتفاع السطر مع مراعاة الحجم
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  static final no = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400, // الوزن 400 كما في الإعدادات
    fontSize: 18, // حجم الخط 18px
    height: 33.73 / 18, // ارتفاع السطر مع مراعاة الحجم
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  static final delete = GoogleFonts.cairo(
    color: Mycolor.white,
    fontWeight: FontWeight.w600, // الوزن 400 كما في الإعدادات
    fontSize: 18, // حجم الخط 18px
    height: 33.73 / 18, // ارتفاع السطر مع مراعاة الحجم
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  static final yes = GoogleFonts.cairo(
    color: Mycolor.white,
    fontWeight: FontWeight.w400, // الوزن 400 كما في الإعدادات
    fontSize: 14, // حجم الخط 18px
    height: 50.73 / 20, // ارتفاع السطر مع مراعاة الحجم
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  static final back = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400, // الوزن 400 كما في الإعدادات
    fontSize: 14, // حجم الخط 18px
    height: 50.73 / 20, // ارتفاع السطر مع مراعاة الحجم
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  //title for source ,interests and country screens
  static final screensTitle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 5,
  );

  //"بحث"
  static final searchbarText = GoogleFonts.cairo(
    color: Mycolor.black.withOpacity(0.5), // الشفافية 50%
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4.5,
  );


  //زر التالي
  static final nextButton = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 6,
  );

  //welcome Screen
  //"نيوز"
  static final welcometext = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w800,
    fontSize: SizeConfig.blockWidth * 12,
  );

  //"تطبيق اخباري مجاني ......."
  static final subtitle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 4.5,
  );

  //Log in Screen and sign in Screen
  //"نيوز"
  static final authTitle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 12,
  );

  //بريد الكتروني ,كلمة السر ,الاسم
  static final hintTextAuthTextfield = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
  );

  //زر انشاء حساب و زر تسجيل الخول
  static final authButtonText = GoogleFonts.cairo(
    color: Mycolor.white,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4.5,
  );

  //هل نسيت كلمة المرور
  static final forgetpasswordText = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.5,
  );

  //(انشاء الحساب بواسطة و تسجيل الدخول بواسطة و ليس لديك حساب)
  static final authInAnotherWay = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4.5,
  );

  //انشاء حساب
  static final createAccountText = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.5,
  );

  //Notifications Screen
  //"الاشعارات "
  static final notificationsTitle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 6,
  );

  //"اليوم , 11 كانون الاول"
  static final notificationDate = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 4,
  );

  //نص الاشعار
  static final notificationContant = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.5,
  );
  static final selectedTextStyle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w600, // الوزن 400 كما في الإعدادات
    fontSize: 18, // حجم الخط 18px
    height: 33.73 / 18, // ارتفاع السطر مع مراعاة الحجم
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  //"منذ 15 دقيقة"
  static final notificationsTime = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3,
  );
  static final specificTextStyle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 1.75,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  //Home Screen
  //"نيوز"
  static final hometitle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 8,
  );
  //"اخر الاخبار     الكل"
  static final latestnewsText = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 3.5,
  );
  //"مشاهدة الكل  رياضة سياسة اقتصاد ...."
  static final newsCategorytext = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.5,
  );
  //"فلسطين"
  static final newsSource = GoogleFonts.cairo(
    color: Mycolor.countrynews,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 4,
  );
  //"بوتين .........."
  static final newstitle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.7,
  );
  //"روسيا اليوم ,منذ 2 ساعة"
  static final newsTimeandSource = GoogleFonts.cairo(
    color: Mycolor.black1.withOpacity(0.7),
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.5,
  );
//Source Screen
  //"قم باختيار مصدر الخبر"
  static final sourceName = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4,
  );

  //Interests Screen
  //"قم باختيار اهتماماتك"
  static final categoryButtonText = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4.5,
  );

  //Country Screen
  //اسم البلد
  static final interestsTitle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4.5,
  );

  //Setting Screen
  //"   ريم العلي الاعدادات التنبيهات......."
  static final settingText = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4.3,
  );
  //"تعديل الملف الشخصي "
  static final editprofile = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 3.5,
  );

  //Search Screen
  //"بحث"
  static final searchcategory = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 6,
  );
  //"فلسطين "
  static final newscountry = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4,
  );
  //"61 مصابا....."
  static final newscontant = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.5,
  );
  //"بي بي سي منذ 2 ساعة"
  static final newstime = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3,
  );

  //Poll Screen
  //" نص الاستبيان + "معرفة التفاصيل الاضافية
  static final pollText = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4,
  );
  //اختيارات الاستبيان
  static final pollchoices = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.5,
  );
  //زر مشاهدة نتائج التصويت
  static final pollresultButton = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 3.5,
  );
  //"هنا"
  static final hereText = TextStyle(
      color: Mycolor.black,
      fontWeight: FontWeight.w800,
      fontSize: SizeConfig.blockWidth * 4,
      fontFamily: "Cairo");

  //Profile Screen
  //ريم العلي
  static final profileTitle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4.5,
  );
  //"تعديل صورة الملف الشخصي"
  static final chandeprofilephoto = GoogleFonts.cairo(
    color: Mycolor.black1,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 3.5,
  );
  //"تعديل المعلومات الشخصية  .....الخ"
  static final profilesetting = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4,
  );static final profilesetting1 = GoogleFonts.cairo(
    color: Mycolor.gray,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 4,
  );

  //Edit profile Screen & Change Password Screen & Delete Account Screen
  //"الاسم, البريد الالكتروني, كلمة المرور"
  static final formTitle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 4,
  );
  //"حفظ التعديلات"
  static final saveButton = GoogleFonts.cairo(
    color: Mycolor.white,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockWidth * 4.5,
  );

  //"تأكيد"
  static final confirmButton = GoogleFonts.cairo(
    color: Mycolor.white,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 3.5,
  );
  //"الغاء"
  static final cancelButton = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.blockWidth * 3.5,
  );

  //About App Screen
  //"حول التطبيق"
  static final aboutAppTitle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 5,
  );
  //"هذا التطبيق هو مصدر للأخبار الموثوقة"
  static final aboutAppContent = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w400,
    fontSize: SizeConfig.blockWidth * 3.5,
  );

  //Bookmarks Screen
  //"الاخبار المحفوظة"
  static final bookmarksTitle = GoogleFonts.cairo(
    color: Mycolor.black,
    fontWeight: FontWeight.w700,
    fontSize: SizeConfig.blockWidth * 6,
  );
}
