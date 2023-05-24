import 'package:flutter/material.dart';
import 'package:my_app/representation/screens/HomeScreen/HomeScreen.dart';
import 'package:my_app/representation/screens/OnboardingScreen/OnboardingScreen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  // HotelsScreen.routeName: (context) => HotelsScreen(),
  // SelectDateScreen.routeName: (context) => SelectDateScreen(),
  // GuestAndRoomScreen.routeName: (context) => GuestAndRoomScreen(),
  // RoomsScreen.routeName: (context) => RoomsScreen(),
};