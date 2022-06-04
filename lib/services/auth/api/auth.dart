import 'dart:convert';
import 'dart:math';

import 'package:ecommify/models/user.dart';
import 'package:ecommify/provider/user.dart';
import 'package:ecommify/utils/Errorhandler.dart';
import 'package:ecommify/utils/GlobalVariables.dart';
import 'package:ecommify/utils/Snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = new User(
          id: '',
          name: name,
          password: password,
          type: '',
          token: '',
          address: '',
          email: email,
          cart: []);
      http.Response response = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(), headers: {'Content-Type': 'Application/json'});

      showSnackBar(context, 'Account Created Successfully');
    } catch (e) {}
  }

  void loginUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      User user = new User(
          id: '',
          name: '',
          password: password,
          token: '',
          type: '',
          address: '',
          cart: [],
          email: email);
      http.Response response = await http.post(Uri.parse('$uri/api/login'),
          body: user.toJson(), headers: {'Content-Type': 'Application/json'});

      // showSnackBar(context, 'Login Successfully');
      httpErrorhandler(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', jsonDecode(response.body)['token']);
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          });
    } catch (e) {}
  }
}
