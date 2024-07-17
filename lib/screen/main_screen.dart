
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




import 'book_screen.dart';
import 'home_screen.dart';
import 'loginsignup/login_signup.dart';
import 'myTrips_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = const [
    HomeScreen(),
    MyTripsScreen(),
    BookScreen(),
    LoginSignupScreen(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: const Color.fromRGBO(42, 33, 100, 1.0),
        items: [
          CurvedNavigationBarItem(
            child:Image.asset(
              "image/home-page.png",
              width: 28,
              color: Colors.amber,
            ),
            labelStyle: const TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
            label: "2".tr,
          ),
          CurvedNavigationBarItem(
            child: Image.asset(
              "image/plane.png",
              width: 35,
              color: Colors.amber,
            ),
            labelStyle: const TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
            label: "3".tr,
          ),
          CurvedNavigationBarItem(
            child:Image.asset(
              "image/search.png",
              width: 28,
              color: Colors.amber,
            ),
            labelStyle: const TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
            label: "4".tr,
          ),
          CurvedNavigationBarItem(
            child:Image.asset(
              "image/profile.png",
              width: 28,
              color: Colors.amber,
            ),
            labelStyle: const TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
            label: "5".tr,
          ),
        ],
        onTap: (value){
          setState(() {
            _selectedIndex= value;
          });
        },
        animationDuration: const Duration(milliseconds: 600),
      ),
      body: screens[_selectedIndex],
    );
  }
}
