import '/modle/response_data_model.dart';

class LoginResponseData {
  final User user;
  final String token;
  final String message;

  LoginResponseData({
    required this.user,
    required this.token,
    required this.message,
  });

  factory LoginResponseData.fromMap(Map<String, dynamic> map) {
    return LoginResponseData(
      user: User.fromMap(map['data']['user']),
      token: map['data']['token'],
      message: map['message'],
    );
  }
}
