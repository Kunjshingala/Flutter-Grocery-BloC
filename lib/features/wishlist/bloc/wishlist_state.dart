part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<ProductDataModal> wishListItems;

  WishlistSuccessState({required this.wishListItems});
}
