import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksr_store_app/Repository/repository.dart';

import '../../models/categoriesModel.dart';
import '../../models/product.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<CategoriesModel> allCategories = [];
  List<Products> myProducts = [];

  HomeCubit() : super(LoadingState());
  void loadData() async {
    emit(LoadingState());
    try {
      allCategories = await Repository.getAllCategories();
      myProducts = await Repository.getAllProducts();
      myProducts.shuffle();
      emit(LoadedState());
    } catch (_) {
      emit(ErrorState());
    }
  }

  Future<void> getProductsOfSpecificCategory({required categoryName}) async {
    myProducts = await Repository.getProductsOfSpecificCategory(categoryName);
    myProducts.shuffle();
  }

  void changeFiltterValue(
      {required bool isFilttering,
      required int id,
      required String categoryName}) async {
    emit(LoadingState());
    for (var element in allCategories) {
      element.isSelected = false;
    }
    allCategories.firstWhere((element) => element.id == id).isSelected =
        isFilttering;
    if (isFilttering) {
      try {
        await getProductsOfSpecificCategory(
            categoryName: categoryName.toLowerCase());

        emit(LoadedState());
      } catch (_) {
        emit(ErrorState());
      }
    } else {
      myProducts = await Repository.getAllProducts();
      myProducts.shuffle();
      emit(LoadedState());
    }
  }
}
