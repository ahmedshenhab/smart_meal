part of 'shopping_cubit.dart';

sealed class ShoppingState {
  const ShoppingState();
}

final class ShoppingInitial extends ShoppingState {}

class ShoppingGetAllCartsState extends ShoppingState {}
