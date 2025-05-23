import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_image.dart';
import '../../../core/const_data/text_style.dart';
import '../../../media_query_service.dart';
import '../../../theme/controller.dart';
import '../../../widgets/general/Custom_bottom_navbar.dart';
import '../../../widgets/helpful_widgets/custom_searchbar.dart';
import '../../../widgets/helpful_widgets/search_result_card.dart';

class BookmarksScreen extends StatelessWidget {
  BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig().init(context);

    // Get the ThemeController instance to handle dark mode or light mode
    final ThemeController themeController = Get.find();

    return Scaffold(
      backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white,
      bottomNavigationBar: BottomNavBar(
        onPressedHome: () {
          Get.toNamed("/home_page"); // الانتقال إلى HomePage
        },
        onPressedStats: () {
          Get.toNamed("/book_marks_screen"); // الانتقال إلى BookmarksScreen
        },
        onPressedBookmark: () {
          Get.toNamed("/surveys_screen"); // الانتقال إلى SurveysScreen
        },
        onPressedProfile: () {
          Get.toNamed("/profile"); // الانتقال إلى ProfilePage
        },
        isSelectedHome: false,
        isSelectedpoll: true,
        isSelectedBookmarks: false,
        isSelectedProfile: false,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white,
        title: Padding(
          padding: EdgeInsets.only(top: SizeConfig.heightPercentage(1)),
          child: Center(
            child: Text(
              'محفوظاتي',
              style: themeController.isDarkMode.value
                  ? FontStyles.searchTitle.copyWith(color: Colors.white)
                  : FontStyles.searchTitle.copyWith(color: Mycolor.black),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthPercentage(3)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.heightPercentage(2)),
              CustomSearchBar(),
              SizedBox(height: SizeConfig.heightPercentage(2)),
              searchResultCard(
                image: AppImage.bookmark1,
                title: 'فلسطين',
                subtitle: '61 مصاباً في مواجهات مع الاحتلال في بيت لحم',
                time: 'منذ 2 ساعة',
                channel: 'بي بي سي',
              ),
              SizedBox(height: SizeConfig.heightPercentage(2)),
              searchResultCard(
                image: AppImage.bookmark2,
                title: 'مصر',
                subtitle:
                'خطة ربط وتكامل بين منظومتي الشكاوى بوزارة التضامن الإجتماعي ومجلس الوزراء',
                time: 'منذ 2 ساعة',
                channel: 'بي بي سي',
              ),
              SizedBox(height: SizeConfig.heightPercentage(2)),
              searchResultCard(
                image: AppImage.bookmark3,
                title: 'عالمي',
                subtitle: ' العلاقة بين قلة النوم وفرص الإصابة بأمراض خطيرة',
                time: 'منذ 2 ساعة',
                channel: 'بي بي سي',
                onpressed: () {
                  Get.toNamed('/book_marks_screen');
                },
              ),
              SizedBox(height: SizeConfig.heightPercentage(2)),
              searchResultCard(
                image: AppImage.bookmark4,
                title: 'سوريا',
                subtitle: ' تخفيض سعر المازوت الحر الصناعي الى 11780 ل.س',
                time: 'منذ 2 ساعة',
                channel: 'بي بي سي',
              ),
              SizedBox(height: SizeConfig.heightPercentage(2)),
              searchResultCard(
                image: AppImage.bookmark5,
                title: 'إسبانيا',
                subtitle:
                'ريال مدريد يحسم كلاسيكو إسبانيابفوزه على غريمه برشلونة',
                time: 'منذ 2 ساعة',
                channel: 'بي بي سي',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
