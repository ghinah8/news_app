import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/service/my_sevice.dart'; // إضافة استيراد MyService

class CountryController extends GetxController {
  var countries = [].obs; // قائمة الدول الفارغة
  var selectedCountryIndex = (-1).obs;
  var isLoading = false.obs;

  MyService service = Get.find<MyService>(); // الحصول على كائن MyService

  @override
  void onInit() {
    super.onInit();
    fetchCountries(); // جلب البيانات عند تحميل الصفحة
  }

  // وظيفة جلب الدول من API
  Future<void> fetchCountries() async {
    try {
      isLoading.value = true;
      final response = await http.get(
        Uri.parse('http://news.focal-x.com/api/countries'),
        headers: {'Accept-Charset': 'application/json'},
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        countries.value = data['data']; // تخصيص البيانات
      } else {
        Get.snackbar("خطأ", "فشل في جلب البيانات ");
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء الاتصال بـ API: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // وظيفة اختيار الدولة
  void selectCountry(int index) {
    print("Selected index: $index");
    selectedCountryIndex.value = index;
    update(); // إعادة بناء الواجهة يدويًا
  }

  // إرسال الدولة المختارة
  Future<bool> submitSelectedCountry(int countryId) async {
    // الحصول على التوكن من MyService
    String? token = await service.getAccessToken();

    if (token == null) {
      Get.snackbar("لم يتم تسجيل الدخول", "خطأ");
      return false;
    }

    try {
      isLoading.value = true;
      final response = await http.put(
        Uri.parse('http://news.focal-x.com/api/add-country'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token', // استخدام التوكن من الخدمة
        },
        body: {'country_id': countryId.toString()},
      );
      if (response.statusCode == 200) {
        Get.snackbar("تم ارسال الدولة بنجاح", "نجاح");
        return true;
      } else {
        print('هذا هو الخطأ ${response.body}');
        Get.snackbar("خطأ", "فشل ارسال الدولة : ${response.body}");
        return false;
      }
    } catch (e) {
      Get.snackbar("حدث خطأ", "خطأ: $e");
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
