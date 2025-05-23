import 'package:get/get.dart';

class SearchPageController extends GetxController {

  var searchText = ''.obs;


  var selectedFilter = ''.obs;


  var searchResults = <Map<String, String>>[
    {"title": "فلسطين", "subtitle": "61 مصاباً في مواجهات", "time": "منذ 2 ساعة"},
    {"title": "مصر", "subtitle": "تطورات الاجتماع الوزاري", "time": "منذ 4 ساعات"},
    {"title": "عالمي", "subtitle": "أخبار متنوعة", "time": "منذ 1 ساعة"},
  ].obs;



  void updateSearchText(String text) {
    searchText.value = text;
  }
}
