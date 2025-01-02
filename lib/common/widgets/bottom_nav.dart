import 'package:ecommerce_application/constants/global_colors.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalColors.selectedNavBarColor,
        unselectedItemColor: GlobalColors.unselectedNavBarColor,
        backgroundColor: GlobalColors.backgroundColor,
        iconSize: 25,
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
          BottomNavigationBarItem(icon: Container(
            width: bottomNavWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page == 1 ? GlobalColors.selectedNavBarColor : GlobalColors.backgroundColor,
                width: bottomNavBorderWidth,
              ))
            ),
            child: const Icon(Icons.person_outline_outlined),
          ),
          label: '',
          ),
          BottomNavigationBarItem(icon: Container(
            width: bottomNavWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: _page == 2 ? GlobalColors.selectedNavBarColor : GlobalColors.backgroundColor,
                width: bottomNavBorderWidth,
              ))
            ),
            child:Icon(Icons.home_outlined)
          ),
          label: ''
          )
        ],
      ),
    );
  }
}
