import 'package:clickoncustomer/components/buyTogetherItem.dart';
import 'package:clickoncustomer/utils/constants/color.dart';

import 'package:flutter/material.dart';
import '../../../utils/constants/fontstyles.dart';

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
              spreadRadius: 3,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Buy Together',
                style: medium.copyWith(color: mainTitleColor, fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        BuyTogetherItem(
                            image: "assets/images/dummy/image-baby-detail.png",
                            description:
                                'Pampers Pure Protection Baby Diapers, Medium Size... ',
                            price: 809.00),
                        Icon(
                          Icons.add,
                          size: 40,
                        ),
                        BuyTogetherItem(
                            image: "assets/images/dummy/image-baby-detail.png",
                            description:
                                'Pampers Pure Protection Baby Diapers, Medium Size... ',
                            price: 809.00),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.280,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const VerticalDivider(
                            thickness: 1,
                            color: verticalDividerColor2,
                            endIndent: 5,
                            indent: 5,
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.036,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Total Price ',
                                    style: regular.copyWith(
                                        fontSize: 20,
                                        color: productAvailabilityColor),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  Text(
                                    '2008.00',
                                    style: regular.copyWith(
                                        fontSize: 22, color: mainTitleColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  'Add to Cart',
                                  style: medium.copyWith(
                                      fontSize: 24, color: primaryColor),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 1.0, color: primaryColor),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10))),
                              )
                            ],
                          ),
                         // SizedBox(
                         //    width: MediaQuery.of(context).size.width * 0.096,
                         //  )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
