import 'package:flutter/material.dart';

import '../res/colors.dart';

class CustomPrice extends StatelessWidget {
  final double number;
  const CustomPrice(this.number, {super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: '\$',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: cPrimaryColor)),
      TextSpan(
          text: '${number.toInt()}.',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: cPrimaryColor)),
      TextSpan(
          text: '${number - number.toInt()}'.split('.')[1].length > 2
              ? '${number - number.toInt()}'.split('.')[1].substring(0, 2)
              : '${number - number.toInt()}'.split('.')[1],
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: cPrimaryColor))
    ]));
  }
}
