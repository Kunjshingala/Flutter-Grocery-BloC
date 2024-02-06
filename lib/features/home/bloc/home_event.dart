part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

// add item to Wishlist Event
class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModal clickedProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}

// add item to Cart list Event
class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModal clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

// Navigate from Home to Wishlist page Event
class HomeWishlistButtonNavigateEvent extends HomeEvent {}

// Navigate from Home to Cart page Event
class HomeCartButtonNavigateEvent extends HomeEvent {}
