import 'package:clickoncustomer/utils/constants/fontStyles/kanit.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';

class TemplateLandingAppbar extends StatefulWidget {
  const TemplateLandingAppbar({Key? key}) : super(key: key);

  @override
  State<TemplateLandingAppbar> createState() => _TemplateLandingAppbarState();
}

class _TemplateLandingAppbarState extends State<TemplateLandingAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        primary: false,
        backgroundColor: templateBgColor,
        elevation: 2,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.062,
              right: MediaQuery.of(context).size.width * 0.0598,
              top: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ImgProvider(
                color: templateBgColor,
                url: "assets/images/dummy/multicart.png",
                width: 74,
                height: 40,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.search,
                    size: 16,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Text(
                    "Search",
                    style:
                        sansMedium.copyWith(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  const Icon(
                    Icons.sort,
                    size: 16,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "MENU",
                    style:
                        sansMedium.copyWith(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                            color: dividerColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                          size: 15,
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 30,
                        child: Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6, top: 4),
                              child: Text(
                                "04",
                                style: sansMedium.copyWith(
                                    fontSize: 12, color: Colors.white),
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
