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
        child: Container(
          height: 306,
          width: 297,
          child: ImgProvider(  url: "assets/images/dummy/image-iphone.png",boxFit: BoxFit.contain, height: 306,
            width: 297,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),scrollDirection: Axis.horizontal,padding: EdgeInsets.symmetric(horizontal: 15),itemCount: 5,),
    );
  }
}
