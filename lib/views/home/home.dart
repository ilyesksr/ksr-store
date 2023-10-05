import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ksr_store_app/bloc/HomeCubit/home_cubit.dart';
import 'package:ksr_store_app/res/constant.dart';
import 'package:ksr_store_app/views/home/widgets/filter.dart';
import 'package:ksr_store_app/views/home/widgets/myHomeDrawer.dart';
import 'package:lottie/lottie.dart';

import '../../bloc/CartCubit/cart_cubit.dart';
import 'widgets/allCategories.dart';
import 'widgets/productsList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      body: CustomScrollView(
        slivers: [
          myAppBar(context),
          body(),
        ],
      ),
    );
  }

  Widget body() {
    return SliverToBoxAdapter(
      child: FadeTransition(
        opacity: _myFadeAnimation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AllCategories(),
            BlocListener<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartHasItem) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Item hase been add to cart'),
                    duration: Duration(milliseconds: 700),
                  ));
                }
              },
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Center(
                        child: Lottie.asset('assets/animations/loading.json'));
                  }
                  return const ProductsList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myAppBar(BuildContext context) {
    return SliverAppBar(
        expandedHeight: MediaQuery.of(context).size.height * .1,
        leading: IconButton(
            onPressed: () {
              _scafoldKey.currentState?.openDrawer();
            },
            icon: const Icon(FontAwesomeIcons.barsStaggered)),
        title: Text(
          'Ksr\nStore',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(FontAwesomeIcons.searchengin))
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            alignment: Alignment.bottomCenter,
            child: const Column(mainAxisSize: MainAxisSize.min, children: [
              FiltterProducts(),
              // SizedBox(height: kSmallPM),
            ]),
          ),
        ));
  }
}
