import 'package:clickoncustomer/components/elevated-buton.dart';
import 'package:clickoncustomer/providers/cart-provider.dart';
import 'package:clickoncustomer/screens/web/home/home-screen-web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../providers/order.dart';
import '../utils/constants/color.dart';
import '../utils/constants/fontstyles.dart';
import '../utils/constants/strings.dart';
import '../utils/img-provider.dart';
import '../utils/toast-message.dart';

class PaymentBank extends StatefulWidget {
  const PaymentBank(
      {Key? key, required this.isPay, required this.isCvv, this.cart})
      : super(key: key);
  final bool isPay;
  final bool isCvv;
  final Cart? cart;

  @override
  State<PaymentBank> createState() => _PaymentBankState();
}

class _PaymentBankState extends State<PaymentBank> {
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
                  widget.isCvv
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
          widget.isPay
              ? ButtonElevated(
                  onPressed: placeOrder(
                      payOnline: [widget.cart?.cartProducts?[0].id],
                      cartId: widget.cart?.id,
                      billing: 1,
                      shipping: 1,
                      cod: [widget.cart?.cartProducts?[0].id]),
                  buttonTitle: textPayNow,
                  isButtonEnable: true,
                  height: 40,
                  width: 90,
                  elevation: 0,
                  textStyle: medium.copyWith(fontSize: 16, color: Colors.white),
                  color: primaryColor,
                )
              : SizedBox(
                  width: 0,
                ),
        ]);
  }

  placeOrder(
      {required List<int?> cod,
      required List<int?> payOnline,
      required int? shipping,
      required int? billing,
      required int? cartId}) {
    Provider.of<OrderProvider>(context, listen: false)
        .placeOrder(
            cod: cod,
            shipping: shipping,
            billing: billing,
            cartId: cartId,
            payOnline: payOnline)
        .then((value) {
      if (value!.success!) {
        Navigator.of(context).pushNamed(HomeScreenWeb.routeName);
        showMessage(
          message: "Order Placed",
        );
      } else {
        showMessage(
          message: "Error in Order Placing",
        );
      }
    });
  }
}
