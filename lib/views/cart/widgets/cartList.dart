import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksr_store_app/bloc/CartCubit/cart_cubit.dart';
import 'package:ksr_store_app/views/cart/widgets/singleCartItem.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.read<CartCubit>().myCart.length,
      itemBuilder: (context, index) =>
          SingleCartItem(context.read<CartCubit>().myCart[index]),
    );
  }
}
