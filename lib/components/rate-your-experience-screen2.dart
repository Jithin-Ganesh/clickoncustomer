import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/constants/color.dart';

import '../utils/constants/fontstyles.dart';
import '../utils/img-provider.dart';

class RateYourExperience2 extends StatelessWidget {
  const RateYourExperience2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
                width: 38,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ImgProvider(
                        url: "assets/images/img_37.png",
                        width: 19,
                        height: 13,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        textDelivered,
                        style: regular.copyWith(
                            fontSize: 16, color: deliveryDateColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    textDeliveryThursday,
                    style: regular.copyWith(
                        fontSize: 16, color: ratingSubValueColor),
                  )
                ],
              ),
              SizedBox(
                width: 142,
              ),
              SizedBox(
                height: 71,
                child: VerticalDivider(
                  width: 3,
                  color: divColor,
                ),
              ),
              SizedBox(
                width: 71,
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
                    textOrderPlacedSep11,
                    style: medium.copyWith(
                        fontSize: 14, color: priceDetailsSubTextColor),
                  ),
                ],
              )
            ],
          )),
      SizedBox(
        height: 5,
      ),
      Container(
          height: 327,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Padding(
              padding: const EdgeInsets.only(left: 40, top: 45,right: 48),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textRateyourdeliveryexperience,
                          style: medium.copyWith(
                              fontSize: 18,
                              color: productDetailsScreenTextColor),
                        ),
                        Text(
                          textFeedbackHelp,
                          style: medium.copyWith(
                              fontSize: 18,
                              color: productDetailsScreenTextColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    RatingBar.builder(
                      glowRadius: 1.5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 38,
                      itemCount: 5,
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
                      height: 23,
                    ),
                    Text(textWhat,
                        style: medium.copyWith(
                            fontSize: 18,
                            color: productDetailsScreenTextColor)),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: Checkbox(
                              value: true,
                              onChanged: (onchnged) {
                                print(onchnged);
                              }),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          textDeliveryassociate,
                          style: medium.copyWith(
                              fontSize: 14, color: subTextGeneralColor),
                        ),
                        SizedBox(
                          width: 33,
                        ),
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: Checkbox(
                              value: false,
                              onChanged: (onchnged) {
                                print(onchnged);
                              }),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          textPackaging,
                          style: medium.copyWith(
                              fontSize: 14, color: subTextGeneralColor),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: Checkbox(
                              value: false,
                              onChanged: (onchnged) {
                                print(onchnged);
                              }),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          textOther,
                          style: medium.copyWith(
                              fontSize: 14, color: subTextGeneralColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Text(
                      textYourComments,
                      style: medium.copyWith(
                          fontSize: 14, color: subTextGeneralColor),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: textFieldColor),
                      width: 971,
                      height: 85,
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Text(
                      textFeedback,
                      style:
                          regular.copyWith(fontSize: 14, color: commentColor),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(height: 121,width: 971,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: ElevatedButton(child:
                      Text(
                        textSubmit,
                        style: regular.copyWith(
                            fontSize: 14, color: Colors.white),
                      ), onPressed: () {  },
                    )
                    )])))
    ]));
  }
}
