import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/color_containts.dart';
import '../../../core/constants/demision_containts.dart';
import '../../widgets/ItemImage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int selectedIndex = 0;
  List<String> options = ['All', 'Album', 'Playlist', 'Artist', 'Explpore'];
  final TextEditingController _textEditingController = TextEditingController();
  // ignore: unused_field
  late Timer _timer;
  double _progress = 0.0;
  // ignore: prefer_final_fields, unused_field
  Duration _elapsedTime = Duration.zero;
  bool isPlay = true;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void handelSubmit() {}

  void toggleMusic() {
    setState(() {
      isPlay = !isPlay;
    });
  }

  void _onSliderChanged(double value) {
    setState(() {
      _progress = value.truncateToDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          height: 35,
          margin: const EdgeInsets.only(
              top: kDefaultPadding,
              left: kBiggerPadding,
              right: kBiggerPadding),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorPalette.lightGray,
                    hintText: 'Enter text',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(kDefaultRadius),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      onPressed: handelSubmit,
                      icon: const Icon(
                        Icons.search,
                        size: kBottomBarIconSize,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 1,
                      horizontal: kBottomBarIconSize,
                    ),
                  ),
                ),
              ),
              const Icon(
                FontAwesomeIcons.ellipsisVertical,
                size: kItemPadding,
              )
            ],
          ),
        ),
        Container(
            height: 37,
            margin: const EdgeInsets.only(
                top: kMediumPadding,
                bottom: kMediumPadding,
                left: kBiggerPadding,
                right: kBiggerPadding),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: kMediumPadding),
                      decoration: BoxDecoration(
                          color: index == selectedIndex
                              ? Colors.red
                              : ColorPalette.lightGray,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            options[index],
                            style: TextStyle(
                              color: index == selectedIndex
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          )),
                    ),
                  );
                })),
        Expanded(
            child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: [
            Container(
              margin: const EdgeInsets.only(left: 40, right: 40),
              child: Row(
                children: [
                  const Expanded(
                      child: Align(
                    alignment: Alignment.centerLeft,
                    child:
                        ItemImage(urlImage: "assets/images/ic_arrow_left.png"),
                  )),
                  GestureDetector(
                    onTap: toggleMusic,
                    child: Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(133, 0, 32, 0.14),
                              offset: Offset(2, 4),
                              blurRadius: 23,
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white),
                      width: 80,
                      height: 80,
                      child: isPlay
                          ? const ItemImage(
                              urlImage: "assets/images/ic_pause.png")
                          : const ItemImage(
                              urlImage: "assets/images/ic_play.png"),
                    ),
                  ),
                  const Expanded(
                      child: Align(
                    alignment: Alignment.centerRight,
                    child:
                        ItemImage(urlImage: "assets/images/ic_arrow_right.png"),
                  ))
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: kBiggerPadding, right: kBiggerPadding),
                  child: Row(
                    children: [
                      Expanded(
                          child: Align(
                        // ignore: sort_child_properties_last
                        child: Text(_progress.toString()),
                        alignment: Alignment.centerLeft,
                      )),
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: Text((100 - _progress).toString()),
                      ))
                    ],
                  ),
                ),
                Slider(
                  activeColor: ColorPalette.redColor,
                  inactiveColor: ColorPalette.lightGray,
                  value: _progress,
                  min: 0.0,
                  max: 100.0,
                  onChanged: _onSliderChanged,
                )
              ],
            ),
            Container(
              color: Colors.blue,
              child: const Center(
                child: Text('Page 3'),
              ),
            ),
            Container(
              color: Colors.blue,
              child: const Center(
                child: Text('Page 4'),
              ),
            ),
            Container(
              color: Colors.blue,
              child: const Center(
                child: Text('Page 5'),
              ),
            ),
          ],
        ))
      ],
    ));
  }
}
