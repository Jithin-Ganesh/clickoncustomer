import 'package:clickoncustomer/providers/product-provider.dart';
import 'package:clickoncustomer/utils/constants/decoration.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../utils/constants/color.dart';

class RateYourExperienceScreen extends StatefulWidget {
  static const routeName = '/rate-experience';
  const RateYourExperienceScreen({Key? key, this.productId}) : super(key: key);
  final int? productId;

  @override
  State<RateYourExperienceScreen> createState() =>
      _RateYourExperienceScreenState();
}

class _RateYourExperienceScreenState extends State<RateYourExperienceScreen> {
  RateYourExperienceScreen _args() {
    final args =
        ModalRoute.of(context)!.settings.arguments as RateYourExperienceScreen;
    return args;
  }

  final TextEditingController textController = TextEditingController();
  late double ratingValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.626,
          height: 160,
          decoration: containerDecoration,
          child: Padding(
            padding: const EdgeInsets.only(left: 40, top: 45),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImgProvider(
                  url: "assets/images/img_35.png",
                  width: 90,
                  height: 71,
                ),
                const SizedBox(
                  width: 38,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textProduct,
                      style: medium.copyWith(
                          fontSize: 18, color: productDetailsScreenTotalColor),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      textYouOrderItemName,
                      style: regular.copyWith(
                          fontSize: 14, color: orderPlacedTextColor),
                    )
                  ],
                ),
                const SizedBox(
                  width: 52,
                ),
                const SizedBox(
                  height: 71,
                  child: VerticalDivider(
                    width: 3,
                    color: divColor,
                  ),
                ),
                const SizedBox(
                  width: 63,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textSeller,
                      style: medium.copyWith(
                          fontSize: 18, color: productDetailsScreenTextColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      textRKWorldPvtLtd,
                      style: medium.copyWith(fontSize: 24, color: primaryColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      textViewProfile,
                      style: regular.copyWith(
                          fontSize: 14,
                          color: priceDetailsSubTextColor,
                          decoration: TextDecoration.underline),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 436,
          width: MediaQuery.of(context).size.width * 0.626,
          decoration: containerDecoration,
          child: Padding(
              padding: const EdgeInsets.only(left: 40, top: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        textRateSeller,
                        style: medium.copyWith(
                            fontSize: 18, color: productDetailsScreenTextColor),
                      ),
                      Text(
                        textFeedbackHelp,
                        style: medium.copyWith(
                            fontSize: 18, color: productDetailsScreenTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  RatingBar.builder(
                    glowRadius: 1.5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemSize: 38,
                    itemCount: 5,
                    initialRating: 1,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: ratingColor,
                    ),
                    onRatingUpdate: (rating) {
                      ratingValue = rating;
                      print(rating);
                    },
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    children: [
                      Text(
                        textItemDescribed,
                        style: medium.copyWith(
                            fontSize: 18, color: productDetailsScreenTextColor),
                      ),
                      const SizedBox(
                        width: 78,
                      ),
                      Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => primaryColor),
                          splashRadius: 8,
                          value: false,
                          groupValue: false,
                          onChanged: (value) {
                            print(value);
                          }),
                      const SizedBox(
                        width: 11,
                      ),
                      Text(
                        textYes,
                        style: medium.copyWith(
                            fontSize: 14, color: subTextGeneralColor),
                      ),
                      const SizedBox(
                        width: 29,
                      ),
                      Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => primaryColor),
                          splashRadius: 8,
                          value: true,
                          groupValue: false,
                          onChanged: (value) {
                            print(value);
                          }),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        textNo,
                        style: medium.copyWith(
                            fontSize: 14, color: subTextGeneralColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(textYourComments,
                      style: medium.copyWith(
                        fontSize: 14,
                        color: subTextGeneralColor,
                      )),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    textPleaseComment,
                    style: regular.copyWith(fontSize: 14, color: commentColor),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: textFieldColor)),
                      width: 971,
                      height: 85,
                      child: TextFormField(
                        controller: textController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          fillColor: textFieldColor,
                          contentPadding: EdgeInsets.only(
                              left: 10, right: 10, bottom: 5, top: 50),
                        ),
                      )),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: ElevatedButton(
                        onPressed: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .addProductReview(
                                  productId: _args().productId,
                                  rating: ratingValue,
                                  review: textController.text);
                        },
                        child: Text(
                          textSubmit,
                          style: regular.copyWith(
                              fontSize: 14, color: Colors.white),
                        )),
                  )
                ],
              )),
        )
      ]),
    );
  }
}
