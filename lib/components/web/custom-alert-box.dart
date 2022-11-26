import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../elevated-buton.dart';

Future<void> showMyDialog(
    {required BuildContext screenContext, required String buttonName, required String title, required String contentText, required VoidCallback onConfirm}) async {
  return showDialog<void>(
    context: screenContext,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        contentPadding: const EdgeInsets.all(15),
        actionsPadding: const EdgeInsets.all(25),
        title: Center(
          child: Text(
              title,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: accentColor,fontSize: 18)),
        ),
        content: Container(
          width: double.infinity,
          //height : MediaQuery.of(context).size.height*0.2,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Text(contentText,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: accentColor,
                        fontSize: 14)),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          ButtonElevated(
            elevation: 0,
            buttonTitle: buttonName,
            // onPressed: (){
            //   Provider.of<AuthProvider>(context, listen: false).logOut(screenContext);
            // },
            onPressed: onConfirm,
            isButtonEnable: true,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.15,
            height:  50,
            radius: 10,
            textStyle: Theme
                .of(context)
                .textTheme
                .headline5?.copyWith(fontSize:  12),
          ),
          const SizedBox(width: 20,),

          ButtonElevated(
            elevation: 0,
            buttonTitle: "Cancel",
            textStyle: Theme
                .of(context)
                .textTheme
                .headline5
                ?.copyWith(fontSize:  12),
            foregroundColor: primaryColor,
            color: bgBoxColor,
            isButtonEnable: true,
            onPressed: () {
              Navigator.pop(context);
            },
            radius: 10,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.15,
            height:  50,
            // borderColor: primaryColor,
          ),
        ],
      );
    },
  );
}
