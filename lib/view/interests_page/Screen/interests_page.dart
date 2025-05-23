import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/const_data/text_style.dart';
import '../../../media_query_service.dart';
import '../../../widgets/general/bottom_back.dart';
import '../../../widgets/helpful_widgets/custom_searchbar.dart';
import '../Controller/interests_controller.dart';
import '../../../theme/controller.dart'; // استدعاء ThemeController
import '../../../core/const_data/app_colors.dart'; // استدعاء ألوان الثيم

class InterestsPage extends StatelessWidget {
  const InterestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InterestsController());
    final themeController = Get.find<ThemeController>(); // الحصول على ThemeController
    SizeConfig().init(context); // استدعاء SizeConfig

    return Obx(() {
      // تحديد الألوان بناءً على الثيم
      final backgroundColor = themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white;
      final textColor = themeController.isDarkMode.value ? Mycolor.white : Mycolor.black;
      final buttonColor = themeController.isDarkMode.value ? Mycolor.primaryColor : Mycolor.gray;
      final borderColor = themeController.isDarkMode.value ? Mycolor.white : Mycolor.black;

      return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              // العنوان العلوي
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  height: 60,
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
                          'قم باختيار اهتمامك',
                          style: FontStyles.specificTextStyle.copyWith(color: textColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // البحث
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    CustomSearchBar(),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                  ],
                ),
              ),

              // شبكة الأزرار
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04),
                  child: GetBuilder<InterestsController>(
                    init: InterestsController(),
                    builder: (controller) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: GridView.builder(
                        itemCount: controller.interests.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: SizeConfig.screenWidth * 0.03,
                          mainAxisSpacing: SizeConfig.screenHeight * 0.03,
                          childAspectRatio: 2,
                        ),
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                            onPressed: () async {
                              final interest = controller.interests[index];

                              // Toggle button state locally
                              controller.toggleButtonState(interest);

                              // Toggle selection locally
                              controller.toggleSelection(interest);

                              // Call the API to add or remove the selected category
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: controller.buttonStates[controller.interests[index]] == true
                                  ? buttonColor
                                  : backgroundColor,
                              side: BorderSide(color: borderColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              controller.interests[index],
                              style: FontStyles.selectedTextStyle.copyWith(
                                color: controller.buttonStates[controller.interests[index]] == true
                                    ? textColor
                                    : borderColor,
                                fontSize: SizeConfig.widthPercentage(4),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              // زر التالي
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              Padding(
                padding: EdgeInsets.all(15),
                child: SizedBox(
                  width: double.infinity,
                  height: 57,
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller.addCategoryToUser([2, 5]);
                      Get.toNamed("/source");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeController.isDarkMode.value
                          ? Mycolor.white // أبيض في الوضع الليلي
                          : Mycolor.black, // أسود في الوضع العادي
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      "التالي",
                      style: FontStyles.customTextStyle.copyWith(
                        color: themeController.isDarkMode.value
                            ? Mycolor.black // نص أسود في الوضع الليلي
                            : Mycolor.white, // نص أبيض في الوضع العادي
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: SizeConfig.screenHeight * 0.06),
            ],
          ),
        ),
      );
    });
  }
}
