import 'package:flutter/material.dart';
import 'package:my_app/core/constants/color_containts.dart';
import 'package:my_app/core/constants/demision_containts.dart';

class AllMusic extends StatefulWidget {
  final List<Map<String, dynamic>> dataMusic;
  const AllMusic({Key? key, required this.dataMusic}) : super(key: key);
  @override
  _AllMusicState createState() => _AllMusicState(dataMusic: dataMusic);
}


class _AllMusicState extends State<AllMusic> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> dataMusic;
  _AllMusicState({required this.dataMusic});

  void handelSelect(int index, String url) {
    setState(() {
      selectedIndex = index;
    });
    Navigator.pushNamed(context, "/music_player_screen", arguments: url);
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: ListView.builder(
          itemCount: dataMusic.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? ColorPalette.redAccentColor100
                    : null,
                borderRadius: BorderRadius.circular(kDefaultRadius),
              ),
              child: ClipRRect(
                child: ListTile(
                  onTap: () => handelSelect(index, dataMusic[index]['url']),
                  title: Text(dataMusic[index]['music_name']),
                  subtitle: Text(dataMusic[index]['singer_name']),
                  trailing: const Icon(Icons.more_vert),
                ),
              ),
            );
          }),
    ));
  }
}
