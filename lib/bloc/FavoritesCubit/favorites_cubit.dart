import 'package:bloc/bloc.dart';
import 'package:ksr_store_app/models/product.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final List<Products> myFavoriteProducts = [];
  FavoritesCubit() : super(FavoritesInitial());
  void addFavoriteProduct(Products myProduct) {
    myFavoriteProducts.add(myProduct);
    emit(HasFavorites());
  }

  void removeFavriteProduct(int id) {
    myFavoriteProducts.removeWhere((element) => element.id == id);
    if (myFavoriteProducts.isNotEmpty) {
      emit(HasFavorites());
    } else {
      emit(FavoritesInitial());
    }
  }
}
