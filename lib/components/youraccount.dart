import 'package:clickoncustomer/components/account_subcomponent.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourAccount extends StatelessWidget {
  const YourAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 1920,
      height: MediaQuery.of(context).size.height*.8,
      child: Column(children: [
        SizedBox(
          height: 80,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Text(
                titleYourAccount,
                style: medium.copyWith(color: passColor, fontSize: 32),
              ),
            ]),
            Row(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  width: 126,
                  height: 45,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      titleHelpCenter,
                      style:
                          medium.copyWith(color: helpTextColor, fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  width: 50,
                  height: 45,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.power_settings_new_rounded,
                      color: primaryColor,
                      size: 21,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .45,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              crossAxisSpacing: 34,
              mainAxisSpacing: 29,
              crossAxisCount: 3,
              children: <Widget>[
                AccountComponent(
                    title: titleYourOrders,
                    description: titleManageAllYourOrders,
                    icon: clickOnOffersWalletImage,
                    isSelected: true),
                AccountComponent(
                    title: textClickOnWallet,
                    description: textAddMoneyCheckYourRewards,
                    icon: walletImage,
                    isSelected: false),
                AccountComponent(
                    title: textAccountSecurity,
                    description: textEditYourPersonalInformation,
                    icon: lockImage,
                    isSelected: false),
                AccountComponent(
                    title: textManageYourStuffs,
                    description: textReviewRatingsCoupons,
                    icon: manageImage,
                    isSelected: false),
                AccountComponent(
                    title: textPayment,
                    description: textAddEditPaymentMethods,
                    icon: paymentImage,
                    isSelected: false),
                AccountComponent(
                    title: textAddressYourAccount,
                    description: textManageYourAddresses,
                    icon: addressImage,
                    isSelected: false)
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
