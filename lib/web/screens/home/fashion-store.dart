import 'package:clickoncustomer/web/components/product-card.dart';
import 'package:flutter/cupertino.dart';

class FashionStore extends StatelessWidget {
  FashionStore({Key? key}) : super(key: key);
  final List<Widget> rowList = [
    ProductCard(),
    ProductCard(),
    ProductCard(),
    ProductCard(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 327,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...rowList,
          Image.asset("assets/images/dummy/image-1.png",width: 610,height: 325,)
        ],
      ),
    );
  }
}
