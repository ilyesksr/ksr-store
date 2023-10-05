import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ksr_store_app/models/product.dart';
import 'package:ksr_store_app/res/constant.dart';
import 'package:ksr_store_app/components/customPrice.dart';

import '../../../bloc/CartCubit/cart_cubit.dart';

class ProductInfo extends StatelessWidget {
  Products? myProduct;
  ProductInfo({super.key, this.myProduct});

  @override
  Widget build(BuildContext context) {
    myProduct = ModalRoute.of(context)?.settings.arguments as Products?;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          imagePart(context),
          Padding(
            padding: const EdgeInsets.all(kSmallPM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPrice(myProduct!.price),
                Text(
                  myProduct!.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                categoryRatingBanner(context),
                const SizedBox(height: kTinyPM),
                Text(
                  myProduct!.description,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          child: FittedBox(
        child: ElevatedButton.icon(
            onPressed: () {
              context.read<CartCubit>().addProductToCart(myProduct!);
            },
            icon: const Icon(FontAwesomeIcons.cartPlus),
            label: const Text('Add to cart')),
      )),
    );
  }

  Stack imagePart(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          height: MediaQuery.of(context).size.height * .4,
          child: Hero(
              tag: '$kProductsTag${myProduct?.id}',
              child: Image.network(myProduct!.image)),
        ),
        Positioned(
          bottom: kBigPM,
          right: kBigPM,
          child: Container(
            padding: const EdgeInsets.all(kSmallPM * .6),
            decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(Radius.circular(kBorderRadius))),
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              const Icon(
                FontAwesomeIcons.fire,
                color: Colors.deepOrange,
              ),
              const SizedBox(
                width: kSmallPM * .4,
              ),
              Text(
                '${myProduct?.rating.count}',
                style: Theme.of(context).textTheme.labelLarge,
              )
            ]),
          ),
        )
      ],
    );
  }

  Container categoryRatingBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSmallPM),
      decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(kBorderRadius)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${myProduct?.category}'[0].toUpperCase() +
                '${myProduct?.category}'.substring(1),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(' - ', style: Theme.of(context).textTheme.titleMedium),
          Text(
            '${myProduct?.rating.rate}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(width: kTinyPM),
          Icon(
            myProduct!.rating.rate >= 3
                ? FontAwesomeIcons.solidStar
                : FontAwesomeIcons.starHalfStroke,
            color: Colors.yellow.shade700,
          )
        ],
      ),
    );
  }
}
