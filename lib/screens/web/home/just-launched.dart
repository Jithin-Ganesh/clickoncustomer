import 'package:clickoncustomer/components/web/home-product-box.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';

class JustLaunchedList extends StatelessWidget {
  const JustLaunchedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 306,
      child: ListView.builder(itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: HomeProductBox(
            height: 306,
            width: 297,
          image: "assets/images/dummy/image-iphone.png",
        ),
      ),scrollDirection: Axis.horizontal,padding: EdgeInsets.symmetric(horizontal: 15),itemCount: 5,),
    );
  }
}
