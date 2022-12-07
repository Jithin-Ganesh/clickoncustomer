import 'dart:developer';

import 'package:clickoncustomer/screens/web/home/home-screen-web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../utils/constants/color.dart';
import '../utils/constants/fontstyles.dart';
import '../utils/constants/images.dart';
import '../utils/constants/strings.dart';
import '../utils/img-provider.dart';
import '../components/otp-editing-controller.dart';
import '../utils/pref_utils.dart';
import '../utils/toast-message.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = "/otp";
  const OtpScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);
  final String? phoneNumber;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late OtpFieldController otpController;
  bool isOtpFilled = false;
  String? otp;

  OtpScreen _args() {
    final args = ModalRoute.of(context)!.settings.arguments as OtpScreen;
    return args;
  }

  otpVerification() {
    //Provider.of<AuthProvider>(context, listen: false).enableLoading();

    Provider.of<AuthProvider>(context, listen: false)
        .verifyOTP(phone: _args().phoneNumber, otp: otp)
        .then((value) async {
      // Provider.of<AuthProvider>(context, listen: false).disableLoading();
      if (PrefUtils().getToken() != null) {
        //showMessage( message: "Otp Verified",);
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreenWeb.routeName, (route) => false);
      }
    });
  }

  @override
  void initState() {
    otpController = OtpFieldController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 201,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: primaryColor),
                  width: 301,
                  height: 558,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 48.91, left: 44.17),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textLogin,
                                  style: medium.copyWith(
                                      fontSize: 24, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 18.19,
                                ),
                                Text(
                                  textGreatDeals,
                                  style: regular.copyWith(
                                      fontSize: 34, color: Colors.white),
                                ),
                              ])),
                      SizedBox(
                        height: 142,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.58, right: 36.83),
                        child: Column(
                          children: [
                            ImgProvider(
                              url: logoImage,
                              color: primaryColor,
                              width: 246,
                              height: 221,
                            ),
                            SizedBox(
                              height: 34,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 533,
                  height: 558,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 36,
                      ),
                      ImgProvider(
                        url: clickUpLogoImage,
                        width: 70,
                        height: 43,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      ImgProvider(
                        url: clickOnOffersImage,
                        width: 98,
                        height: 10.5,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 53,
                      ),
                      Text(
                        textVerifyAccountWithOTP,
                        style: medium.copyWith(
                            fontSize: 20, color: mainTitleColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        textOtpSend,
                        style:
                            regular.copyWith(fontSize: 14, color: otpSubText),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 165, right: 165),
                        child: OtpEditingController(
                          otpController: otpController,
                          onOtpFieldChanged: (completed) {
                            setState(() {
                              isOtpFilled = completed;
                            });
                          },
                          //onCompleted => String
                          isOtpFilled: isOtpFilled,
                          onOtpCompleted: (string) {
                            setState(() {
                              otp = string;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 27,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textResentOtp,
                            style: regular.copyWith(
                                fontSize: 14, color: otpSubText),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            textTime,
                            style: regular.copyWith(
                                fontSize: 14, color: mainTitleColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 27,
                      ),
                      Container(
                        width: 350,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                            onPressed: () {
                              otpVerification();
                              //Navigator.pushNamedAndRemoveUntil(context, HomeScreenWeb.routeName, (route) => false);
                            },
                            child: Text(
                              textSignIn,
                              style: medium.copyWith(
                                  fontSize: 16, color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 350,
                        height: 45,
                        child: OutlinedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                            onPressed: () {
                              otpVerification();
                              //Navigator.pushNamedAndRemoveUntil(context, HomeScreenWeb.routeName, (route) => false);
                            },
                            child: Text(
                              textSignInWithYourPassword,
                              style: medium.copyWith(
                                  fontSize: 16, color: createAccountTextColor),
                            )),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textHavingTrouble,
                            style: medium.copyWith(
                                fontSize: 14, color: emailTextColor),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            textGetHelp,
                            style: medium.copyWith(
                                fontSize: 14, color: primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 157,
            ),
            const SizedBox(
                width: 841,
                child: Divider(
                  height: 1,
                  color: dividerBorderColor,
                )),
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textRights,
                  style: thin.copyWith(fontSize: 14, color: Colors.black),
                ),
                SizedBox(
                  width: 265,
                ),
                Text(
                  textPrivacyPolicy,
                  style: thin.copyWith(fontSize: 14, color: Colors.black),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  textLegalPolicy,
                  style: thin.copyWith(fontSize: 14, color: Colors.black),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  textSitemap,
                  style: thin.copyWith(fontSize: 14, color: Colors.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
