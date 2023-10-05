import 'package:bloc/bloc.dart';
import 'package:ksr_store_app/data/crud.dart';
import 'package:ksr_store_app/models/productCRUD.dart';
import 'package:meta/meta.dart';

part 'product_crud_state.dart';

class ProductCrudCubit extends Cubit<ProductCrudState> {
  ProductCrudCubit() : super(ProductCrudInitial());

  void addProduct(ProductCRUD productCRUD) async {
    try {
      await CRUD.addProduct(productCRUD);
      emit(ProductCrudAdded());
    } catch (_) {
      emit(ProductCrudError());
    }
  }
}
