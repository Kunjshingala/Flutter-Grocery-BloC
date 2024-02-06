import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/data/carts_items.dart';
import 'package:bloc_example/data/grocery_data.dart';
import 'package:bloc_example/data/wishlist_items.dart';
import 'package:meta/meta.dart';

import '../models/home_product_data_modal.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    // On Events do ====(--
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);

    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  // --)====these Methods

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(
      HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModal(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl'],
              ),
            )
            .toList(growable: true),
      ),
    );
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    wishListItems.add(event.clickedProduct);

    emit(
      HomeProductItemWishListedActionState(),
    );
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(
      HomeNavigateToWishListPageActionState(),
    );
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);
    emit(
      HomeProductItemCartActionState(),
    );
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(
      HomeNavigateToCartPageActionState(),
    );
  }
}
