import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:reservation_app/src/core/utils/shared_preferences.dart';
import '../../../../core/utils/dio_client.dart';

class RegisterProvider extends ChangeNotifier {
  final DioClient _dioClient = DioClient();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  TextEditingController get fullNameController => _fullNameController;

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  void initializeControllers() {
    _fullNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  //register user function
  Future<void> registerUser(BuildContext context) async {
    Response response = await _dioClient
        .init()
        .post('/register', data: {
          'fullName': _fullNameController.text.trim(),
          'email': _emailController.text.trim(),
          'password': _passwordController.text.trim(),
          'confirmPassword': _confirmPasswordController.text.trim(),
          'role': 'customer',
        })
        .then((value) => value)
        .catchError((error) {
          print(error);
        });

    print(response);

    if (response.statusCode == 201) {
      await SharedPrefs.setToken(response.data['token']);
      await SharedPrefs.setAuthenticated(true);

      String token = await SharedPrefs.getToken();
      print("Token: $token");
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      var email = decodedToken['email'];
      var userId = decodedToken['userId'];

      print("Email: $email");
      print("User ID: $userId");

      await SharedPrefs.setUserId(userId.toString());
      await SharedPrefs.setUserEmail(email);
    }
    notifyListeners();
  }
}
