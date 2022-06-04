import 'package:ecommify/services/auth/api/auth.dart';
import 'package:ecommify/services/auth/widgets/Button.dart';
import 'package:ecommify/shared/widgets/textField.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

enum Auth { signup, login }

class _AuthScreenState extends State<AuthScreen> {
  Auth auth = Auth.signup;
  final _signupKey = GlobalKey<FormState>();
  final _loginKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  final AuthService _authService = AuthService();

  void signUpUser() {
    _authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    _authService.loginUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            ListTile(
              tileColor: auth == Auth.signup ? Colors.white : Color(0xffebecee),
              title: Text(
                'Create Account',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              leading: Radio(
                activeColor: Colors.amber,
                value: Auth.signup,
                groupValue: auth,
                onChanged: (Auth? val) {
                  setState(() {
                    auth = val!;
                  });
                },
              ),
            ),
            if (auth == Auth.signup)
              Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.white,
                child: Form(
                  key: _signupKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      CustomTextField(
                        controller: _nameController,
                        hintText: 'Name',
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                          text: 'Sign up',
                          onTap: () {
                            if (_signupKey.currentState!.validate()) {
                              signUpUser();
                            }
                          })
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: auth == Auth.login ? Colors.white : Color(0xffebecee),
              title: const Text(
                'Sign-In.',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              leading: Radio(
                activeColor: Colors.amber,
                value: Auth.login,
                groupValue: auth,
                onChanged: (Auth? val) {
                  setState(() {
                    auth = val!;
                  });
                },
              ),
            ),
            if (auth == Auth.login)
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Form(
                  key: _loginKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: 'Sign In',
                        onTap: () {
                          if (_loginKey.currentState!.validate()) {
                            signInUser();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
