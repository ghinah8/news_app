import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../media_query_service.dart';
import '../../theme/controller.dart';

class RadioButtonsWithText extends StatefulWidget {
  final List<String> labels; // قائمة النصوص
  final ValueChanged<int> onChanged; // لاستدعاء القيمة عند تغيير الخيار
  final int selectedIndex; // الخيار المحدد مسبقاً

  RadioButtonsWithText({
    required this.labels,
    required this.onChanged,
    required this.selectedIndex,
  });

  @override
  _RadioButtonsWithTextState createState() => _RadioButtonsWithTextState();
}

class _RadioButtonsWithTextState extends State<RadioButtonsWithText> {
  RxInt _selectedIndex = 0.obs; // الحالة باستخدام GetX
  final ThemeController themeController = Get.find(); // التحكم بالثيم

  @override
  void initState() {
    super.initState();
    _selectedIndex.value = widget.selectedIndex; // تعيين الخيار المبدئي
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // تهيئة MediaQuery

    double fontSize = SizeConfig.widthPercentage(4.0); // حجم النص
    return Column(
      children: List.generate(
        widget.labels.length,
            (index) => SizedBox(
          height: 44.0, // تحديد ارتفاع كل عنصر
          child: Stack(
            alignment: Alignment.centerRight, // محاذاة العناصر لليمين
            children: [
              Positioned(
                right: 36, // النص في أقصى اليمين
                child: Obx(() => Text(
                  widget.labels[index],
                  style: GoogleFonts.cairo(
                    fontSize: fontSize,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black, // تغيير لون النص بناءً على الثيم
                  ),
                )),
              ),
              Positioned(
                right: -10, // مسافة الدائرة من النص
                child: Obx(() => Radio<int>(
                  value: index,
                  groupValue: _selectedIndex.value, // القيمة المحددة
                  activeColor: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black, // تغيير لون الدائرة بناءً على الثيم
                  onChanged: (int? value) {
                    if (value != null) {
                      _selectedIndex.value = value; // تحديث القيمة
                      widget.onChanged(value); // تمرير القيمة للخارج
                    }
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
