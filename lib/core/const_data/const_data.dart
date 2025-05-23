import 'dart:async';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ConstData{
  static RxBool isLoading = false.obs;
  static String token = "";
  static Future <void> UpdateToken ()async {
  }

  static Future<void> startTokenupdater()async{
    Timer.periodic(Duration (seconds: 20),(Timer){
      UpdateToken();
    });
  }
}
