import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/const_data/app_colors.dart';
import '../../core/const_data/text_style.dart';
import '../../media_query_service.dart';
import '../../theme/controller.dart';

class NotificationsCard extends StatelessWidget {
  final String image;
  final String content;
  final String time;

  const NotificationsCard({
    super.key,
    required this.image,
    required this.content,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    // Get the theme controller
    final ThemeController themeController = Get.find();

    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.heightPercentage(2)),
      child: Container(
        height: SizeConfig.heightPercentage(12.6),
        decoration: BoxDecoration(
          color: Mycolor.lightgray.withOpacity(0.2),
          borderRadius: BorderRadius.circular(SizeConfig.widthPercentage(1.5)),
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.widthPercentage(3)),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  image,
                  width: SizeConfig.widthPercentage(18),
                  height: SizeConfig.widthPercentage(18),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: SizeConfig.widthPercentage(3),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      content,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: themeController.isDarkMode.value
                          ? FontStyles.notificationContent.copyWith(
                        color: Colors.white, // White text in dark mode
                      )
                          : FontStyles.notificationContent.copyWith(
                        color: Mycolor.black, // Black text in light mode
                      ),
                    ),
                    Text(
                      time,
                      style: themeController.isDarkMode.value
                          ? FontStyles.notificationTime.copyWith(
                        color: Colors.white, // White time text in dark mode
                      )
                          : FontStyles.notificationTime.copyWith(
                        color: Mycolor.black, // Black time text in light mode
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
