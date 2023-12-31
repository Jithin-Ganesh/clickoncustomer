import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/fontStyles/kanit.dart';


class AvailableOffers extends StatelessWidget {
  const AvailableOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(width: MediaQuery.of(context).size.width*0.3920,
        height: 88,
        decoration: BoxDecoration(
          border:  Border.all(color: groupOrdersTitleTextColor),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImgProvider(url:'assets/images/icon-bank.png',height: 33,width: 33,),
              SizedBox(width: 34,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.135,
                child: Text('Bank Offer 5% Cashback on Yes Bank Credit & Debit Cards.',maxLines: 2,style: medium.copyWith(fontSize: 14),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
