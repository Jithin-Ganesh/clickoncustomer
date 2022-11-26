import 'package:flutter/cupertino.dart';

import '../utils/constants/color.dart';

import '../utils/constants/fontstyles.dart';
import '../utils/img-provider.dart';

class PaymentSub extends StatelessWidget {
  const PaymentSub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [SizedBox(width: 24,),
          ImgProvider(
            url: "assets/images/img_29.png",
            width: 20,
            height: 16,
            border: Border.all(color: productDetailsScreenTotalColor),
          ),
          SizedBox(
            width: 23,
          ),
          Text(
            " Credit / Debit Card ",
            style: medium.copyWith(
                fontSize: 16, color: productDetailsScreenTotalColor),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        children: [SizedBox(width: 24,),
          ImgProvider(
            url: "assets/images/img_30.png",
            width: 19,
            height: 13,
            border:
                Border.all(color: productDetailsScreenTotalColor, width: 1.5),
            radius: 2,
          ),
          SizedBox(
            width: 23,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "UPI",
                style: medium.copyWith(
                    fontSize: 16, color: productDetailsScreenTotalColor),
              ),
              Text(
                "PhonePe / Google Pay",
                style: medium.copyWith(fontSize: 12, color: paymentSubTextColor),
              ),
            ],
          )
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        children: [SizedBox(width: 24,),
          ImgProvider(
            url: "assets/images/img_31.png",
            width: 16,
            height: 14,
            border: Border.all(width: 1.5, color: mainTitleColor),
          ),
          SizedBox(
            width: 23,
          ),
          Text(
            "Net Banking",
            style: medium.copyWith(
                fontSize: 16, color: productDetailsScreenTotalColor),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        children: [SizedBox(width: 24,),
          ImgProvider(
            url: "assets/images/img_32.png",
            width: 19,
            height: 15,
            border: Border.all(color: productDetailsScreenTotalColor),
          ),
          SizedBox(
            width: 23,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Other Wallets",
                style: medium.copyWith(
                    fontSize: 16, color: productDetailsScreenTotalColor),
              ),Text("Paytm",style:medium.copyWith(fontSize: 12,color: paymentSubTextColor) ,),
            ],
          )
        ],
      ),
    ]));
  }
}
