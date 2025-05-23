import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '/view/country_page/screen/country_page.dart';
import '../../../modle/login_model.dart';
import '../../../modle/register_model.dart';
import '../../../service/link.dart';
import '../../../service/my_sevice.dart';

class AuthController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  RxBool isLoading = false.obs;
  MyService service = Get.find<MyService>();

  void setLoading(bool value) {
    isLoading.value = value;
    update();
  }

  // تسجيل الدخول
  Future<void> signIn() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("خطأ", "البريد الإلكتروني وكلمة المرور مطلوبان",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    setLoading(true);
    final url = Uri.parse(AppLink.login);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': emailController.text,
          'password': passwordController.text,
          'token': 'token', // استبدل بالقيمة المناسبة
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final loginResponse = LoginResponseData.fromMap(data);

        print('تم تسجيل الدخول بنجاح: ${loginResponse.token}');
        Get.snackbar("تم", "تم تسجيل الدخول بنجاح",
            snackPosition: SnackPosition.BOTTOM);

        service.saveToken(loginResponse.token, saveToPreferences: true);

        Get.to(
          CountryPage(),
          transition: Transition.fade,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else {
        Get.snackbar("خطأ", "فشل تسجيل الدخول. تحقق من بياناتك.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print('حدث خطأ: $e');
      Get.snackbar("خطأ", "حدث خطأ أثناء تسجيل الدخول. حاول مرة أخرى.",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      setLoading(false);
    }
  }

  // التسجيل
  Future<void> signUp() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        passwordConfirmationController.text.isEmpty) {
      Get.snackbar("خطأ", "جميع الحقول مطلوبة",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (passwordController.text != passwordConfirmationController.text) {
      Get.snackbar("خطأ", "كلمة المرور وتأكيد كلمة المرور غير متطابقتين",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    setLoading(true);
    final url = Uri.parse(AppLink.register);
    try {
      final registerData = RegisterRequestData(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        token: 'token',
      );

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(registerData.toMap()),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['data']['token'];

        if (token != null) {
          print('تم التسجيل بنجاح: $token');
          service.saveToken(token, saveToPreferences: true);
          Get.snackbar("تم", "تم إنشاء الحساب بنجاح",
              snackPosition: SnackPosition.BOTTOM);

          Get.to(
            CountryPage(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 300),
          );
        } else {
          Get.snackbar("خطأ", "فشل التسجيل. استجابة غير صحيحة.",
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        final errorData = json.decode(response.body);
        Get.snackbar(
            "خطأ", errorData['message'] ?? "فشل التسجيل. تحقق من مدخلاتك.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print('Error during registration: $e');
      Get.snackbar("خطأ", "حدث خطأ أثناء التسجيل. حاول مرة أخرى.",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      setLoading(false);
    }
  }
}
