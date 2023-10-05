import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ksr_store_app/bloc/CartCubit/cart_cubit.dart';
import 'package:ksr_store_app/bloc/FavoritesCubit/favorites_cubit.dart';
import 'package:ksr_store_app/res/colors.dart';
import 'package:ksr_store_app/res/constant.dart';
import 'package:ksr_store_app/views/home/widgets/productsInfo.dart';

import '../../../models/product.dart';

class SingleProducts extends StatelessWidget {
  final Products myProduct;
  const SingleProducts(this.myProduct, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            final myCartCubit = context.read<CartCubit>();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                    value: myCartCubit, child: ProductInfo()),
                settings: RouteSettings(arguments: myProduct),
              ),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AspectRatio(
                      aspectRatio: 4 / 2.5,
                      child: Hero(
                          tag: '$kProductsTag${myProduct.id}',
                          child: Image.network(myProduct.image))),
                  Text(
                    myProduct.title,
                    style: Theme.of(context).textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${myProduct.price}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: cLightPrimaryColor,
                                fontWeight: FontWeight.w600),
                      ),
                      const Expanded(child: SizedBox()),
                      ElevatedButton.icon(
                          onPressed: () {
                            context
                                .read<CartCubit>()
                                .addProductToCart(myProduct);
                          },
                          icon: const Icon(FontAwesomeIcons.cartPlus),
                          label: const Text('Add'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        favoriteButton(context),
        ratingBanner(context)
      ],
    );
  }

  Positioned ratingBanner(BuildContext context) {
    return Positioned(
      top: 5,
      left: kMediumPM,
      child: Container(
          height: kMediumPM * 2,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(kSmallPM * .3),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [cPrimaryColor, Colors.grey])),
          child: Text(
            '${myProduct.rating.rate}',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
          )),
    );
  }

  Positioned favoriteButton(BuildContext context) {
    return Positioned(
        top: kSmallPM,
        right: kSmallPM,
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return IconButton(
              iconSize: kBigIcon,
              onPressed: () {
                !(context
                        .read<FavoritesCubit>()
                        .myFavoriteProducts
                        .contains(myProduct))
                    ? context
                        .read<FavoritesCubit>()
                        .addFavoriteProduct(myProduct)
                    : context
                        .read<FavoritesCubit>()
                        .removeFavriteProduct(myProduct.id);
              },
              icon: !(context
                      .read<FavoritesCubit>()
                      .myFavoriteProducts
                      .contains(myProduct))
                  ? const Icon(
                      Icons.favorite_border,
                    )
                  : const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
            );
          },
        ));
  }
}
