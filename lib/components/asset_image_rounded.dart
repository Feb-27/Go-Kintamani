import 'package:flutter/material.dart';

class AssetImageRounded extends StatelessWidget {
  final String imagePath;

  const AssetImageRounded({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          imagePath,
          width: 20,
          height: 20,
        ));
  }
}
