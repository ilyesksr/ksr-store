part of 'product_crud_cubit.dart';

@immutable
sealed class ProductCrudState {}

final class ProductCrudInitial extends ProductCrudState {}

final class ProductCrudAdded extends ProductCrudState {}

final class ProductCrudUpdated extends ProductCrudState {}

final class ProductCrudDeleted extends ProductCrudState {}

final class ProductCrudError extends ProductCrudState {}
