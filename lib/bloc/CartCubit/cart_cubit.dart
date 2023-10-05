import 'package:bloc/bloc.dart';
import 'package:ksr_store_app/models/product.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<Products> myCart = [];
  CartCubit() : super(CartInitial());
  bool areAllSelected = false;
  double checkoutPrice = 0.0;
  void addProductToCart(Products myProduct) {
    if (myCart.contains(myProduct)) {
      myCart.firstWhere((element) => element.id == myProduct.id).cartOccur++;
    } else {
      myCart.add(myProduct);
    }

    emit(CartHasItem());
  }

  void increaseProductCartOccur(int id) {
    myCart.firstWhere((element) => element.id == id).cartOccur++;
    emit(CartHasItem());
    getFinalPrice();
  }

  void decreaseProductCartOccur(int id) {
    if (myCart.firstWhere((element) => element.id == id).cartOccur > 1) {
      myCart.firstWhere((element) => element.id == id).cartOccur--;
      emit(CartHasItem());
      getFinalPrice();
    }
  }

  void cahngeCheckOutState(int id, bool value) {
    myCart.firstWhere((element) => element.id == id).isSelected = value;
    getFinalPrice();
    if (myCart.where((element) => element.isSelected).length == myCart.length) {
      areAllSelected = true;
    } else {
      areAllSelected = false;
    }
    emit(CheckoutItem());
  }

  void changeCheckAllItemsState() {
    for (var element in myCart) {
      element.isSelected = !areAllSelected;
    }
    areAllSelected = !areAllSelected;
    getFinalPrice();
    emit(ChangeAllItemsCheck());
  }

  void getFinalPrice() {
    List<Products> selectedProducts =
        myCart.where((element) => element.isSelected).toList();
    if (selectedProducts.isNotEmpty) {
      checkoutPrice = selectedProducts
          .map((e) => e.price * e.cartOccur)
          .reduce((value, element) => value + element);
    } else {
      checkoutPrice = 0.0;
    }
    emit(ChangeCheckPrice());
  }

  void returnToInitialeState() {
    if (myCart.isEmpty) {
      emit(CartIsEmpty());
    } else {
      myCart.clear();
      areAllSelected = false;
      checkoutPrice = 0.0;
      emit(CartInitial());
    }
  }
}
