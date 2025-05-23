import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../../modle/allcategory_modle.dart';
import '../../../service/my_sevice.dart';

class InterestsController extends GetxController {
  // قائمة الاهتمامات (الاسم فقط)
  RxList<String> interests = <String>[].obs;

  // الاهتمامات المختارة (الاسم فقط)
  final RxList<String> selectedInterests = <String>[].obs;

  // Mapping from category names to IDs
  final RxMap<String, int> categoryMap = <String, int>{}.obs;

  MyService myService = Get.find(); // الحصول على MyService

  @override
  void onInit() {
    super.onInit();
    fetchInterests();
  }

  // جلب الاهتمامات من API
  Future<void> fetchInterests() async {
    try {
      // استرجاع التوكن من MyService
      String? token = await myService.getAccessToken();

      var response = await http.get(
        Uri.parse("http://news.focal-x.com/api/categories"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // استخدام التوكن المخزن
        },
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        // Deserialize the JSON response
        Allcategorymodel allcategorymodel =
            allcategorymodelFromJson(response.body);

        // Update interests and categoryMap
        interests.value =
            allcategorymodel.data.map((datum) => datum.name).toList();

        for (var category in allcategorymodel.data) {
          categoryMap[category.name] = category.id;
        }

        print("Fetched Interests: $interests");
        print("Category Map: $categoryMap");
      } else if (response.statusCode == 401) {
        Get.snackbar(
            'Unauthenticated', 'Session expired. Please log in again.');
      } else {
        print('Unexpected response: ${response.body}');
        Get.snackbar('Error', 'Failed to load categories.');
      }
    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    }
    update();
  }

  // إضافة الاهتمامات للمستخدم
  Future<void> addCategoryToUser(List<int> categoryIds) async {
    try {
      // استرجاع التوكن من MyService
      String? token = await myService.getAccessToken();

      // Define the API endpoint
      final uri = Uri.parse("http://news.focal-x.com/api/add-categories");

      // Prepare the body of the request
      final body = {
        "categories": categoryIds, // Send the list of category IDs
      };

      print("Request Body: $body");

      // Send the POST request
      final response = await http.post(
        uri,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // استخدام التوكن المخزن
        },
        body: jsonEncode(body),
      );

      print("Response Status Code:######## ${response.statusCode}");
      print("Response Body:###### ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Deserialize response
        final jsonData = jsonDecode(response.body);
        final message = jsonData["message"];

        // Display success message
        Get.snackbar('Success', message);
      } else if (response.statusCode == 401) {
        Get.snackbar(
          'Unauthenticated',
          'Session expired. Please log in again.',
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to add category. Response: ${response.body}',
        );
      }
    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    }
  }

  // تبديل الاختيار بين الإضافة والإزالة
  void toggleSelection(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest);
    } else {
      selectedInterests.add(interest);
    }
  }

  RxMap<String, bool> buttonStates = <String, bool>{}.obs;

  void toggleButtonState(String interest) {
    buttonStates[interest] = !(buttonStates[interest] ?? false);
    update();
  }
}
