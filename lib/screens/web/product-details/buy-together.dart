import 'package:clickoncustomer/components/buyTogetherItem.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';

import 'package:flutter/material.dart';

import '../../../utils/constants/fontStyles/kanit.dart';


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
                height: 36,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        BuyTogetherItem(
                            image: "assets/images/dummy/image-baby-detail.png",
                            description:
                                'Pampers Pure Protection Baby Diapers, Medium Size... ',
                            price: "809.00"),
                        Padding(
                          padding: EdgeInsets.only(top: 63),
                          child: Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                        BuyTogetherItem(
                            image: "assets/images/dummy/image-baby-detail.png",
                            description:
                                'Pampers Pure Protection Baby Diapers, Medium Size... ',
                            price: "809.00"),
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
                                    width: 15,
                                  ),
                                  Text(textRupees,style: regular.copyWith(fontSize: 18,color: mainTitleColor),
                                  ),SizedBox(width: 2,),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Add to Cart',
                                    style: medium.copyWith(
                                        fontSize: 16, color: primaryColor),
                                  ),
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
