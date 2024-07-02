import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/register_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerViewModel = Provider.of<RegisterViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              label: 'Email',
              onChanged: registerViewModel.setEmail,
            ),
            if (registerViewModel.emailError.isNotEmpty)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    registerViewModel.emailError,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            CustomTextField(
              label: 'Password',
              isPassword: true,
              onChanged: registerViewModel.setPassword,
            ),
            if (registerViewModel.passwordError.isNotEmpty)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    registerViewModel.passwordError,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Register',
              isEnabled: registerViewModel.isValid,
              onPressed: () {
                registerViewModel.register(context);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Image.asset('assets/google_logo.jpg', height: 24.0),
              label: const Text('Sign in with Google'),
              onPressed: () {
                registerViewModel.signInWithGoogle(context);
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
