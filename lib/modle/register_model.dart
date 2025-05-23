class RegisterRequestData {
  final String name; // اسم المستخدم
  final String email; // البريد الإلكتروني
  final String password; // كلمة المرور
  final String passwordConfirmation; // تأكيد كلمة المرور
  final String token; // التوكن لإضافته في الطلب

  RegisterRequestData({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.token, // اجعل التوكن مطلوبًا
  });

  // تحويل الكائن إلى خريطة (Map) لإرسالها إلى API
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'token': token, // تضمين التوكن في الطلب
    };
  }

  // تحويل من JSON إلى كائن (اختياري)
  factory RegisterRequestData.fromMap(Map<String, dynamic> map) {
    return RegisterRequestData(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      passwordConfirmation: map['password_confirmation'] ?? '',
      token: map['token'] ?? '', // استخراج التوكن من JSON
    );
  }
}
