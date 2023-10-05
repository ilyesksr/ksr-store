import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksr_store_app/bloc/AppCubit/app_cubit.dart';
import 'package:ksr_store_app/views/cart/cart.dart';
import 'package:ksr_store_app/views/favorite/favorite.dart';
import 'package:ksr_store_app/views/home/home.dart';
import 'package:ksr_store_app/views/profile/profile.dart';

class MyPages extends StatelessWidget {
  const MyPages({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> myPage = [
      const HomePage(),
      const FavoritePage(),
      const CartPage(),
      const ProfilePage()
    ];
    return BlocConsumer<AppCubit, AppState>(
      builder: (_, state) => myPage[context.read<AppCubit>().pageIndex],
      listener: (context, state) {
        if (state is NotConnectedState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Connection lost!'),
            duration: Duration(milliseconds: 1500),
          ));
        } else if (state is ConnectedRestoredState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Connection has been restored.'),
              duration: Duration(milliseconds: 1500)));
        }
      },
    );
  }
}
