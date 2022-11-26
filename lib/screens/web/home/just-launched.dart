import 'package:clickoncustomer/components/web/home-product-box.dart';
import 'package:clickoncustomer/models/category.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';

class JustLaunchedList extends StatelessWidget {
  final List<Categories> justLaunched;
  const JustLaunchedList({Key? key, required this.justLaunched}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 306,
      child: ListView.builder(itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: HomeProductBox(
            height: 306,
            width: MediaQuery.of(context).size.width * 0.154,
          image: justLaunched[index].image,
        ),
      ),scrollDirection: Axis.horizontal,padding: EdgeInsets.symmetric(horizontal: 15),itemCount: justLaunched.length,),
    );
  }
}
