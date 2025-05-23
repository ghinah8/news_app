import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '/service/link.dart';
import '/service/my_sevice.dart'; // إضافة استيراد MyService

class SettingController extends GetxController {
  var isPressed = false.obs;
  final MyService service = Get.find<MyService>(); // الحصول على كائن MyService

  // دالة لتسجيل الخروج
  Future<void> logout() async {
    try {
      // الحصول على التوكن من الخدمة
      String? token = await service.getAccessToken();

      if (token == null) {
        // إذا لم يتم العثور على التوكن
        Get.snackbar(
            "خطأ", "لم يتم العثور على التوكن. يرجى تسجيل الدخول مجددًا.",
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      final url = Uri.parse(AppLink.logout);

      // إرسال طلب POST لتسجيل الخروج
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token', // استخدام التوكن
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      // التحقق من استجابة الخادم
      if (response.statusCode == 200) {
        // تسجيل الخروج بنجاح
        print('Logged out successfully');

        // مسح التوكن من الخدمة
        await service.clearToken();

        // التوجيه إلى شاشة تسجيل الدخول
        Get.offAllNamed('/log_in_screen');
      } else {
        print('Error: ${response.statusCode}, body: ${response.body}');
        showErrorMessage('حدث خطأ أثناء تسجيل الخروج.');
      }
    } catch (e) {
      // في حال حدوث أي استثناء أثناء الاتصال بالخادم
      print('Error: $e');
      showErrorMessage('تعذر الاتصال بالخادم. تحقق من اتصال الإنترنت.');
    }
  }

  // دالة لعرض رسائل الخطأ
  void showErrorMessage(String message) {
    Get.snackbar('خطأ', message, snackPosition: SnackPosition.BOTTOM);
  }
}
