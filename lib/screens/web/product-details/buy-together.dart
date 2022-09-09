import 'package:clickoncustomer/components/buyTogetherItem.dart';
import 'package:clickoncustomer/utils/constants/color.dart';


import 'package:flutter/material.dart';import '../../../utils/constants/fontstyles.dart';

class BuyTogether extends StatelessWidget {
  const BuyTogether({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 160.0),
      child: Container(
        height: 340,
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buy Together',
              style:
              medium.copyWith(color:mainTitleColor,fontSize: 24),
            ),
            Row(
              children: [
                BuyTogetherItem(image: "assets/images/dummy/image-baby-detail.png", description: 'Pampers Pure Protection Baby Diapers, Medium Size... ', price: 809.00),
                Icon(Icons.add,size: 40,),
                BuyTogetherItem(image: "assets/images/dummy/image-baby-detail.png", description: 'Pampers Pure Protection Baby Diapers, Medium Size... ', price: 809.00),
              ],
            )
          ],
        ),
      ),
    );
  }
}
