import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:neww_app/core/const_data/app_colors.dart';
import 'package:neww_app/media_query_service.dart';
import 'package:neww_app/widgets/general/Custom_bottom_navbar.dart';

import '../../../core/const_data/app_image.dart';
import '../../../core/const_data/text_style.dart';
import '../../../widgets/helpful_widgets/custom_searchbar.dart';
import '../../../widgets/helpful_widgets/search_result_card.dart';

class BookmarksScreen extends StatelessWidget {
  BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Mycolor.white,
      bottomNavigationBar: BottomNavBar(
        onPressedHome: () {
          Get.toNamed('/home_page');
        },
        onPressedStats: () {
          Get.toNamed('/news_screen');
        },
        isSelectedHome: false,
        isSelectedpoll: false,
        isSelectedBookmarks: true,
        isSelectedProfile: false,
      ),
      appBar: AppBar(
        backgroundColor: Mycolor.white,
        title: Padding(
          padding: EdgeInsets.only(top: SizeConfig.heightPercentage(1)),
          child: Center(
            child: Text('محفوظاتي', style: FontStyles.searchTitle),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthPercentage(3),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.heightPercentage(2),
              ),
              CustomSearchBar(),
              SizedBox(
                height: SizeConfig.heightPercentage(2),
              ),
              searchResultCard(
                image: AppImage.bookmark1,
                title: 'فلسطين',
                subtitle: '61 مصاباً في مواجهات مع الاحتلال في بيت لحم',
                time: 'منذ 2 ساعة',
                channel: 'بي بي سي',
              ),
              SizedBox(
                height: SizeConfig.heightPercentage(2),
              ),
              searchResultCard(
                image: AppImage.bookmark3,
                title: 'مصر',
                subtitle:
                    'خطة ربط وتكامل بين منظومتي الشكاوى بوزارة التضامن الإجتماعي ومجلس الوزراء',
                time: 'منذ 2 ساعة',
                channel: 'بي بي سي',
              ),
              SizedBox(
                height: SizeConfig.heightPercentage(2),
              ),
              searchResultCard(
                image: AppImage.bookmark5,
                title: 'عالمي',
                subtitle: ' العلاقة بين قلة النوم وفرص الإصابة بأمراض خطيرة',
                time: 'منذ 2 ساعة',
                channel: 'بي بي سي',
                onpressed: () {
                  Get.toNamed('/book_marks_screen');
                },
              ),
              SizedBox(
                height: SizeConfig.heightPercentage(2),
              ),
              searchResultCard(
                image: AppImage.bookmark2,
                title: 'سوريا',
                subtitle: ' تخفيض سعر المازوت الحر الصناعي الى 11780 ل.س',
                time: 'منذ 2 ساعة',
                channel: 'بي بي سي',
              ),
              SizedBox(
                height: SizeConfig.heightPercentage(2),
              ),
              searchResultCard(
                image: AppImage.bookmark4,
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
