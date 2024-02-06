import 'package:bloc_example/features/home/models/home_product_data_modal.dart';
import 'package:bloc_example/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishListTileWidget extends StatelessWidget {
  final ProductDataModal productDataModal;
  final WishlistBloc wishlistBloc;

  const WishListTileWidget(
      {super.key, required this.productDataModal, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModal.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            productDataModal.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataModal.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${productDataModal.price}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      wishlistBloc.add(ItemRemoveFromWishListEvent(
                          productDataModal: productDataModal));
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.cart),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
