import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    super.key,
    required this.avatarUrl,
    this.radius = 20
  });
  final String avatarUrl;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(avatarUrl),
    );
  }
}
