import "package:flutter/material.dart";
import "package:my_app/representation/screens/HomeScreen/HomeScreen.dart";
import "package:my_app/representation/screens/OnboardingScreen/OnboardingScreen.dart";
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:my_app/router.dart";

import "core/constants/color_containts.dart";
import "core/constants/demision_containts.dart";
import "core/helpers/asset_hepler.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static String routeName = '/';
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: '/music_player_screen',
      home: Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(
            () => _currentIndex = i,
          ),
          selectedItemColor: ColorPalette.redColor,
          unselectedItemColor: ColorPalette.redColor.withOpacity(0.2),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.house,
                size: kDefaultPadding,
              ),
              title: Text("Home"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.solidHeart,
                size: kDefaultPadding,
              ),
              title: Text("Likes"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.briefcase,
                size: kDefaultPadding,
              ),
              title: const Text("Booking"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                FontAwesomeIcons.solidUser,
                size: kDefaultPadding,
              ),
              title: Text("User"),
            ),
          ],
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            const HomeScreen(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
