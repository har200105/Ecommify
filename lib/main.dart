import 'package:ecommify/provider/user.dart';
import 'package:ecommify/routes.dart';
import 'package:ecommify/screens/admin/screens/admin_screen.dart';
import 'package:ecommify/services/auth/screens/auth.dart';
import 'package:ecommify/shared/widgets/bottomNavbar.dart';
import 'package:ecommify/utils/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommify',
        theme: ThemeData(
            textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 72.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              headline6: TextStyle(
                  fontSize: 36.0,
                  color: Colors.black,
                  fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
            colorScheme: ColorScheme.dark(primary: Colors.teal),
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            appBarTheme: AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Ecommify'),
          ),
          body: Provider.of<UserProvider>(context).user.token.isNotEmpty
              ? Provider.of<UserProvider>(context).user.type == 'user'
                  ? const BottomNavbar()
                  : const AdminScreen()
              : const AuthScreen(),
        ));
  }
}
