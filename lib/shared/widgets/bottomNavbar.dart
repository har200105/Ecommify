import 'package:badges/badges.dart';
import 'package:ecommify/screens/account.dart';
import 'package:ecommify/screens/home.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _page = 0;

  List<Widget> _pages = [
    const HomeScreen(),
    const Account(),
    Center(
      child: Text('Cart Page'),
    )
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updatePage,
        currentIndex: _page,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: 50,
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                      color: _page == 0 ? Colors.blue : Colors.white, width: 5),
                )),
                child: Icon(Icons.home_outlined),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Container(
                width: 50,
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                      color: _page == 1 ? Colors.blue : Colors.white, width: 5),
                )),
                child: Icon(Icons.person_outline_rounded),
              ),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: Container(
                width: 50,
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                      color: _page == 2 ? Colors.blue : Colors.white, width: 5),
                )),
                child: Badge(
                    elevation: 0,
                    badgeContent: Text('2'),
                    badgeColor: Colors.blueAccent,
                    child: Icon(Icons.shopping_cart_sharp)),
              ),
              label: 'Cart')
        ],
      ),
    );
  }
}
