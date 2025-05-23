import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/text_style.dart';
import '../../../media_query_service.dart';
import '../../../theme/controller.dart';
import '../../../widgets/helpful_widgets/custom_searchbar.dart';
import '../controller/news_source_controller.dart';

class NewsSourceScreen extends StatelessWidget {
  final NewsSourceController controller = Get.put(NewsSourceController());

  NewsSourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig().init(context);

    final themeController =
        Get.find<ThemeController>(); // الحصول على ThemeController

    return Obx(() {
      // تحديد الألوان بناءً على الثيم
      final backgroundColor =
          themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white;
      final textColor =
          themeController.isDarkMode.value ? Colors.white : Mycolor.black;
      final buttonColor =
          themeController.isDarkMode.value ? Mycolor.black : Mycolor.white;
      final appBarColor =
          themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white;
      // ignore: unused_local_variable
      final buttonTextColor =
          themeController.isDarkMode.value ? Mycolor.white : Colors.black;

      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: appBarColor,
            title: Padding(
              padding: EdgeInsets.only(top: SizeConfig.heightPercentage(3)),
              child: Text(
                'قم باختيار مصدر الأخبار',
                style: FontStyles.notificationsTitle.copyWith(
                  fontSize:
                      SizeConfig.widthPercentage(5), // Responsive font size
                  color: textColor, // استخدام اللون بناءً على الثيم
                ),
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(top: SizeConfig.heightPercentage(3)),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: SizeConfig.widthPercentage(6), // Responsive icon size
                  color: textColor, // استخدام اللون بناءً على الثيم
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthPercentage(
                  5), // Responsive horizontal padding
              vertical:
                  SizeConfig.heightPercentage(3), // Responsive vertical padding
            ),
            child: Column(
              children: [
                const Directionality(
                  textDirection: TextDirection.ltr,
                  child: CustomSearchBar(),
                ),
                SizedBox(height: SizeConfig.heightPercentage(2)), // Add spacing
                Expanded(
                  child: Obx(() {
                    if (controller.newsSources.isEmpty) {
                      return const Center(
                        child: Text("لا توجد أخبار"),
                      );
                    }

                    return GridView.builder(
                      padding: EdgeInsets.all(
                          SizeConfig.widthPercentage(2)), // Responsive padding
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: SizeConfig.heightPercentage(
                            3), // Responsive spacing
                        crossAxisSpacing:
                            SizeConfig.widthPercentage(3), // Responsive spacing
                        childAspectRatio: 0.65,
                      ),
                      itemCount: controller.newsSources.length,
                      itemBuilder: (context, index) {
                        final source = controller.newsSources[index];
                        return Column(
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: SizeConfig.widthPercentage(22),
                                    width: SizeConfig.widthPercentage(22),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.widthPercentage(
                                              2)), // Responsive radius
                                      color: themeController.isDarkMode.value
                                          ? Colors.white
                                          : const Color(0xFFEEF1F4),
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.widthPercentage(16),
                                    width: SizeConfig.widthPercentage(16),
                                    child: CircleAvatar(
                                      radius: SizeConfig.widthPercentage(
                                          8), // Responsive radius
                                      backgroundImage:
                                          NetworkImage(source.logoUrl),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: SizeConfig.heightPercentage(1)),
                            Text(
                              source.name,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cairo(
                                fontSize: SizeConfig.widthPercentage(4),
                                fontWeight: FontWeight.w400,
                                color:
                                    textColor, // استخدام اللون بناءً على الثيم
                              ),
                            ),
                            SizedBox(height: SizeConfig.heightPercentage(1)),
                            ElevatedButton(
                              onPressed: () async {
                                controller.toggleFollow(source);
                                await controller.addUserSources();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: source.isFollowing
                                    ? Mycolor.gray1
                                    : buttonColor,
                                foregroundColor:
                                    textColor, // استخدام اللون بناءً على الثيم
                                minimumSize: Size(
                                  SizeConfig.widthPercentage(
                                      25), // Responsive width
                                  SizeConfig.heightPercentage(
                                      5), // Responsive height
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.widthPercentage(
                                          2)), // Responsive radius
                                  side: BorderSide(
                                      color:
                                          textColor), // استخدام اللون بناءً على الثيم
                                ),
                              ),
                              child: Text(
                                source.isFollowing ? 'متابع' : 'متابعة',
                                style: GoogleFonts.cairo(
                                  fontSize: SizeConfig.widthPercentage(4),
                                  fontWeight: FontWeight.w400,
                                  color:
                                      textColor, // استخدام اللون بناءً على الثيم
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: SizeConfig.heightPercentage(3)),
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller.addUserSources();
                      Get.toNamed("/home_page");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black, // خلفية الزر
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.widthPercentage(2)),
                      ),
                      elevation: 0,
                      minimumSize: Size(
                        SizeConfig.widthPercentage(90),
                        SizeConfig.heightPercentage(7),
                      ),
                    ),
                    child: Text(
                      "التالي",
                      style: GoogleFonts.cairo(
                        color: themeController.isDarkMode.value
                            ? Colors.black
                            : Colors.white, // لون النص
                        fontSize: SizeConfig.widthPercentage(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
