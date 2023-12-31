import 'package:clickoncustomer/providers/auth.dart';
import 'package:clickoncustomer/screens/web/account-order/account-order-screen.dart';
import 'package:clickoncustomer/screens/web/profile/profile-screen.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/account_subcomponent.dart';
import '../../../components/web/WebNavBar2.dart';
import '../../../components/web/bottom-web-bar-2.dart';
import '../../../components/web/custom-alert-box.dart';
import '../../../utils/constants/color.dart';

import '../../../utils/constants/fontStyles/kanit.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/img-provider.dart';
import '../../../utils/pref_utils.dart';
import '../../login_screen.dart';
import '../home/web-carousel-slider.dart';

class YourAccountWeb extends StatefulWidget {
  static const routeName = '/your-account-web';
  const YourAccountWeb({Key? key}) : super(key: key);

  @override
  _YourAccountWebState createState() => _YourAccountWebState();
}

class _YourAccountWebState extends State<YourAccountWeb> {
  @override
  Widget build(BuildContext context) {
    const double itemHeight = 130;
    final double itemWidth = MediaQuery.of(context).size.width * 0.1989;
    return Responsive(
      tablet: const Center(
        child: ImgProvider(
          url: "assets/images/clickOn-logo.png",
          height: 100,
          width: 200,
        ),
      ),
      mobile: const Center(
        child: ImgProvider(
          url: "assets/images/clickOn-logo.png",
          height: 100,
          width: 200,
        ),
      ),
      desktop: Scaffold(
        backgroundColor: bgColor2,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(175), child: WebNavBar2()),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                primaryColor.withOpacity(.16),
                gradiant2,
              ])),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Text(
                              titleYourAccount,
                              style: medium.copyWith(
                                  color: passColor, fontSize: 32),
                            ),
                          ]),
                          Row(
                            children: [
                              Container(
                                width: 126,
                                height: 45,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))),
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>((states) {
                                      if (states
                                          .contains(MaterialState.disabled)) {
                                        return canvasColor;
                                      }
                                      return canvasColor;
                                    }),
                                  ),
                                  child: Text(
                                    titleHelpCenter,
                                    style: medium.copyWith(
                                        color: helpTextColor, fontSize: 14),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Consumer<AuthProvider>(
                                builder: (context, value, child) => SizedBox(
                                  width: 50,
                                  height: 45,
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>((states) {
                                        if (states
                                            .contains(MaterialState.disabled)) {
                                          return canvasColor;
                                        }
                                        return canvasColor;
                                      }),
                                    ),
                                    onPressed: () {
                                      showMyDialog(
                                          screenContext: context,
                                          buttonName: "confirm",
                                          onConfirm: () {
                                            Provider.of<AuthProvider>(context, listen: false)
                                                .logOut(context);
                                          },
                                          title: "Logout!",
                                          contentText: "Do you really want to logout");

                                    },
                                    child: Icon(
                                      Icons.power_settings_new_rounded,
                                      color: primaryColor,
                                      size: 21,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 88,
                      ),
                      SizedBox(
                        height: 450,
                        child: GridView.count(
                          childAspectRatio: (itemWidth / itemHeight),
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          primary: false,
                          crossAxisSpacing: 30,
                          shrinkWrap: true,
                          mainAxisSpacing: 34,
                          crossAxisCount: 3,
                          children: <Widget>[
                            AccountComponent(
                                onPressed: () {
                                  if(PrefUtils().getToken()!=null){
                                    Navigator.pushNamed(
                                        context, AccountOrderScreenWeb.routeName);
                                  }else{
                                    Navigator.pushNamed(context, LoginScreen.routeName,arguments: const LoginScreen(isLoggedIn: true));
                                  }

                                },
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
                      SizedBox(
                        height: 59,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIndicators2(currentPage: 1, index: 1),
                            ImageIndicators2(currentPage: 1, index: 1),
                            ImageIndicators2(currentPage: 1, index: 1),
                            ImageIndicators2(currentPage: 1, index: 1),
                            ImageIndicators2(currentPage: 1, index: 1),
                            ImageIndicators2(currentPage: 1, index: 1),
                          ]),
                      SizedBox(
                        height: 322,
                      ),
                    ],
                  ),
                ),
                BottomWebBar2()
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageIndicators2 extends StatelessWidget {
  const ImageIndicators2({
    Key? key,
    required this.currentPage,
    required this.index,
  }) : super(key: key);

  final int currentPage;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,
      ),
    );
  }
}
