import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/helpful_widgets/custom_searchbar.dart';
import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_image.dart';
import '../../../core/const_data/text_style.dart';
import '../../../media_query_service.dart';
import '../../../theme/controller.dart';
import '../../../widgets/general/Custom_bottom_navbar.dart';
import '../../../widgets/helpful_widgets/custom_news.dart';
import '../../search_page/view/search_screen.dart';
import '../home_controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // تهيئة SizeConfig

    final ThemeController themeController = Get.find();

    return Scaffold(
      backgroundColor:
          themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white,
      bottomNavigationBar: BottomNavBar(
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
        isSelectedHome: true,
        isSelectedpoll: false,
        isSelectedBookmarks: false,
        isSelectedProfile: false,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:
            themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white,
        toolbarHeight: 100,
        title: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.heightPercentage(3)), // استخدام SizeConfig هنا
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              'نيوز',
              style: themeController.isDarkMode.value
                  ? FontStyles.hometitle.copyWith(color: Colors.white)
                  : FontStyles.hometitle.copyWith(color: Colors.black),
            ),
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(top: SizeConfig.heightPercentage(3.5)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed("/setting");
                },
                icon: Image.asset(
                  AppImage.menu,
                  width:
                      SizeConfig.widthPercentage(5), // استخدام SizeConfig هنا
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed("/notifications_screen");
                },
                icon: Image.asset(
                  AppImage.notifications,
                  width: SizeConfig.widthPercentage(5),
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: SizeConfig.widthPercentage(25),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      SizeConfig.widthPercentage(1)), // استخدام SizeConfig هنا
              child: Column(
                children: [
                  CustomSearchBar(
                    netxPage: SearchScreen(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // إضافة فعل عند الضغط إذا لزم الأمر
                        },
                        child: Text(
                          'مشاهدة الكل',
                          style: themeController.isDarkMode.value
                              ? FontStyles.newsCategorytext.copyWith(
                                  color: Colors
                                      .white) // اللون الأبيض في الوضع الداكن
                              : FontStyles.newsCategorytext,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // إضافة فعل عند الضغط إذا لزم الأمر
                        },
                        child: Text(
                          'اخر الأخبار',
                          style: themeController.isDarkMode.value
                              ? FontStyles.latestnewsText.copyWith(
                                  color: Colors
                                      .white) // اللون الأبيض في الوضع الداكن
                              : FontStyles.latestnewsText,
                        ),
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              categoryButton('ترفيه'),
                              categoryButton('سياحة'),
                              categoryButton('اقتصاد'),
                              categoryButton('سياسة'),
                              categoryButton('رياضة'),
                              categoryButton('الكل'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightPercentage(
                        2), // استخدام SizeConfig هنا
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : Colors.blue,
                        ),
                      );
                    }
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.filteredNews.length,
                      itemBuilder: (context, index) {
                        final news = controller.filteredNews[index];
                        return CustomNews(
                          id: news.id, // تمرير المعرف
                          country: news.country,
                          newstitle: news.description,
                          newstime: 'منذ ساعة',
                          newsimage: news.photo,
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget categoryButton(String category) {
    final ThemeController themeController = Get.find();
    return GetX<HomeController>(
      builder: (controller) {
        bool isSelected = controller.selectedCategory.value == category;
        return TextButton(
          onPressed: () {
            controller.changeCategory(category);
          },
          child: Text(
            category,
            style: themeController.isDarkMode.value
                ? FontStyles.newsCategorytext.copyWith(
                    color: isSelected
                        ? Colors.white
                        : Colors.white, // أسود دائمًا في الوضع الداكن
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  )
                : FontStyles.newsCategorytext.copyWith(
                    color: isSelected
                        ? Colors.black
                        : Colors.black, // أبيض دائمًا في الوضع الفاتح
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
          ),
        );
      },
    );
  }
}
