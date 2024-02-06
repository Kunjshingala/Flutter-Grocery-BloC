import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/wishlist_items.dart';
import '../../home/models/home_product_data_modal.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<ItemRemoveFromWishListEvent>(itemRemoveFromWishListEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishListItems: wishListItems));
  }

  FutureOr<void> itemRemoveFromWishListEvent(
      ItemRemoveFromWishListEvent event, Emitter<WishlistState> emit) {
    wishListItems.remove(event.productDataModal);
    emit(WishlistSuccessState(wishListItems: wishListItems));
  }
}
