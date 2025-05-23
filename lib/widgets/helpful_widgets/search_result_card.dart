import 'package:flutter/material.dart';
import 'package:get/get.dart';

import "../../core/const_data/app_colors.dart";
import "../../core/const_data/text_style.dart";
import "../../media_query_service.dart";
import "../../theme/controller.dart";

Widget searchResultCard({
  required String image,
  required String title,
  required String subtitle,
  required String time,
  required String channel,
  Function()? onpressed,
}) {
  final ThemeController themeController = Get.find();

  // تحديد اللون الأساسي للنصوص بناءً على الثيم
  Color textColor = themeController.isDarkMode.value ? Colors.white : Mycolor.darkThem;

  return Directionality(
    textDirection: TextDirection.rtl,
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthPercentage(1),
      ),
      child: Row(
        children: [
          Container(
            width: SizeConfig.widthPercentage(25),
            height: SizeConfig.heightPercentage(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Mycolor.white,
            ),
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: onpressed,
              icon: Image.asset(image),
            ),
          ),
          SizedBox(width: SizeConfig.widthPercentage(1.5)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title with theme-based text color
                Text(
                  title,
                  style: FontStyles.newscountry.copyWith(color: textColor),
                ),
                SizedBox(height: SizeConfig.heightPercentage(0.5)),
                // Subtitle with theme-based text color
                Text(
                  subtitle,
                  style: FontStyles.notificationContant.copyWith(color: textColor),
                ),
                SizedBox(height: SizeConfig.heightPercentage(0.5)),
                // Channel and time with theme-based text color
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      channel,
                      style: FontStyles.newstime.copyWith(color: textColor),
                    ),
                    const Text(" , ", style: TextStyle(color: Mycolor.countrynews)),
                    Text(
                      time,
                      style: FontStyles.newstime.copyWith(color: textColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
