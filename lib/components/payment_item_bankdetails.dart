import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/color.dart';
import '../utils/constants/fontstyles.dart';
import '../utils/constants/strings.dart';
import '../utils/img-provider.dart';

class PaymentBank extends StatelessWidget {
  const PaymentBank({Key? key, required this.isPay, required this.isCvv})
      : super(key: key);
  final bool isPay;
  final bool isCvv;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Radio(
                    activeColor: primaryColor,
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => primaryColor),
                    value: true,
                    groupValue: true,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => primaryColor),
                    onChanged: (value) {
                      print(value);
                    }),
                SizedBox(
                  width: 13,
                ),
                Text(
                  textDebitCardName,
                  style:
                      medium.copyWith(color: productSubTextColor, fontSize: 16),
                ),
              ]),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        textUserName,
                        style: regular.copyWith(
                            fontSize: 12, color: productSubTextColor),
                      ),
                      Text(
                        textPassCode,
                        style:
                            regular.copyWith(fontSize: 12, color: gmailColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  ImgProvider(
                    url: "assets/images/icon-visa.png",
                    width: 29,
                    height: 18,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  isCvv
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.036,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: shadowColor2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(9),
                            child: Text(
                              textAlign: TextAlign.center,
                              textCVV,
                              style: thin.copyWith(
                                  fontSize: 14, color: cvvBorderColor),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 0,
                        ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          isPay
              ? SizedBox(
                  width: 146,
                  height: 40,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                     ))),
                      onPressed: () {},
                      child: Text(
                        textAlign: TextAlign.center,
                        textPayNow,
                        style:
                            medium.copyWith(fontSize: 16, color: Colors.white),
                      )),
                )
              : SizedBox(
                  width: 0,
                ),
        ]);
  }
}
