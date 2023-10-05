import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksr_store_app/res/constant.dart';
import 'package:ksr_store_app/components/customPrice.dart';

import '../../../bloc/CartCubit/cart_cubit.dart';

class CheckoutBottomAppBar extends StatelessWidget {
  const CheckoutBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(child: BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Row(children: [
                Checkbox.adaptive(
                  value: context.read<CartCubit>().areAllSelected,
                  shape: const CircleBorder(),
                  onChanged: (value) {
                    if (context.read<CartCubit>().myCart.isNotEmpty) {
                      context.read<CartCubit>().changeCheckAllItemsState();
                    }
                  },
                ),
                const Text('All')
              ]),
            ),
            CustomPrice(context.read<CartCubit>().checkoutPrice),
            const SizedBox(width: kSmallPM),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                  'CheckOut (${context.read<CartCubit>().myCart.where((element) => element.isSelected).length})'),
            )
          ],
        );
      },
    ));
  }
}
