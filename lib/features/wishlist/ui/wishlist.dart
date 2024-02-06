import 'package:bloc_example/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wishlist_bloc.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wishlistBloc.add(WishListInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                itemCount: successState.wishListItems.length,
                itemBuilder: (context, index) {
                  return WishListTileWidget(
                    productDataModal: successState.wishListItems[index],
                    wishlistBloc: wishlistBloc,
                  );
                },
              );
          }
          return Container();
        },
      ),
    );
  }
}
