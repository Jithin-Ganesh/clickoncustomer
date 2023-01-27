import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../components/youritems_item.dart';
import '../../../models/cart.dart';
import '../../../providers/cart-provider.dart';

class SaveLater extends StatelessWidget {
  const SaveLater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: FutureBuilder(
          future: context.read<CartProvider>().saveLater(),
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
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        mainAxisExtent: 446),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return YourItems(product: items[index].productModel,);
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
