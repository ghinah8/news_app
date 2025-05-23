import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../core/const_data/const_data.dart';
import '../../../modle/news.dart';
import '../../../service/my_sevice.dart'; // تأكد من استيراد MyService

class NewsController extends GetxController {
  Rx<News?> news = Rx<News?>(null); // متغير لمراقبة الأخبار

  // دالة لجلب الأخبار حسب id
  void fetchNews(int id) async {
    try {
      ConstData.isLoading.value = true;

      // استدعاء التوكن المخزن من MyService
      final myService = Get.find<MyService>();
      final token = await myService.getAccessToken(fromPreferences: true);

      if (token == null) {
        Get.snackbar("Error", "No token found. Please log in again.");
        return;
      }

      // بناء الهيدر مع التوكن
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response = await http.get(
        Uri.parse('http://news.focal-x.com/api/news/$id'), // تمرير الـ id في الرابط
        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonData = response.body;

        // تحويل JSON إلى كائن News
        final fetchedNews = newsFromJson(jsonData);

        // تخزين البيانات في المتغير المراقب
        news.value = fetchedNews;
      } else {
        Get.snackbar("Error", "Failed to load news. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred while fetching news");
    } finally {
      ConstData.isLoading.value = false;
    }
  }

  @override
  void onInit() {
    int id = Get.arguments; // استلام الـ id من الـ arguments

    fetchNews(id);
    super.onInit();
  }
}
