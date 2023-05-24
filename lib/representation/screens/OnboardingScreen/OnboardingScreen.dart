import 'package:flutter/material.dart';

import '../../../core/helpers/asset_hepler.dart';
import '../../../main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static String routeName = '/onboarding_screen';
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
void initState(){
  super.initState;
  routeToMain();
}

void routeToMain() async{
  await Future.delayed(Duration(milliseconds: 1000)); 
  Navigator.of(context).pushNamed(MyApp.routeName);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(left: 100),
            child: Center(
              child: Image.asset(
                AssetHelper.logo,
                fit: BoxFit.contain,
              ),
            )));
  }
}
