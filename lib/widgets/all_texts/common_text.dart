import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  const CommonText(
      {Key? key,
      required this.name,
      this.fontSize = 15,
      this.maxLines = 1,
      this.fontWeight = FontWeight.normal})
      : super(key: key);
  final String name;
  final double fontSize;
  final int maxLines;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, overflow: TextOverflow.ellipsis),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}
