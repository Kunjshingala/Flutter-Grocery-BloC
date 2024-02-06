part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent {}

class ItemRemoveFromWishListEvent extends WishlistEvent {
  final ProductDataModal productDataModal;

  ItemRemoveFromWishListEvent({required this.productDataModal});
}
