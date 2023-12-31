import 'dart:developer';

import 'package:clickoncustomer/components/elevated-buton.dart';
import 'package:clickoncustomer/providers/cart-provider.dart';
import 'package:clickoncustomer/providers/user-provider.dart';
import 'package:clickoncustomer/screens/web/home/home-screen-web.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../models/cart.dart';
import '../providers/order.dart';
import '../providers/payment.dart';
import '../utils/constants/color.dart';
import '../utils/constants/fontStyles/kanit.dart';
import '../utils/constants/strings.dart';
import '../utils/img-provider.dart';
import '../utils/toast-message.dart';

class PaymentBank extends StatefulWidget {
  const PaymentBank(
      {Key? key, required this.isPay, required this.isCvv, this.cart, })
      : super(key: key);
  final bool isPay;
  final bool isCvv;
  final Cart? cart;

  @override
  State<PaymentBank> createState() => _PaymentBankState();
}

class _PaymentBankState extends State<PaymentBank> {


  late Razorpay _razorpay;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, value, child) => Column(
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
                    const SizedBox(
                      width: 11,
                    ),
                    const ImgProvider(
                      url: "assets/images/icon-visa.png",
                      width: 29,
                      height: 18,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    widget.isCvv
                        ? Container(
                            width: MediaQuery.of(context).size.width * 0.036,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
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
                        : const SizedBox(
                            width: 0,
                          ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            widget.isPay
                ?  ButtonElevated(
                    onPressed: ()async{
                      Provider.of<PaymentProvider>(
                          context,
                          listen: false)
                          .startPaymentForWeb(billing: value.selectedAddress?.id,
                        shipping: value.selectedAddress?.id,
                        context: context,
                      );
                    },
                    buttonTitle: textPayNow,
                    isButtonEnable: true,
                    height: 40,
                    width: 90,
                    elevation: 0,
                    textStyle: medium.copyWith(fontSize: 16, color: Colors.white),
                    color: primaryColor,
                  )
                : const SizedBox(
                    width: 0,
                  ),
          ]),
    );
  }

}
