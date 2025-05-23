import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/app_image.dart';
import '../../../core/const_data/const_data.dart';
import '../../../core/const_data/text_style.dart';
import '../../../media_query_service.dart';
import '../../../widgets/general/bottom_back.dart';
import '../../../widgets/helpful_widgets/custom_button.dart';
import '../../../widgets/helpful_widgets/custom_news.dart';
import '../controller/news_controller.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig().init(context);

    // الحصول على الكنترولير
    final NewsController controller = Get.put(NewsController());

    // الحصول على الثيم الحالي من التطبيق
    final themeData = Theme.of(context);
    final textColor = themeData.textTheme.bodyLarge?.color ?? Mycolor.black;
    final backgroundColor = themeData.scaffoldBackgroundColor;

    // تحديد لون الأزرار بناءً على الوضع (Light/Dark)
    final buttonColor = themeData.brightness == Brightness.dark
        ? Mycolor.white
        : Mycolor.black;

    // تحديد لون نص الزر "متابعة" بناءً على الوضع
    final followButtonTextColor = themeData.brightness == Brightness.dark
        ? Mycolor.black
        : Mycolor.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: backgroundColor,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.widthPercentage(2.5),
              top: SizeConfig.heightPercentage(1),
            ),
            child: IconBackButton(),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.heightPercentage(1),
          ),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, color: textColor)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share_outlined, color: textColor)),
            ],
          ),
        ),
        leadingWidth: SizeConfig.widthPercentage(25),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthPercentage(4),
        ),
        child: Obx(() {
          if (ConstData.isLoading.value) {
            return Center(child: CircularProgressIndicator()); // مؤشر تحميل
          }

          // التحقق من البيانات
          if (controller.news.value == null) {
            return Center(child: Text("لا توجد أخبار متاحة حاليًا."));
          }

          // استخدام البيانات في CustomNews
          final newsData = controller.news.value!.data;

          return Column(
            children: [
              SizedBox(height: SizeConfig.heightPercentage(2)),
              Row(
                children: [
                  CustomButton(
                    width: SizeConfig.widthPercentage(25),
                    height: SizeConfig.heightPercentage(4),
                    fontstyles: FontStyles.newsfollowchannel
                        .copyWith(color: followButtonTextColor),
                    text1: 'متابعة',
                    backgroundcolor: buttonColor,
                    onPressed: () {},
                  ),
                  SizedBox(width: SizeConfig.widthPercentage(28)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('بي بي سي',
                          style: FontStyles.newschannel
                              .copyWith(color: textColor)),
                      Text(
                        'منذ ساعة',
                        style: FontStyles.newshour
                            .copyWith(color: textColor.withOpacity(0.7)),
                      ),
                    ],
                  ),
                  SizedBox(width: SizeConfig.widthPercentage(3)),
                  CircleAvatar(
                    radius: SizeConfig.widthPercentage(5),
                    backgroundColor: Mycolor.gray1,
                    child: Image.asset(AppImage.BBC),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.heightPercentage(3)),
              CustomNews(
                id: newsData.id, // تمرير المعرف
                country: newsData.country,
                newstitle: newsData.title,
                newsimage: newsData.photo,
                newscontant: newsData.description,
              ),
              Padding(
                padding: EdgeInsets.all(SizeConfig.widthPercentage(4)),
                child: Row(
                  children: [
                    Icon(Icons.favorite_border, size: 24),
                    SizedBox(width: 10),
                    Text('Like'),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.heightPercentage(9)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border_outlined,
                        color: textColor),
                    iconSize: SizeConfig.widthPercentage(7),
                  ),
                  SizedBox(width: SizeConfig.widthPercentage(43)),
                  Text(
                    '300',
                    style: FontStyles.favouritecomment.copyWith(
                      fontSize: SizeConfig.widthPercentage(4),
                      color: textColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.message_outlined, color: textColor),
                    iconSize: SizeConfig.widthPercentage(7),
                  ),
                  Text(
                    '260',
                    style: FontStyles.favouritecomment.copyWith(
                      fontSize: SizeConfig.widthPercentage(4),
                      color: textColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline, color: textColor),
                    iconSize: SizeConfig.widthPercentage(7),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
