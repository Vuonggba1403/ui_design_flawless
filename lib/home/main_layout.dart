import 'package:booking_app/screens/profiles/profiles_screen.dart';
import 'package:booking_app/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../widgets/colors.dart';
import 'features/calendar_book_screen.dart';
import 'features/search_screen.dart';
import 'features/home_screen.dart';
import 'features/setting_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final items = [
    const Icon(Icons.home),
    const Icon(Icons.search),
    const Icon(Icons.calendar_today),
    const Icon(Icons.menu),
  ];
  int index = 0;
  final screen = [
    const HomeScreen(),
    const SearchScreen(),
    const CalendarBookScreen(),
    const SettingScreen(),
  ];

  bool isMessageOpen = false;

  // get screen => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Title
      body: NestedScrollView(
          headerSliverBuilder: (context, innerIsScrolled) => [
                SliverAppBar(
                    pinned: true,
                    floating: false,
                    snap: false,
                    automaticallyImplyLeading: false, //tat nut quay lai
                    backgroundColor: Colors.white,
                    title: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("FLAW",
                                      style: TextStyle(
                                          fontSize: 24,
                                          shadows: [
                                            Shadow(
                                              blurRadius: 10.0,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              offset: Offset(5.0, 5.0),
                                            ),
                                          ],
                                          // fontFamily: "Josefin_Sans",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Image.asset("assets/images/entypo_flower.png",
                                      width: 24, height: 24),
                                  Text("ESS",
                                      style: TextStyle(
                                          fontSize: 24,
                                          shadows: [
                                            Shadow(
                                              blurRadius: 10.0,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              offset: Offset(5.0, 5.0),
                                            ),
                                          ],
                                          // fontFamily: "Josefin_Sans",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black))
                                ],
                              ),
                              // Profile picture
                              GestureDetector(
                                onTap: () {
                                  loadingScreen(
                                      context, () => ProfilesScreen());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 20,
                                    backgroundImage:
                                        AssetImage('assets/images/profile.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
          //body screen
          body: screen[index]),

      //NavigationBar
      bottomNavigationBar: CurvedNavigationBar(
        color: myPrimaryColor,
        buttonBackgroundColor: myPrimaryColor,
        height: 70,
        animationCurve: Curves.decelerate,
        backgroundColor: Colors.transparent,
        items: items,
        index: index,
        onTap: (index) => setState(() {
          this.index = index;
        }),
      ),
    );
  }
}

// // o tin nhan
