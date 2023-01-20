import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../components/youritems_item.dart';
import '../../../providers/cart-provider.dart';

class BuyItAgain extends StatelessWidget {
  const BuyItAgain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: FutureBuilder(
          future: context.read<CartProvider>().buyItAgain(),
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
                return Container(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        mainAxisExtent: 446),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return YourItems();
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
