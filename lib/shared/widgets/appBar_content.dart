import 'package:ecommify/provider/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarContent extends StatelessWidget {
  const AppBarContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 187, 201, 29),
            Color.fromARGB(255, 6, 228, 210),
          ],
          stops: [0.5, 1.0],
        ),
      ),
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          RichText(
              text: TextSpan(
                  text: 'Welcome',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                  children: [
                TextSpan(
                    text: user != null ? user.name : "",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: []),
              ])),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
