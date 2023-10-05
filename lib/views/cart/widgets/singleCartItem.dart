import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ksr_store_app/bloc/CartCubit/cart_cubit.dart';
import 'package:ksr_store_app/models/product.dart';
import 'package:ksr_store_app/res/constant.dart';

import '../../../res/colors.dart';

class SingleCartItem extends StatelessWidget {
  final Products myProduct;
  const SingleCartItem(this.myProduct, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Checkbox.adaptive(
                value: myProduct.isSelected,
                shape: const CircleBorder(),
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<CartCubit>()
                        .cahngeCheckOutState(myProduct.id, value);
                  }
                },
              );
            },
          ),
          Container(
              padding: const EdgeInsets.all(kTinyPM),
              height: 100,
              width: 100,
              child: Image.network(myProduct.image)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(kTinyPM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    myProduct.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          myProduct.category[0].toUpperCase() +
                              myProduct.category.substring(1),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Text(
                        '\$${myProduct.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: cLightPrimaryColor,
                                fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: kTinyPM),
                      IconButton.outlined(
                          onPressed: () {
                            context
                                .read<CartCubit>()
                                .decreaseProductCartOccur(myProduct.id);
                          },
                          icon: const Icon(FontAwesomeIcons.minus)),
                      const SizedBox(width: kTinyPM),
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return Text(
                            '${myProduct.cartOccur}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.w700),
                          );
                        },
                      ),
                      const SizedBox(width: kTinyPM),
                      IconButton.outlined(
                          onPressed: () {
                            context
                                .read<CartCubit>()
                                .increaseProductCartOccur(myProduct.id);
                          },
                          icon: const Icon(FontAwesomeIcons.plus)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
