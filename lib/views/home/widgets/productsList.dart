import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksr_store_app/bloc/HomeCubit/home_cubit.dart';
import 'package:ksr_store_app/res/constant.dart';
import 'package:ksr_store_app/views/home/widgets/singleProducts.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(kSmallPM),
        itemCount: context.read<HomeCubit>().myProducts.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) =>
            SingleProducts(context.read<HomeCubit>().myProducts[index]),
      ),
    );
  }
}
