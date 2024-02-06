import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/data/carts_items.dart';
import 'package:meta/meta.dart';

import '../../home/models/home_product_data_modal.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<ItemRemoveFromCartEvent>(itemRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> itemRemoveFromCartEvent(
      ItemRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModal);
    emit(CartSuccessState(cartItems: cartItems));
  }
}
