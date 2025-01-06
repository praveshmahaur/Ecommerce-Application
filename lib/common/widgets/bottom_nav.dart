import 'package:ecommerce_application/constants/global_colors.dart';
import 'package:ecommerce_application/features/account/screens/account_screen.dart';
import 'package:ecommerce_application/features/auth/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomNav extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _page = 0;
  double bottomNavWidth = 42;
  double bottomNavBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text('Cart Page'))
  ];

  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalColors.selectedNavBarColor,
        unselectedItemColor: GlobalColors.unselectedNavBarColor,
        backgroundColor: GlobalColors.backgroundColor,
        iconSize: 25,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 0
                    ? GlobalColors.selectedNavBarColor
                    : GlobalColors.backgroundColor,
                width: bottomNavBorderWidth,
              ))),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomNavWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 1
                    ? GlobalColors.selectedNavBarColor
                    : GlobalColors.backgroundColor,
                width: bottomNavBorderWidth,
              ))),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Container(
                  width: bottomNavWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: _page == 2
                        ? GlobalColors.selectedNavBarColor
                        : GlobalColors.backgroundColor,
                    width: bottomNavBorderWidth,
                  ))),
                  child: const badges.Badge(
                    badgeContent: Text("2"),
                    badgeStyle: badges.BadgeStyle(badgeColor: Colors.blue, elevation: 0),
    
                    child: Icon(Icons.shopping_cart_outlined))),
              label: '')
        ],
      ),
    );
  }
}
