import 'package:flutter/material.dart';
import 'package:my_app/representation/screens/ConvertSoundToText/ConvertSoundToText.dart';
import 'package:my_app/representation/screens/HomeScreen/HomeScreen.dart';
import 'package:my_app/representation/screens/OnboardingScreen/OnboardingScreen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  OnboardingScreen.routeName: (context) => const OnboardingScreen(),
  // MusicPlayerScreen.routeName: (context) => const MusicPlayerScreen(),
  ConvertSoundToText.routeName: (context) => const ConvertSoundToText(),
  // GuestAndRoomScreen.routeName: (context) => GuestAndRoomScreen(),
  // RoomsScreen.routeName: (context) => RoomsScreen(),
};
