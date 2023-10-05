import 'package:flutter/material.dart';
import 'package:ksr_store_app/models/product.dart';
import 'package:ksr_store_app/res/constant.dart';
import 'package:ksr_store_app/views/home/widgets/singleProducts.dart';

class SingleFavorite extends StatelessWidget {
  final Products myFavoriteProduct;
  const SingleFavorite(this.myFavoriteProduct, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleProducts(myFavoriteProduct);
  }

  ListTile oldItem(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(kTinyPM),
        child: Hero(
            tag: '$kProductsTag${myFavoriteProduct.id}',
            child: Image.network(myFavoriteProduct.image)),
      ),
      title: Text(myFavoriteProduct.title),
      trailing: Text(myFavoriteProduct.category),
      onTap: () {
        Navigator.of(context)
            .pushNamed(kProductsInfoRoute, arguments: myFavoriteProduct);
      },
    );
  }
}
