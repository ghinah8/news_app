import 'package:flutter/material.dart';

import '../../core/const_data/app_colors.dart';
import '../../media_query_service.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.fontstyles,
    required this.text1,
    required this.backgroundcolor,
    required this.onPressed,
    this.width, // Optional: width of the button
    this.height, // Optional: height of the button
  });

  final TextStyle fontstyles;
  final String text1;
  final Color backgroundcolor;
  final Function()? onPressed;
  final double? width; // Custom width
  final double? height; // Custom height

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.widthPercentage(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: width ??
                SizeConfig.widthPercentage(25), // Set custom width or default
            height: height ??
                SizeConfig.heightPercentage(6), // Set custom height or default
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  width ?? SizeConfig.widthPercentage(25),
                  height ?? SizeConfig.heightPercentage(6),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.widthPercentage(2)),
                ),
                side: BorderSide(
                  width: SizeConfig.widthPercentage(0.3),
                  color: Mycolor.black,
                ),
                backgroundColor: backgroundcolor,
                elevation: 2,
              ),
              onPressed: onPressed,
              child: Text(
                text1,
                style: fontstyles,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
