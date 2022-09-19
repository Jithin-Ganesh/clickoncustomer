import 'package:clickoncustomer/components/checkout_component.dart';
import 'package:clickoncustomer/components/payment_item_bankdetails.dart';
import 'package:clickoncustomer/components/payment_sub.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem(
      {Key? key,
      required this.imageIcon,
      required this.title,
      required this.isCvv,
      required this.isPay})
      : super(key: key);
  final String imageIcon;
  final String title;
  final bool isCvv;
  final bool isPay;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.622,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: canvasColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 20),
            child: PaymentTitle(
              title: 'Payment',
              isProcessing: true,
              isSubmit: false,
              slNumber: '4',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 70.0, right: 56, bottom: 64, top: 32),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: paymentBorderColor, width: 1)),
                  width: 1068,
                  height: 97,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 19, right: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              width: 20,
                              height: 20,
                              child: Checkbox(
                                value: true,
                                onChanged: (bool? value) {},
                              ),
                            ),
                            SizedBox(
                              width: 28,
                            ),
                            ImgProvider(
                              url: "assets/images/icon-wallet.png",
                              width: 35,
                              height: 34,
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textClickOnWallet,
                                  style: medium.copyWith(
                                      fontSize: 16,
                                      color: productDetailsScreenTextColor),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      textRemainingBalance,
                                      style: regular.copyWith(
                                          fontSize: 16, color: gmailColor),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      textZero,
                                      style: regular.copyWith(
                                          fontSize: 16, color: gmailColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  textUsed,
                                  style: regular.copyWith(
                                      fontSize: 16, color: gmailColor),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      textRupees,
                                      style: regular.copyWith(
                                          fontSize: 22, color: primaryColor),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      textBalanceWallet,
                                      style: regular.copyWith(
                                          fontSize: 22, color: primaryColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: paymentBorderColor, width: 1)),
                  height: 398,
                  width: MediaQuery.of(context).size.width *  0.556,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.128,
                                height: 54,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 24,
                                    ),
                                    ImgProvider(
                                      url: imageIcon,
                                      width: 13,
                                      height: 15,
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 2, color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      title,
                                      style: medium.copyWith(
                                          fontSize: 16, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              PaymentSub()
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                textPayBalanceUsingSavedOptions,
                                style: medium.copyWith(
                                    fontSize: 16,
                                    color: productAvailabilityColor),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: paymentBorderColor)),
                                  width: MediaQuery.of(context).size.width * 0.349,
                                  height: 199,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 33, right: 36,top: 20),
                                    child: Column(
                                      children: [
                                        PaymentBank(isPay: true, isCvv: true),
                                        SizedBox(
                                          height: 17,
                                        ),
                                        const Divider(
                                          height: 1,
                                          color: paymentDividerColor2,
                                        ),
                                        SizedBox(height: 18),
                                        PaymentBank(isPay: false, isCvv: false),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                redirectText,
                                style: thin.copyWith(
                                    fontSize: 12, color: subTextGeneralColor),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
