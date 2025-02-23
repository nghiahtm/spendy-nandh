import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  const AppImage({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(img);
  }
}
