import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/login_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              label: 'Email',
              onChanged: loginViewModel.setEmail,
            ),
            if (loginViewModel.emailError.isNotEmpty)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    loginViewModel.emailError,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            CustomTextField(
              label: 'Password',
              isPassword: true,
              onChanged: loginViewModel.setPassword,
            ),
            if (loginViewModel.passwordError.isNotEmpty)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    loginViewModel.passwordError,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Login',
              isEnabled: loginViewModel.isValid,
              onPressed: () {
                loginViewModel.login(context);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Image.asset('assets/google_logo.jpg', height: 24.0),
              label: const Text('Sign in with Google'),
              onPressed: () {
                loginViewModel.signInWithGoogle(context);
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
