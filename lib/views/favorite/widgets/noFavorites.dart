import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoFavorites extends StatelessWidget {
  const NoFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/animations/noFavorites.json'),
        Text(
          'No favorite products yet!',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
