import 'package:flutter/material.dart';

import '../../MusicPlayerScreen/MusicPlayerScreen.dart';

class Album_Music extends StatefulWidget {
  const Album_Music({Key? key}) : super(key: key);

  _Album_MusicState createState() => _Album_MusicState();
}

class _Album_MusicState extends State<Album_Music>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isModalVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 800,
          color: Colors.white,
          child: const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Modal 1'),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      _showNewModal(context); // Hiển thị modal mới khi modal hiện tại bị ẩn
    });
  }

  void _showNewModal(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 50,
            color: Colors.yellow,
            child: Center(
              child: Text('New Modal'),
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Open Modal'),
          onPressed: () {
            
               
          },
        ),
      ),
    );
  }
}
