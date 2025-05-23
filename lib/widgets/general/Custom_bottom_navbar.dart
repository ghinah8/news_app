import 'package:flutter/material.dart';
import 'package:get/get.dart'; // استيراد مكتبة getx
import '../../core/const_data/app_colors.dart';
import '../../core/const_data/app_image.dart';
import '../../media_query_service.dart';
import '../../theme/controller.dart';

class BottomNavBar extends StatelessWidget {
  final Function()? onPressedHome;
  final Function()? onPressedBookmark;
  final Function()? onPressedStats;
  final Function()? onPressedProfile;
  final bool isSelectedHome;
  final bool isSelectedpoll;
  final bool isSelectedBookmarks;
  final bool isSelectedProfile;

  const BottomNavBar({
    Key? key,
    this.onPressedHome,
    this.onPressedBookmark,
    this.onPressedStats,
    this.onPressedProfile,
    required this.isSelectedHome,
    required this.isSelectedpoll,
    required this.isSelectedBookmarks,
    required this.isSelectedProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // استدعاء المتحكم للثيم
    final ThemeController themeController = Get.find();

    // تحديد الألوان بناءً على الثيم
    final backgroundColor = themeController.isDarkMode.value ? Mycolor.darkThem : Mycolor.white;
    final iconColor = themeController.isDarkMode.value ? Colors.white : Colors.black;

    SizeConfig().init(context); // Initialize the SizeConfig

    return Container(
      height: SizeConfig.heightPercentage(7), // 8% of screen height
      decoration: BoxDecoration(
        color: backgroundColor, // تغيير الخلفية بناءً على الثيم
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Transform.translate(
            offset: Offset(SizeConfig.widthPercentage(-6), -5),
            child: IconButton(
              onPressed: onPressedProfile,
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  if (isSelectedProfile)
                    Image.asset(
                      AppImage.profileIconSelect,
                      width: SizeConfig.widthPercentage(6) + 2,
                      color: iconColor, // تغيير اللون بناءً على الثيم
                    ),
                  Image.asset(
                    AppImage.profileIcon,
                    width: SizeConfig.widthPercentage(6.5),
                    color: isSelectedProfile ? iconColor : iconColor.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.widthPercentage(-3), -5),
            child: IconButton(
              onPressed: onPressedStats,
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  if (isSelectedpoll)
                    Image.asset(
                      AppImage.bookmarksIconSelect,
                      width: SizeConfig.widthPercentage(4) + 2,
                      color: iconColor,
                    ),
                  Image.asset(
                    AppImage.bookmarksIcon,
                    width: SizeConfig.widthPercentage(4.6),
                    color: isSelectedpoll ? iconColor : iconColor.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.widthPercentage(4), -5),
            child: IconButton(
              onPressed: onPressedBookmark,
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  if (isSelectedBookmarks)
                    Image.asset(
                      AppImage.pollsIconSelect,
                      width: SizeConfig.widthPercentage(6) + 2,
                      color: iconColor,
                    ),
                  Image.asset(
                    AppImage.pollsIcon,
                    width: SizeConfig.widthPercentage(6),
                    color: isSelectedBookmarks ? iconColor : iconColor.withOpacity(0.7),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(SizeConfig.widthPercentage(6), -5),
            child: IconButton(
              onPressed: onPressedHome,
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  if (isSelectedHome)
                    Image.asset(
                      AppImage.homeIconSelect,
                      width: SizeConfig.widthPercentage(6) + 2,
                      color: iconColor,
                    ),
                  Image.asset(
                    AppImage.homeIcon,
                    width: SizeConfig.widthPercentage(6),
                    color: iconColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
