import 'package:clickoncustomer/components/youritems_item.dart';
import 'package:clickoncustomer/models/cart-products.dart';
import 'package:clickoncustomer/providers/cart-provider.dart';
import 'package:clickoncustomer/screens/web/cart/save-for-later.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/cart.dart';
import '../../../models/product-model.dart';
import '../../../utils/constants/fontStyles/kanit.dart';
import 'buy-it-again.dart';

class MoveFromWishList extends StatelessWidget {
  const MoveFromWishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: FutureBuilder(
          future: context.read<CartProvider>().getWishlist(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.80,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: CupertinoActivityIndicator(
                    animating: true,
                    radius: 12,
                  ),
                ),
              );
            } else {
              if (snapshot.hasData) {
                final items = snapshot.data as List<GetWishList>;
                return Container(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        mainAxisExtent: 446),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return YourItems(
                        product: items[index].productModel,
                      );
                    },
                  ),
                );
              }
            }
            return Text(
              snapshot.error.toString(),
            );
          }),
    );
  }
}

class CartTabBar extends StatelessWidget {
  const CartTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.209),
      child: Container(
        height: 1000,
        child: ContainedTabBarView(
          tabs:  [
            const Text('Saved for later'),
            Consumer<CartProvider>(
                builder: (context, value, child) =>
                    Visibility(
                        visible: value.buy.isNotEmpty,
                        child: const Text('Buy It Again'))),
            const Text('Move from wishlist'),
          ],
          tabBarProperties: TabBarProperties(
            height: 32.0,
            isScrollable: true,
            indicatorColor: primaryColor,
            indicatorWeight: 3.0,
            labelPadding: const EdgeInsets.only(right: 37),
            indicatorPadding: const EdgeInsets.only(
              top: 15,
              right: 37,
            ),
            labelColor: Colors.black,
            labelStyle: regular.copyWith(color: primaryColor),
            unselectedLabelColor: Colors.black,
          ),
          views: [
            const SaveLater(),
            Consumer<CartProvider>(
                builder: (context, value, child) =>
                    Visibility(
                        visible: value.buy.isNotEmpty,
                        child: const BuyItAgain())),
            const MoveFromWishList(),
          ],
          onChange: (index) => print(index),
        ),
      ),
    );
  }
}
