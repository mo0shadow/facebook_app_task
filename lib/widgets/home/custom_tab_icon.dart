import 'package:flutter/material.dart';

class CustomImageIcon extends StatelessWidget {
  final String imageIcon;
  final double? size;
  final Color? color;
  const CustomImageIcon(
      {super.key, required this.imageIcon, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      size: size,
      color: color,
      AssetImage(imageIcon),
    );
  }
}
