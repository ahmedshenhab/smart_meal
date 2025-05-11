import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/local/sql/sqldb.dart';

part 'shopping_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  ShoppingCubit(this.db) : super(ShoppingInitial());

  final DatabaseHelper db;
  static ShoppingCubit get(context) => BlocProvider.of(context);
  List<CartItem> carts = [];

  getAllCarts() async {
    carts = await db.getAllIngredients();

    log(carts.length.toString());

    emit(ShoppingGetAllCartsState());
  }

  deleteAllCarts() async {
    await db.deleteAll();
    carts.clear();

    emit(ShoppingGetAllCartsState());
  }

  deleteRow(int id) async {
    await db.deleteRow(id);
    carts.removeWhere((element) => element.id == id);

    emit(ShoppingGetAllCartsState());
  }
}
