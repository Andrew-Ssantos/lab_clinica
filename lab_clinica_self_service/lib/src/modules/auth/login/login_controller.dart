import 'package:lab_clinica_self_service/src/services/user_login_service.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginController {
  final UserLoginService _loginService;

  LoginController({
    required UserLoginService loginService,
  }) : _loginService = loginService;

  final _obscurePassword = signal(true);
  bool get obscurePassword => _obscurePassword.value;

  void passwordToggle() => _obscurePassword.value = !_obscurePassword.value;

  void login(String email, String password) {}
}
