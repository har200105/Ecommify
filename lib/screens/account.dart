import 'package:ecommify/shared/widgets/LogoutButton.dart';
import 'package:ecommify/shared/widgets/appBar_content.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 187, 201, 29),
                  Color.fromARGB(255, 6, 228, 210),
                ],
                stops: [0.5, 1.0],
              )),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Ecommify'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.notifications_rounded),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          preferredSize: Size.fromHeight(50)),
      body: Column(
        children: [AppBarContent(), AccountButton()],
      ),
    );
  }
}
