import 'package:get/get.dart';

class SurveyController extends GetxController {
  int selectedIndex = -1; // الخيار الافتراضي (-1 يعني لا يوجد خيار مختار)

  // دالة لتحديث قيمة selectedIndex
  void updateSelectedIndex(int index) {
    selectedIndex = index;
    update(); // لتحديث الواجهة
  }
}
