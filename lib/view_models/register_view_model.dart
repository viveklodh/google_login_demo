import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterViewModel extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String _email = '';
  String _password = '';
  bool _isValid = false;
  String _emailError = '';
  String _passwordError = '';

  String get email => _email;
  String get password => _password;
  bool get isValid => _isValid;
  String get emailError => _emailError;
  String get passwordError => _passwordError;

  void setEmail(String email) {
    _email = email;
    _validateEmail();
    _validate();
  }

  void setPassword(String password) {
    _password = password;
    _validatePassword();
    _validate();
  }

  void _validateEmail() {
    final emailPattern = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailPattern.hasMatch(_email)) {
      _emailError = 'Invalid email format';
    } else {
      _emailError = '';
    }
    notifyListeners();
  }

  void _validatePassword() {
    final passwordPattern = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$');
    if (!passwordPattern.hasMatch(_password)) {
      _passwordError = 'Password must be at least 8 characters long, include an uppercase letter, a number, and a special character';
    } else {
      _passwordError = '';
    }
    notifyListeners();
  }

  void _validate() {
    _isValid = _emailError.isEmpty && _passwordError.isEmpty && _email.isNotEmpty && _password.isNotEmpty;
    notifyListeners();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (error) {
      print(error);
    }
  }

  void register(BuildContext context) {
    if (_isValid) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
