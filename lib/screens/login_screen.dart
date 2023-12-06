import 'package:flutter/material.dart';
import 'package:focus_buddy/navigation.dart';
import 'package:focus_buddy/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    // Implement your login logic here
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const NavigationScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: blackPearl,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/logo/logo_transparent.png',
              height: 250.0,
            ),
            const SizedBox(
              height: 48,
            ),
            TextField(
              controller: _emailController,
              style: TextStyle(color: theme.primaryColor),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.primaryColor),
                ),
                labelText: 'Username',
                labelStyle: theme.textTheme.titleLarge
                    ?.copyWith(color: theme.primaryColor),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              style: TextStyle(color: theme.primaryColor),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: theme.primaryColor),
                ),
                labelText: 'Password',
                labelStyle: theme.textTheme.titleLarge
                    ?.copyWith(color: theme.primaryColor),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: blueDianne,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text('Login', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Forgot password logic
                  },
                  child: Text('Forgot Password?',
                      style: TextStyle(color: theme.primaryColor)),
                ),
                TextButton(
                  onPressed: () {
                    // Sign up logic
                  },
                  child: Text('Sign Up',
                      style: TextStyle(color: theme.primaryColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
