import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksr_store_app/bloc/CartCubit/cart_cubit.dart';
import 'package:ksr_store_app/res/constant.dart';
import 'package:ksr_store_app/views/cart/widgets/cartList.dart';
import 'package:ksr_store_app/views/cart/widgets/checkoutBottomAppBar.dart';
import 'package:ksr_store_app/views/cart/widgets/emptyCart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kSmallPM),
          child: FadeTransition(
            opacity: _myFadeAnimation,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(kSmallPM),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'My Cart',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    IconButton.filledTonal(
                        onPressed: () {
                          context.read<CartCubit>().returnToInitialeState();
                        },
                        icon: const Icon(Icons.remove_shopping_cart_outlined))
                  ],
                ),
              ),
              Expanded(
                child: BlocConsumer<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state is CartIsEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Cart is all ready empty'),
                        duration: Duration(milliseconds: 1000),
                      ));
                    }
                  },
                  builder: (context, state) {
                    if (state is CartInitial || state is CartIsEmpty) {
                      return const EmptyCart();
                    }
                    return const CartList();
                  },
                ),
              )
            ]),
          ),
        ),
      ),
      bottomNavigationBar: const CheckoutBottomAppBar(),
    );
  }
}
