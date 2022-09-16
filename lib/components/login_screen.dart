import 'package:clickoncustomer/components/otp-screen.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                        height: 97,
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
                        width: 97,
                        height: 9.91,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      Text(
                        textEmail,
                        style: regular.copyWith(
                            fontSize: 14, color: emailTextColor),
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      SizedBox(
                        width: 350,
                        height: 45,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: textFormFieldBorderColor),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  left: 14, top: 12, bottom: 10),
                              child: Text("+91",
                                  textAlign: TextAlign.center,
                                  style: regular.copyWith(
                                      fontSize: 14, color: hintTextColor)),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          style: regular.copyWith(
                              fontSize: 14, color: numberColor),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 350,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(OtpScreen.routeName);
                            },
                            child: Text(
                              textContinue,
                              textAlign: TextAlign.center,
                            )),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        textTermsAndConditions,
                        style: medium.copyWith(
                            fontSize: 12, color: emailTextColor),
                      ),
                      SizedBox(
                        height: 38,
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
                      SizedBox(
                        height: 38,
                      ),
                      SizedBox(
                        width: 350,
                        height: 45,
                        child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              textCreateAccount,
                              style: medium.copyWith(
                                  fontSize: 16, color: createAccountTextColor),
                            )),
                      )
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
