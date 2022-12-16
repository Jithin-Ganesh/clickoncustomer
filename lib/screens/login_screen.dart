import 'package:clickoncustomer/screens/otp-screen.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../utils/toast-message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    super.dispose();
  }

  void authenticate() {
    // Provider.of<AuthProvider>(context, listen: false).enableLoading();
    Provider.of<AuthProvider>(context, listen: false)
        .login(phone: phoneController.text)
        .then((value) {
      if (value != null) {
        // Provider.of<AuthProvider>(context, listen: false).disableLoading();
        showSnackBar(message: 'OTP : ${value.code}', context: context);
        Navigator.of(context).pushNamed(OtpScreen.routeName,
            arguments: OtpScreen(
              phoneNumber: phoneController.text,
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
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
                              controller: phoneController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: textFormFieldBorderColor),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14, top: 13, bottom: 10),
                                  child: Text("+91",
                                      style: regular.copyWith(
                                          fontSize: 14, color: hintTextColor)),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              validator: (String? value) {
                                if (value == null ||
                                    value.toString().length != 10) {
                                  return " Enter a valid phone number";
                                }
                                return null;
                              },
                              style: regular.copyWith(
                                  fontSize: 14, color: numberColor),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 350,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ElevatedButton(
                                  style:ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0))),
                                  ),
                                    onPressed: () {
                                    if(_formKey.currentState!.validate()){
                                      authenticate();
                                    }
                                    },
                                    child: Text(
                                      textContinue,
                                      style: medium.copyWith(
                                          fontSize: 16, color: Colors.white),
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
                            ],
                          ),
                          SizedBox(
                            height: 38,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textHavingTrouble,
                                style: regular.copyWith(
                                    fontSize: 14, color: emailTextColor),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                textGetHelp,
                                style: regular.copyWith(
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
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, OtpScreen.routeName);
                                },
                                child: Text(
                                  textCreateAccount,
                                  style: medium.copyWith(
                                      fontSize: 16,
                                      color: createAccountTextColor),
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
                Padding(
                  padding: const EdgeInsets.only(left: 320,right: 320),
                  child: Divider(
                    height: 2,
                    color: dividerBorderColor,
                  ),
                ),
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
        ),
      ),
    );
  }
}
