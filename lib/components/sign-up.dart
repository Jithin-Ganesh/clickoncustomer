import 'package:clickoncustomer/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../utils/constants/color.dart';

import '../utils/constants/fontstyles.dart';
import '../utils/constants/images.dart';
import '../utils/constants/strings.dart';
import '../utils/img-provider.dart';
import '../screens/otp-screen.dart';
import '../utils/toast-message.dart';

class SignUp extends StatefulWidget {
  static const routeName = "/signup";
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController phoneController;
  late TextEditingController firstNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    firstNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUp() {
    // Provider.of<AuthProvider>(context, listen: false).enableLoading();
    Provider.of<AuthProvider>(context, listen: false)
        .signUp(phone: phoneController.text,password: passwordController.text,email: emailController.text,firstName: firstNameController.text,lastName: '')
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
                const SizedBox(
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
                      height: 610,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 48.91, left: 44.17),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      textLogin,
                                      style: medium.copyWith(
                                          fontSize: 24, color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 18.19,
                                    ),
                                    Text(
                                      textGreatDeals,
                                      style: regular.copyWith(
                                          fontSize: 34, color: Colors.white),
                                    ),
                                  ])),
                          const SizedBox(
                            height: 97,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.58, right: 36.83),
                            child: Column(
                              children: [
                                ImgProvider(
                                  url: logoImage,
                                  color: primaryColor,
                                  width: 246,
                                  height: 221,
                                ),
                                const SizedBox(
                                  height: 34,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 533,
                      height: 610,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 36,
                          ),
                          ImgProvider(
                            url: clickUpLogoImage,
                            width: 70,
                            height: 43,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          ImgProvider(
                            url: clickOnOffersImage,
                            width: 97,
                            height: 9.91,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 47,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 91,right: 91),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 350,
                                  child: TextFormField(
                                    autofocus: true,
                                    controller: firstNameController,validator: (value) {
                                    if (value?.isEmpty ?? false) {
                                      return 'Please enter the First name.';
                                    }
                                    return null;
                                  },
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
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "+91",enabled: false,
                                          hintStyle: regular.copyWith(
                                              fontSize: 14, color: numberColor),
                                          border: const OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: textFormFieldBorderColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    SizedBox(
                                      width: 268,
                                      child: TextFormField(
                                        textAlign: TextAlign.start,
                                        controller: phoneController,validator: (value) {
                                        if (value?.isEmpty ?? false) {
                                          return 'Please enter the Phone Number.';
                                        }
                                        return null;
                                      },
                                        decoration: InputDecoration(
                                          hintText: textMobileNumber,
                                          hintStyle: thin.copyWith(
                                              fontSize: 14, color: numberColor),
                                          border: const OutlineInputBorder(
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
                                const SizedBox(
                                  height: 14,
                                ),
                                Container(
                                  width: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    controller: emailController,validator: (value) {
                                    if (value?.isEmpty ?? false) {
                                      return 'Please enter the Email.';
                                    }
                                    return null;
                                  },
                                      decoration: InputDecoration(
                                    hintText: textEmailLogin,
                                    hintStyle:
                                        thin.copyWith(fontSize: 14, color: numberColor),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: textFormFieldBorderColor),
                                    ),
                                  )),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Container(
                                  width: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextFormField(
                                    controller: passwordController,
                                      validator: (value) {
                                        if (value?.isEmpty ?? value!.length < 6 ) {
                                          return 'Please enter a valid Password.';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                    hintText: textPassword,
                                    hintStyle:
                                        thin.copyWith(fontSize: 14, color: numberColor),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: textFormFieldBorderColor),
                                    ),
                                  )),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  textPasswordMinLength,
                                  style: regular.copyWith(color: passColor),
                                ),
                                const SizedBox(
                                  height: 27,
                                ),
                                Container(
                                  width: 350,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if(_formKey.currentState!.validate()){
                                          signUp();
                                        }
                                      },
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
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textAlreadyHaveAnAccount,
                                style: regular.copyWith(
                                    fontSize: 14, color: numberColor),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              TextButton(onPressed: () { Navigator.pushNamed(context, LoginScreen.routeName); },
                              child: Text(  textSignIn,
                                style: regular.copyWith(
                                    fontSize: 14, color: primaryColor),),

                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 157,
                ),
                const SizedBox(
                    width: 841,
                    child: Divider(
                      height: 1,
                      color: dividerBorderColor,
                    )),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textRights,
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(
                      width: 265,
                    ),
                    Text(
                      textPrivacyPolicy,
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      textLegalPolicy,
                      style: thin.copyWith(fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(
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
