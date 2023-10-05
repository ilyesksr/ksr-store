import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksr_store_app/bloc/FavoritesCubit/favorites_cubit.dart';
import 'package:ksr_store_app/res/constant.dart';
import 'package:ksr_store_app/views/favorite/widgets/favoritesList.dart';
import 'package:ksr_store_app/views/favorite/widgets/noFavorites.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _myFadeAnimation;
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _myFadeAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(kSmallPM),
        child: FadeTransition(
          opacity: _myFadeAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(kSmallPM),
                child: Text(
                  'Favorites products',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              BlocBuilder<FavoritesCubit, FavoritesState>(
                builder: (context, state) {
                  if (state is FavoritesInitial) {
                    return const NoFavorites();
                  }
                  return const FavoriteList();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
