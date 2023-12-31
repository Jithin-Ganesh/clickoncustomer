import 'package:clickoncustomer/utils/constants/decoration.dart';
import 'package:clickoncustomer/utils/img-provider.dart';


import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';import '../../utils/constants/fontStyles/kanit.dart';
import '../../utils/constants/themes.dart';

class AccountTitleBar extends StatefulWidget {
  final String title;
  final String? subTitle;
  final bool isYourOrder;
  const AccountTitleBar({Key? key, required this.title, this.isYourOrder = false,  this.subTitle}) : super(key: key);

  @override
  State<AccountTitleBar> createState() => _AccountTitleBarState();
}

class _AccountTitleBarState extends State<AccountTitleBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Your Account ›',style: accountPathTextStyle,),
                  const SizedBox(width: 12,),
                  Text(widget.subTitle ?? '',style: accountPathTextStyle,),
                ],
              ),
              const SizedBox(height: 7,),
              Text(
                widget.title,
                style: accountTitleStyle,
              ),
            ],
          ),
          widget.isYourOrder ? Row(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.305,
                child: Material(
                  elevation: 3.0,
                  shadowColor: shadowColor2,
                  borderRadius: BorderRadius.circular(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      // prefixIconConstraints:
                      //     BoxConstraints.tight(Size.fromWidth(13)),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/images/searchIcon.png',
                            width: 13,
                            height: 13,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        // border: InputBorder.none,
                        hintText: 'Search all your orders',
                        filled: true,
                        hintStyle: thin,
                        fillColor: canvasColor),
                  ),
                ),
              ),
              const SizedBox(width: 8,),
              Container(
                height: 50,
                width: 50,
                decoration: containerDecoration,
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: ImgProvider(
                    url: 'assets/images/icon-filter.png',
                    height: 20,
                    width: 25,
                  ),
                ),
              )
            ],
          ) : const SizedBox(width: 0,)

        ],
      ),
    );
  }
}
