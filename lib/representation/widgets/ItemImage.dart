import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  final String urlImage;
  const ItemImage({required this.urlImage});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child:
            Image.asset(urlImage, height: 30.0, width: 30.0, fit: BoxFit.fill),
      ),
    );
  }
}
