import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_image.dart';
import '../../../core/const_data/text_style.dart';
import '../../../media_query_service.dart';
import '../../../theme/controller.dart';
import '../../../widgets/general/Custom_bottom_navbar.dart';
import '../../../widgets/helpful_widgets/custom_searchbar.dart';
import '../../../widgets/helpful_widgets/filter_chip.dart';
import '../../../widgets/helpful_widgets/search_result_card.dart';
import '/view/search_page/controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  final SearchPageController controller = Get.put(SearchPageController());

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // الحصول على الـ ThemeController للتحقق من الوضع الحالي (داكن أو فاتح)
    final ThemeController themeController = Get.find();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Colors.white, // تغيير الخلفية بناءً على الثيم
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: themeController.isDarkMode.value ? Mycolor.darkThem : Colors.white, // تغيير خلفية الـ AppBar
          title: Text(
            "بحث",
            style: themeController.isDarkMode.value
                ? FontStyles.searchTitle.copyWith(color: Colors.white) // تغيير اللون في الوضع الداكن
                : FontStyles.searchTitle.copyWith(color: Colors.black), // تغيير اللون في الوضع الفاتح
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new,
                color: themeController.isDarkMode.value ? Colors.white : Colors.black), // تغيير لون الأيقونة بناءً على الثيم
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Stack(
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.widthPercentage(4)), // Dynamic padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    const Directionality(
                        textDirection: TextDirection.ltr,
                        child: const CustomSearchBar()),
                    SizedBox(height: SizeConfig.heightPercentage(2)), // Dynamic spacing
                    // Filters Section
                    Center(
                      child: SizedBox(
                        width: SizeConfig.widthPercentage(60), // Dynamic width
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            filterChip("البلد", controller),
                            filterChip("المواضيع", controller),
                            filterChip("المصدر", controller),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.heightPercentage(2)), // Dynamic spacing
                    // Results Section
                    Expanded(
                      child: ListView(
                        children: [
                          searchResultCard(
                            image: AppImage.bookmark1,
                            title: "فلسطين",
                            subtitle: "61 مصاباً في مواجهات مع الاحتلال في بيت لحم",
                            time: "منذ ٢ ساعة",
                            channel: "بي بي سي ",
                          ),
                          searchResultCard(
                            image: AppImage.bookmark2,
                            title: "مصر",
                            subtitle:
                            "خطة ربط وتكامل بين منظومتي الشكاوي بوزارة التضامن الاجتماعي و مجلس الوزراء",
                            time: "منذ ٢ ساعة",
                            channel: "بي بي سي ",
                          ),
                          searchResultCard(
                            image: AppImage.bookmark3,
                            title: "عالمي",
                            subtitle: "تخفيض سعر المازوت الحر الصناعي الى 11780 ل س",
                            time: "منذ ٢ ساعة",
                            channel: "بي بي سي ",
                          ),
                          searchResultCard(
                            image: AppImage.bookmark4,
                            title: "سوريا",
                            subtitle:
                            "العلاقة بين قلة النوم وفرص الإصابة بأمراض خطيرة",
                            time: "منذ ٢ ساعة",
                            channel: "بي بي سي ",
                          ),
                          searchResultCard(
                            image: AppImage.bookmark5,
                            title: "إسبانيا",
                            subtitle:
                            "ريال مدريد يحسم كلاسيكو إسبانيا بفوزه على غريمة برشلونة",
                            time: "منذ ٢ ساعة",
                            channel: "بي بي سي ",
                          ),
                        ],
                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}
