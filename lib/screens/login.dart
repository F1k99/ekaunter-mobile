import 'package:e_kaunter_mobile/component/button.dart';
import 'package:e_kaunter_mobile/component/textField.dart';
import 'package:e_kaunter_mobile/text_style.dart';
import 'package:e_kaunter_mobile/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  void _handleLogin() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: PrimaryTextField(
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      prefixIcon: Icons.account_circle,
                      textStyle: textFieldText,
                      controller: _emailController,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: PrimaryTextField(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icons.lock,
                      suffixIcon: _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onSuffixIconPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      textStyle: textFieldText, 
                      obscureText: !_isPasswordVisible,
                      controller: _passwordController,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: PrimaryButton(
                      buttonColor: primaryColor,
                      title: 'Login',
                      textStyle: buttonText,
                      onPressed: _handleLogin,
                      width: 300,
                      height: 50),
                ),
              ],
            )
          ],
        ));
  }
}
