import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpEditingController extends StatefulWidget {
  const OtpEditingController({
    Key? key,
    this.textColor = Colors.black,
    required this.otpController,
    required this.onOtpFieldChanged,
    required this.isOtpFilled,
    required this.onOtpCompleted,

    //default assignment
  }) : super(key: key);

  final Color textColor;
  final OtpFieldController otpController;
  final void Function(bool) onOtpFieldChanged;
  final void Function(String) onOtpCompleted;
  final bool isOtpFilled;
  // int get length => 6;

  @override
  State<OtpEditingController> createState() => _OtpEditingControllerState();
}

class _OtpEditingControllerState extends State<OtpEditingController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        OTPTextField(width: 200,
          controller: widget.otpController,
          length: 4,
          fieldWidth: 39,
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.box,
          style: const TextStyle(fontSize: 12),
          onChanged: (pin) {
            widget.onOtpFieldChanged(pin.length == 4);
          },
          onCompleted: (pin) {
            widget.onOtpCompleted(pin);

            log("success");
          },
          keyboardType: TextInputType.number,
          inputFormatter: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ],
    );
  }
}
