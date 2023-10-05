part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartHasItem extends CartState {}

final class CheckoutItem extends CartState {}

final class ChangeAllItemsCheck extends CartState {}

final class ChangeCheckPrice extends CartState {}

final class CartIsEmpty extends CartState {}
