import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // استدعاء مكتبة Google Fonts
import '../../core/const_data/app_colors.dart';
import '../../media_query_service.dart';

class PasswordInputField extends StatelessWidget {
  final String hintText;

  // Constructor لتلقي النص التوضيحي ديناميكيًا
  PasswordInputField({required this.hintText});

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig().init(context);

    return Container(
      width: SizeConfig.widthPercentage(90), // العرض ديناميكي بنسبة 90% من الشاشة
      height: SizeConfig.heightPercentage(7), // الطول ديناميكي بنسبة 7% من الشاشة
      margin: EdgeInsets.only(
        left: SizeConfig.widthPercentage(0.01), // الإزاحة من اليسار
        right: SizeConfig.widthPercentage(0.01),
      ),
      child: TextFormField(
        keyboardType: TextInputType.text, // نوع الإدخال: نص عادي
        decoration: InputDecoration(
          hintText: hintText, // نص توضيحي ديناميكي
          hintStyle: GoogleFonts.cairo(
            color: Mycolor.editnameoremail.withOpacity(0.5), // لون النص التوضيحي
            fontSize: 20, // حجم النص
          ),
          hintTextDirection: TextDirection.rtl, // محاذاة النص التوضيحي لليمين
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15), // مسافة داخلية
          border: OutlineInputBorder( // إطار خارجي للحقل
            borderRadius: BorderRadius.circular(5), // الحواف مستديرة بقيمة 5px
            borderSide: const BorderSide(color: Colors.black, width: 1), // الإطار بسماكة 1px
          ),
          enabledBorder: OutlineInputBorder( // إطار للحالة العادية
            borderRadius: BorderRadius.circular(5), // الحواف مستديرة بقيمة 5px
            borderSide: const BorderSide(color: Colors.black, width: 1), // الإطار بسماكة 1px
          ),
          focusedBorder: OutlineInputBorder( // إطار للحالة النشطة
            borderRadius: BorderRadius.circular(5), // الحواف مستديرة بقيمة 5px
            borderSide: BorderSide(color: Mycolor.editnameoremail, width: 1), // الإطار بسماكة 1px بلون مخصص
          ),
        ),
        textAlign: TextAlign.right, // محاذاة النص داخل الحقل إلى اليمين
      ),
    );
  }
}
