import 'package:get/get.dart';

class SwitchController extends GetxController {
  bool newsAlert = false;
  bool sportsAlert = false;
  bool pollReminder = true;
  bool vibration = true;

  void updateNewsAlert(bool value) {
    newsAlert = value;
    update(); // تحديث الواجهة عند التغيير
  }

  void updateSportsAlert(bool value) {
    sportsAlert = value;
    update();
  }

  void updatePollReminder(bool value) {
    pollReminder = value;
    update();
  }

  void updateVibration(bool value) {
    vibration = value;
    update();
  }
}
