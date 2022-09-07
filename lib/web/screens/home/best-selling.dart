import 'package:clickoncustomer/web/components/product-card.dart';
import 'package:flutter/cupertino.dart';

class BestSelling extends StatelessWidget {
 BestSelling({Key? key}) : super(key: key);
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
          Image.asset("assets/images/dummy/image-4.png",height: 325,),
            ...rowList
        ],
      ),
    );
  }
}
