import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import './small_text.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final Color iconColor;
  final IconData icon;

  const IconAndText(
      {super.key,
      required this.text,
      required this.iconColor,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(text: text),
      ],
    );
  }
}
