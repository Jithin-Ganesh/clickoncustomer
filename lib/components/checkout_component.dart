import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout(
      {Key? key,
      required this.title,
      required this.text,
      required this.isAccount})
      : super(key: key);

  final String title;
  final String text;
  final bool isAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: defaultTextColor,
        width: 1196,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 18,
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              circledCheckBoxImage,
                              width: 25,
                              height: 25,
                            ),
                            Positioned(
                              left: 9,
                              top: 10,
                              child: Image.asset(
                                tickImage,
                                width: 6,
                                height: 4,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 27,
                        ),
                        Text(
                          title,
                          style: medium.copyWith(
                              fontSize: 20, color: priceOffersSubtextColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    isAccount
                        ? Row(children: [
                            SizedBox(
                              width: 71,
                            ),
                            Text(
                              textIDKvsanz,
                              style: medium.copyWith(
                                  fontSize: 16,
                                  color: productDetailsScreenTotalColor),
                            ),
                            SizedBox(
                              width: 42,
                            ),
                            Text(
                              textGmail,
                              style: regular.copyWith(
                                  fontSize: 16, color: gmailColor),
                            )
                          ])
                        : Row(
                            children: [
                              SizedBox(
                                width: 71,
                              ),
                              Text(text),
                            ],
                          ),
                  ],
                ),
                Container(
                  width: 139,
                  height: 45,
                  child: OutlinedButton(
                      style: ButtonStyle(
                        shadowColor:
                            MaterialStateProperty.all<Color>(shadowColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                      ),
                      onPressed: () {},
                      child: Text(
                        textChange,
                        style: medium.copyWith(
                            fontSize: 14, color: productDetailsScreenTextColor),
                      )),
                ),
                SizedBox(
                  width: 23,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
