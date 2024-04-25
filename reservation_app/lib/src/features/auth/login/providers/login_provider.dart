import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:reservation_app/src/core/utils/dio_client.dart';
import 'package:reservation_app/src/core/utils/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userRoleController = TextEditingController();
  bool _isPasswordVisible = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final DioClient _dioClient = DioClient();

  //getters
  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get userRoleController => _userRoleController;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void initializeControllers() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //login user function
  Future<void> loginUser(BuildContext context) async {
    print("Email${_emailController.text.trim()}");
    print("Password${_passwordController.text.trim()}");

    Response response = await _dioClient
        .init()
        .post('/login', data: {
          'email': _emailController.text.trim(),
          'password': _passwordController.text.trim(),
        })
        .then((value) => value)
        .catchError((error) {
          print(error);
        });

    print("Here is the status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      await SharedPrefs.setToken(response.data['token']);
      await SharedPrefs.setAuthenticated(true);

      String token = await SharedPrefs.getToken();
      print("Token: $token");

      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      var email = decodedToken['email'];
      var userId = decodedToken['userId'];
      var userRole = decodedToken['role'];

      print('User with email $email and id $userId has been logged in');

      print('User role: $userRole');

      _userRoleController.text = userRole;

      await SharedPrefs.setUserId(userId);
      await SharedPrefs.setUserEmail(email);
      await SharedPrefs.setUserRole(userRole);
    } else {
      print('Error logging in');
    }

    notifyListeners();
  }

  Future<void> logoutUser(BuildContext context) async {
    await SharedPrefs.setToken('');
    await SharedPrefs.setAuthenticated(false);
    await SharedPrefs.setUserId('');
    await SharedPrefs.setUserEmail('');
    notifyListeners();
  }
}
