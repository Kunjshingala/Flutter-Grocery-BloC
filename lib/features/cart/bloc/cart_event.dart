part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class ItemRemoveFromCartEvent extends CartEvent {
  final ProductDataModal productDataModal;

  ItemRemoveFromCartEvent({required this.productDataModal});
}
