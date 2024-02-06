part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

// Initial State
class HomeInitial extends HomeState {}

// Loading State
class HomeLoadingState extends HomeState {}

// Loaded State
class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModal> products;

  HomeLoadedSuccessState({required this.products});
}

// Error State
class HomeErrorState extends HomeState {}

// Action State of Navigate from Home to Wishlist page
class HomeNavigateToWishListPageActionState extends HomeActionState {}

// Action State of Navigate from Home to Cart page
class HomeNavigateToCartPageActionState extends HomeActionState {}

// Action State of add item to Wishlist
class HomeProductItemWishListedActionState extends HomeActionState {}

// Action State of add item to Cart list
class HomeProductItemCartActionState extends HomeActionState {}
