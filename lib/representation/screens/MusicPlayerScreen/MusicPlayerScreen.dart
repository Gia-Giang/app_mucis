import "package:flutter/material.dart";
import "package:just_audio/just_audio.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:my_app/core/constants/size_containts.dart";

import "../../../core/constants/color_containts.dart";
import "../../../core/constants/demision_containts.dart";
import "../../widgets/ItemImage.dart";

class MusicPlayerScreen extends StatefulWidget {
  static String routeName = '/music_player_screen';

  const MusicPlayerScreen({super.key});

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  Duration? audioDuration;
  Duration? currentPosition;
  bool isPlay = false;
  double _progress = 0.0;
  double maxSliderValue = 0.0;
  String audioPath = "assets/music/CoChiDauMaBuon-PhatHuyT4.mp3";
  final player = AudioPlayer();


  String _formatDuration(Duration duration) {
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void initState() {
    _initializeAudio();
    super.initState();
  }

  void _initializeAudio() async {
    await player.setAsset(audioPath);
    await player.setAudioSource(AudioSource.asset(audioPath));

    setState(() {
      audioDuration = player.duration;
      maxSliderValue = double.parse(audioDuration!.inSeconds.toString());
    });

    player.positionStream.listen((position) {
      String time = position.toString();
      List<String> parts = time.split(':');
      double parsedValue = double.parse(parts[2]);

      setState(() {
        currentPosition = position;
        // _progress = parsedValue.truncateToDouble();
      });
    });
  }

  void _onSliderChanged(double value) {
    setState(() {
      _progress = value.truncateToDouble();
      Duration seekPosition = audioDuration! * (value / maxSliderValue);

      player.seek(seekPosition);
    });
  }

  void toggleMusic() async {
    setState(() {
      isPlay = !isPlay;
    });
    if (isPlay) {
      await player.play();
    } else {
      await player.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentPositionString =
        currentPosition != null ? _formatDuration(currentPosition!) : '--:--';
    String audioDurationString =
        audioDuration != null ? _formatDuration(audioDuration!) : '--:--';
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 17,
                          color: Color.fromRGBO(193, 6, 51, 0.12))
                    ],
                    color: ColorPalette.pinkLight,
                    borderRadius:
                        BorderRadius.all(Radius.circular(kLargePadding))),
                height: 200,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: kLargePadding),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                size: kItemPadding,
                                color: ColorPalette.lightGray,
                              )),
                          const Text(
                            "Back",
                            style: TextStyle(
                              fontSize: FontSize.klarge,
                              color: ColorPalette.lightGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.only(left: kmega),
                      child: const Row(children: [
                        Text(
                          "Now",
                          style: TextStyle(
                              color: ColorPalette.lightGray,
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize.khuge),
                        ),
                        Text(
                          " Playing",
                          style: TextStyle(
                            fontSize: FontSize.khuge,
                            color: ColorPalette.lightGray,
                          ),
                        )
                      ]),
                    )),
                  ],
                )),
            Container(
              width: 244,
              height: 244,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.4),
                      Color.fromRGBO(255, 255, 255, 0.1),
                    ],
                    stops: [0.1073, 0.9118],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: GradientRotation(142.15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(189, 0, 45, 0.19),
                      blurRadius: 53,
                      spreadRadius: 12,
                      offset: Offset(1, 23),
                    )
                  ]),
              child: Center(
                child: Text("hello"),
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
                        alignment: Alignment.centerLeft,
                        child: Text((currentPositionString).toString()),
                      )),
                      Expanded(
                          child: Align(
                        // ignore: sort_child_properties_last
                        child: Text(audioDurationString.toString()),
                        alignment: Alignment.centerRight,
                      )),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: kDefaultRadius, right: kDefaultRadius),
                  child: Slider(
                    thumbColor: ColorPalette.redAccentColor,
                    activeColor: ColorPalette.redColor,
                    inactiveColor: ColorPalette.lightGray,
                    value: _progress,
                    min: 0.0,
                    max: maxSliderValue,
                    onChanged: _onSliderChanged,
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: kBiggerPadding, right: kBiggerPadding),
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
            )
          ],
        ),
      ),
    );
  }
}
