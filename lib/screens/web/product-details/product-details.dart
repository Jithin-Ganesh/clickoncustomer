import 'package:clickoncustomer/components/web/rating-box.dart';
import 'package:clickoncustomer/screens/web/product-details/available-offers.dart';
import 'package:clickoncustomer/screens/web/product-details/buy-together.dart';
import 'package:clickoncustomer/screens/web/product-details/count-box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/fontstyles.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 160.0),
      child: Container(
        height: 620,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 378,
                  child: Text(
                    'Pampers Pure Protection Baby Diapers Large Size',
                    maxLines: 2,
                    style: medium.copyWith(fontSize: 24),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                        height: 18,
                        width: 17,
                        child: Icon(Icons.share_outlined)),
                    SizedBox(
                      width: 21,
                    ),
                    SizedBox(
                        height: 18,
                        width: 17,
                        child: Icon(Icons.favorite_border_outlined))
                  ],
                )
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                RatingBox(),
                SizedBox(
                  width: 9,
                ),
                Text(
                  '138 Ratings & 8 Reviews',
                  style: regular.copyWith(
                      fontSize: 12, color: groupOrdersTitleTextColor),
                )
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Text(
              'Brand: Pampers',
              style:
                  thin.copyWith(color: productAvailabilityColor, fontSize: 14),
            ),
            SizedBox(
              height: 19,
            ),
            Row(
              children: [
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Clinically proven hypoallergenic',
                  style: thin.copyWith(
                      color: productAvailabilityColor, fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'Pampers Pure Protection Diapers are made without chlorine bleaching, fragrance, lotion, parabens, and EU 26 allergens',
                    style: thin.copyWith(
                        color: productAvailabilityColor, fontSize: 14),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    ' Made with premium cotton, soft plant-based fibers, and other thoughtfully selected materials',
                    style: thin.copyWith(
                        color: productAvailabilityColor, fontSize: 14,overflow: TextOverflow.ellipsis),maxLines: 1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Clinically proven hypoallergenic',
                  style: thin.copyWith(
                      color: productAvailabilityColor, fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 31,
            ),
            Text(
              'Choose Count',
              style: regular.copyWith(
                  color: productAvailabilityColor, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 41,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CountBox(
                  count: '70',
                ),
                itemCount: 4,
              ),
            ),
            SizedBox(
              height: 31,
            ),
            Text(
              'Available Offers',
              style: regular.copyWith(
                  color: productAvailabilityColor, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                height: 260,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    AvailableOffers(),
                    AvailableOffers(),
                    AvailableOffers(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
