import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/gen/colors.gen.dart';
import 'package:flutter_clean_architecture/src/modules/common_widgets/avatar_circle.dart';

class AvatarCircleEdit extends StatelessWidget {
  const AvatarCircleEdit(
      {super.key, required this.linkAvatar, required this.size});
  final String linkAvatar;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: const Alignment(1, 1),
        children: [
          AvatarCirle(linkAvatar: linkAvatar, size: size),
          Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                shape: BoxShape.circle,
                color: ColorName.crimsonRed,
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 20,
              ))
        ],
      ),
    );
  }
}
