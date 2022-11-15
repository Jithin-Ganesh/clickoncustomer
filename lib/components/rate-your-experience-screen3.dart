import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/constants/color.dart';
import '../utils/constants/decoration.dart';
import '../utils/constants/fontstyles.dart';
import '../utils/constants/strings.dart';
import '../utils/img-provider.dart';

class RateYourExperience3 extends StatelessWidget {
  const RateYourExperience3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
          width: MediaQuery.of(context).size.width * 0.626,height: 160,
          decoration: containerDecoration,
          child: Padding(
            padding: const EdgeInsets.only(left: 40, top: 45),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImgProvider(
                    url: "assets/images/img_35.png",
                    width: 90,
                    height: 71,
                  ),
                  SizedBox(
                    width: 39,
                  ),
                  Text(
                    textYouOrderItemName,
                    style: regular.copyWith(
                        fontSize: 14, color: orderPlacedTextColor),
                  ),
                  SizedBox(
                    width: 72,
                  ),
                  SizedBox(
                    height: 71,
                    child: VerticalDivider(
                      width: 3,
                      color: divColor,
                    ),
                  ),
                  SizedBox(
                    width: 3.8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textOrderId,
                        style: medium.copyWith(
                            fontSize: 14, color: priceDetailsSubTextColor),
                      ),
                      Text(
                        textOrderPlacedSep15,
                        style: medium.copyWith(
                            fontSize: 14, color: priceDetailsSubTextColor),
                      ),
                    ],
                  )
                ]),
          )),
      SizedBox(
        height: 5,
      ),
      Container(
          height: 655,
          width: MediaQuery.of(context).size.width * 0.626,
          decoration: containerDecoration,
          child: Padding(
              padding: const EdgeInsets.only(left: 40, top: 45, right: 48),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add rating",
                          style: medium.copyWith(
                              fontSize: 18,
                              color: productDetailsScreenTextColor),
                        ),
                        Text(
                          "Review Help",
                          style: medium.copyWith(
                              fontSize: 14,
                              color: productDetailsScreenTextColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    RatingBar.builder(
                      glowRadius: 1.5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 38,
                      itemCount: 5,initialRating: 1,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: ratingColor,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Add photo or video",
                      style: medium.copyWith(
                          fontSize: 14, color: priceDetailsSubTextColor),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: dotColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          child: ImgProvider(
                            url: "assets/images/img_38.png",
                            width: 100,
                            height: 100,
                          ),
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: dotColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          width: 100,
                          height: 100,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      "Add headline",
                      style: medium.copyWith(
                          fontSize: 14, color: priceDetailsSubTextColor),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 971,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: textFieldColor,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Written your review",
                      style: medium.copyWith(
                          fontSize: 14, color: priceDetailsSubTextColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 971,
                      height: 121,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: textFieldColor,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            textSubmit,
                            style: regular.copyWith(
                                fontSize: 14, color: Colors.white),
                          )),
                    )
                  ])))
    ]);
  }
}
