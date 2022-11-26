import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants/color.dart';

import '../utils/constants/fontstyles.dart';
import '../utils/constants/images.dart';
import '../utils/constants/strings.dart';
import '../utils/img-provider.dart';
import '../screens/otp-screen.dart';

class SignUp extends StatelessWidget {
  static const routeName = "/signup";
  const SignUp({Key? key}) : super(key: key);

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
                        height: 47,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 91,right: 91),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 350,
                              height: 45,
                              child: TextFormField(
                                autofocus: true,
                                decoration: InputDecoration(
                                    labelText: textYourName,
                                    labelStyle: regular.copyWith(
                                        fontSize: 14, color: primaryColor),
                                    enabled: true,
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: primaryColor, width: 2),
                                        borderRadius: BorderRadius.circular(10))),
                              ),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 45,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "+91",
                                      hintStyle: regular.copyWith(
                                          fontSize: 14, color: numberColor),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: textFormFieldBorderColor),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                SizedBox(
                                  width: 268,
                                  height: 45,
                                  child: TextFormField(
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      hintText: textMobileNumber,
                                      hintStyle: thin.copyWith(
                                          fontSize: 14, color: numberColor),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: textFormFieldBorderColor),
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
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Container(
                              width: 350,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                hintText: textEmailLogin,
                                hintStyle:
                                    thin.copyWith(fontSize: 14, color: numberColor),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: textFormFieldBorderColor),
                                ),
                              )),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Container(
                              width: 350,
                              height: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                hintText: textPassword,
                                hintStyle:
                                    thin.copyWith(fontSize: 14, color: numberColor),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: textFormFieldBorderColor),
                                ),
                              )),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              textPasswordMinLength,
                              style: regular.copyWith(color: passColor),
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
                                  onPressed: () {},
                                  child: Text(
                                    textContinue,
                                    style: medium.copyWith(
                                        fontSize: 16, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textAlreadyHaveAnAccount,
                            style: regular.copyWith(
                                fontSize: 14, color: numberColor),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            textSignIn,
                            style: regular.copyWith(
                                fontSize: 14, color: primaryColor),
                          ),
                        ],
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
