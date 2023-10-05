import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/FavoritesCubit/favorites_cubit.dart';
import 'singleFavoriteProduct.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: context.read<FavoritesCubit>().myFavoriteProducts.length,
        itemBuilder: (context, index) => SingleFavorite(
            context.read<FavoritesCubit>().myFavoriteProducts[index]),
      ),
    );
  }
}
