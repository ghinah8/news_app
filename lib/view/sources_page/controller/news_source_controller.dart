import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../modle/source/news_source.dart';
import '../../../service/my_sevice.dart';

class NewsSourceController extends GetxController {
  var newsSources = <NewsSource>[].obs;
  var selectedSourceIds = <int>[].obs; // Store selected source IDs

  @override
  void onInit() {
    super.onInit();
    fetchNewsSources();
  }

  void toggleFollow(NewsSource source) {
    final index = newsSources.indexOf(source);

    if (index != -1) {
      newsSources[index].isFollowing = !newsSources[index].isFollowing;

      if (newsSources[index].isFollowing) {
        selectedSourceIds.add(newsSources[index].id);
      } else {
        selectedSourceIds.remove(newsSources[index].id);
      }

      newsSources.refresh();
    }
  }

  //1.all news sources api
  Future<void> fetchNewsSources() async {
    const String url = "http://news.focal-x.com/api/source-news";

    try {
      // استرجاع التوكن باستخدام MyService
      final token = await Get.find<MyService>().getAccessToken();

      if (token == null) {
        Get.snackbar("Error", "Token not found");
        return;
      }

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("1_____________> ${response.body}");
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List data = responseData['data'];
        newsSources.value =
            data.map((e) => NewsSource.fromJson(e)).toList();
      } else {
        Get.snackbar("Error", "Failed to load news sources: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }

  //2.news sources for user api
  Future<void> addUserSources() async {
    const String url = "http://news.focal-x.com/api/add-source";

    try {
      // استرجاع التوكن باستخدام MyService
      final token = await Get.find<MyService>().getAccessToken();

      if (token == null) {
        Get.snackbar("Error", "Token not found");
        return;
      }

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'sources': selectedSourceIds.toList(),
        }),
      );

      if (response.statusCode == 200) {
        print("2_____________> ${response.body}");
        final responseData = json.decode(response.body);
        Get.snackbar("Success", responseData['message']);
      } else {
        Get.snackbar("Error", "Failed to add sources: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }
}
