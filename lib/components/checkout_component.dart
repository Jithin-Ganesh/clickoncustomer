
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({
    Key? key,
    required this.title,
    required this.text,
    required this.isAccount,
    this.isSubmit = true,
    this.isProcessing = false,
    this.slNumber, this.onPressed,
  }) : super(key: key);

  final String title;
  final String text;
  final bool isAccount;
  final VoidCallback? onPressed;
  final bool isSubmit;
  final bool isProcessing;
  final String? slNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: canvasColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.622,
      child: Padding(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.009, top:  MediaQuery.of(context).size.width *  0.0119, right: 23, bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PaymentTitle(
                  title: title,
                  isProcessing: isProcessing,
                  isSubmit: isSubmit,
                  slNumber: slNumber,
                ),
                const SizedBox(
                  height: 17,
                ),
                isAccount
                    ? Row(children: [
                        const SizedBox(
                          width: 71,
                        ),
                        Text(
                          textIDKvsanz,
                          style: medium.copyWith(
                              fontSize: 16,
                              color: productDetailsScreenTotalColor),
                        ),
                        const SizedBox(
                          width: 42,
                        ),
                        Text(
                          textGmail,
                          style:
                              regular.copyWith(fontSize: 16, color: gmailColor),
                        )
                      ])
                    : SizedBox(
                        height: 55,
                        width: 655,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 71,
                            ),
                            Expanded(
                              child: Text(
                                text,
                                style:
                                    thin.copyWith(color: productSubTextColor),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
            SizedBox(
              width:  MediaQuery.of(context).size.width * 0.072,
              height: 45,
              child: OutlinedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all<Color>(shadowColor2),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    textChange,
                    style: medium.copyWith(
                        fontSize: 14, color: productDetailsScreenTextColor),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentTitle extends StatefulWidget {
  const PaymentTitle({
    Key? key,
    required this.title,
    this.isSubmit = true,
    this.isProcessing = false,
    this.slNumber,
  }) : super(key: key);

  final String title;
  final bool isSubmit;
  final bool isProcessing;
  final String? slNumber;
  @override
  State<PaymentTitle> createState() => _PaymentTitleState();
}

class _PaymentTitleState extends State<PaymentTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 18,
        ),
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.isSubmit
                ? checkedItemsColor
                : widget.isProcessing
                    ? primaryColor
                    : circledNumberButtonColor,
          ),
          child: Center(
            child: widget.isSubmit
                ? const Icon(
                    Icons.check,
                    color: canvasColor,
                    size: 11,
                  )
                : Text(
                    widget.slNumber ?? '',
                    style: medium.copyWith(color: canvasColor),
                  ),
          ),
        ),
        const SizedBox(
          width: 27,
        ),
        Text(
          widget.title,
          style: medium.copyWith(fontSize: 20, color: priceOffersSubtextColor),
        ),
      ],
    );
  }
}
