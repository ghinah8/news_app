import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_image.dart';
import '../../../core/const_data/text_style.dart';
import '../../../media_query_service.dart';
import '../../../theme/controller.dart';
import '../../../widgets/general/bottom_back.dart';
import '../../../widgets/helpful_widgets/custom_searchbar.dart';
import '../controller/country_controller.dart';

class CountryPage extends StatefulWidget {
  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final CountryController controller = Get.put(CountryController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig init = SizeConfig();
    init.init(context);

    return Obx(() {
      final backgroundColor = themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white;
      final textColor = themeController.isDarkMode.value ? Mycolor.white : Mycolor.black;
      final buttonColor = themeController.isDarkMode.value ? Mycolor.white : Mycolor.black;

      return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              // إضافة صورة الخلفية مع الشفافية
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: 0.6,
                    child: Image.asset(
                      AppImage.mapBackground, // تأكد من أنك قد حددت المسار الصحيح للصورة
                      fit: BoxFit.contain,
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  _buildAppBar(textColor, backgroundColor),
                  const CustomSearchBar(),
                  SizedBox(height: SizeConfig.heightPercentage(2)),
                  _buildMainContent(textColor, buttonColor, backgroundColor),
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.widthPercentage(3)),
                    child: SizedBox(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.heightPercentage(6.3),
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            if (controller.selectedCountryIndex.value != -1) {
                              final selectedCountryId = controller
                                  .countries[controller.selectedCountryIndex.value]['id'];
                              if (await controller.submitSelectedCountry(selectedCountryId)) {
                                Get.offNamed('/interests_page');
                              }
                            } else {
                              Get.snackbar("تنبيه", "يرجى اختيار الدولة قبل المتابعة");
                            }
                          } catch (e) {
                            print(e);
                            Get.snackbar("تنبيه", "حدث خطأ ما");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Obx(() {
                          return controller.isLoading.value
                              ? CircularProgressIndicator(color: themeController.isDarkMode.value ? Mycolor.black : Mycolor.white)
                              : Text(
                            "التالي",
                            style: FontStyles.customTextStyle.copyWith(color: themeController.isDarkMode.value ? Mycolor.black : Mycolor.white),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildAppBar(Color textColor, Color backgroundColor) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthPercentage(2),
        vertical: SizeConfig.heightPercentage(2),
      ),
      child: Container(
        height: SizeConfig.heightPercentage(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 0),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconBackButton(),
            ),
            Center(
              child: Text(
                'قم باختيار البلد',
                style: FontStyles.specificTextStyle.copyWith(color: textColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(Color textColor, Color buttonColor, Color backgroundColor) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (controller.countries.isEmpty) {
        return Center(child: Text("لا توجد بيانات", style: TextStyle(color: textColor)));
      }

      return Expanded(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            itemCount: controller.countries.length,
            itemBuilder: (context, index) {
              final country = controller.countries[index];
              bool isSelected = controller.selectedCountryIndex.value == index;

              return ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Mycolor.lightgray
                        : (themeController.isDarkMode.value ? Mycolor.darkgray : Mycolor.white), // خلفية الصورة بناءً على الثيم
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(SizeConfig.widthPercentage(2)),
                  child: Image.network(
                    country['flag'],
                    width: SizeConfig.widthPercentage(10),
                    height: SizeConfig.widthPercentage(10),
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.error, color: textColor),
                  ),
                ),
                title: Text(
                  country['name'],
                  style: FontStyles.selectedTextStyle.copyWith(color: textColor),
                ),
                tileColor: isSelected ? Mycolor.gray1 : backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onTap: () {
                  setState(() {
                    controller.selectCountry(index);
                  });
                },
              );
            },
          ),
        ),
      );
    });
  }
}
