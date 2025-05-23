import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../modle/news_home.dart';
import '../../../service/my_sevice.dart'; // تأكد من استيراد MyService

class HomeController extends GetxController {
  var news = Rx<Newshome?>(null); // المتغير المراقب لتخزين الأخبار
  var isLoading = false.obs; // مؤشر التحميل

  // الفئات المحددة والفئة المختارة
  var selectedCategory = 'الكل'.obs;

  void fetchNews() async {
    try {
      isLoading.value = true;

      // استدعاء التوكن المخزن من MyService
      final myService = Get.find<MyService>();
      final token = await myService.getAccessToken(fromPreferences: true);

      if (token == null) {
        Get.snackbar("Error", "No token found. Please log in again.");
        return;
      }

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // استخدم التوكن المخزن هنا
      };

      // إرسال الطلب بدون فئة لتجنب المشكلة المحتملة
      final response = await http.get(
        Uri.parse('http://news.focal-x.com/api/news?categories[0]=3'),
        headers: headers,
      );

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = response.body;

        final fetchedNews = newshomeFromJson(jsonData);

        news.value = fetchedNews;

        if (fetchedNews.data.isEmpty) {
          Get.snackbar("No News", "No news available for the selected category.");
        }
      } else {
        Get.snackbar(
            "Error", "Failed to load news. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar("Error", "An error occurred while fetching news: $e");
    } finally {
      isLoading.value = false;
    }
  }

  List<Datum> get filteredNews {
    // تحقق من الفئة المختارة وعرض الأخبار بناءً على الفئة
    if (selectedCategory.value == 'الكل') {
      return news.value?.data ?? [];
    } else {
      return news.value?.data
          .where((datum) => datum.country == selectedCategory.value)
          .toList() ?? [];
    }
  }

  void changeCategory(String category) {
    selectedCategory.value = category;
    fetchNews(); // إعادة تحميل الأخبار عند تغيير الفئة
  }

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }
}
