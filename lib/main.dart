import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/routes.dart';
import '/service/my_sevice.dart';
import '/theme/controller.dart';
import 'binding/initial_bindinds.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة الخدمات
  await Get.putAsync(() => MyService().init());
  final ThemeController themeController = Get.put(ThemeController());
  await themeController.loadTheme();

  // التحقق من حالة تسجيل الدخول
  final MyService service = Get.find<MyService>();
  bool isLoggedIn = await service.isUserLoggedIn();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeController.isDarkMode.value
            ? ThemeData.dark()
            : ThemeData.light(),
        initialBinding: InitialBindings(),
        getPages: Routes.pages,
        initialRoute: isLoggedIn ? Routes.home_page : Routes.splash_screen,
      );
    });
  }
}
