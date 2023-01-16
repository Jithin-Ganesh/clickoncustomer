import 'package:clickoncustomer/components/web/custom-alert-box.dart';
import 'package:clickoncustomer/models/order_review_model.dart';
import 'package:clickoncustomer/providers/order.dart';
import 'package:clickoncustomer/utils/constants/color.dart';

import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/web/account-order/account-order-screen.dart';
import '../screens/web/order-details/order-details-screen.dart';
import '../utils/constants/fontstyles.dart';

class YourOrder extends StatefulWidget {
  YourOrder(
      {Key? key,
      this.selectedValue,
      this.order,
      required this.firstIcon,
      required this.isArriving,
      required this.buttonStatus,
      required this.buttonText1,
      required this.buttonText2,
      required this.itemImage,
      required this.secondIcon,
      this.onPressed})
      : super(key: key);

  late final String? selectedValue;
  final OrderReviewModel? order;
  final bool buttonStatus;
  final String buttonText1;
  final String buttonText2;
  final String firstIcon;
  final String secondIcon;

  final String itemImage;

  final bool isArriving;
  final VoidCallback? onPressed;

  @override
  State<YourOrder> createState() => _YourOrderState();
}

class _YourOrderState extends State<YourOrder> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(

        height: 217,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: canvasColor),
        child: Padding(
          padding: const EdgeInsets.only(right: 42, left: 24, top: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ImgProvider(
                            url: widget.firstIcon,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Ordered on ${widget.order?.date}',
                            style: medium.copyWith(
                                fontSize: 18,
                                color: widget.isArriving
                                    ? primaryColor
                                    : checkedItemsColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                      widget.order?.status?.value ?? "",
                        style: medium.copyWith(
                            fontSize: 18,
                            color: widget.order?.status == 1
                                ? Colors.orangeAccent
                                : checkedItemsColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ImgProvider(
                            url: widget.secondIcon,
                            width: 10,
                            height: 10,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Expected Delivery on ${widget.order?.expectedDate}',
                            style: regular.copyWith(
                                fontSize: 14,
                                color: widget.isArriving
                                    ? deliveryDateColor
                                    : priceDetailsSubTextColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      Row(
                        children: [
                          ImgProvider(
                            url: widget.order?.thumbnail ?? '',
                            width: 90,
                            height: 71,
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                // width:
                                //     MediaQuery.of(context).size.width * 0.304,
                                child: Text(
                                  widget.order?.productName ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: regular.copyWith(
                                      fontSize: 14,
                                      color: orderPlacedTextColor),
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Text(textRupees),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    widget.order?.netTotal.toString() ?? "",
                                    style: medium.copyWith(
                                        fontSize: 17,
                                        color: productDetailsScreenTextColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Order : ${widget.order?.referenceNumber}',
                    style: regular.copyWith(
                        fontSize: 14, color: priceDetailsSubTextColor),
                  ),
                  SizedBox(
                    width: 42,
                  ),
                  Text(textOrderPlaced,
                      style: regular.copyWith(
                          fontSize: 14, color: orderPlacedTextColor)),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 10,
                    color: productAvailabilityColor,
                  ),
                  SizedBox(
                    width: 33,
                  ),
                  Text(textShipTo,
                      style: regular.copyWith(
                          fontSize: 14, color: orderPlacedTextColor)),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 10,
                    color: productAvailabilityColor,
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  ImgProvider(
                    url: "assets/images/img_34.png",
                    width: 18,
                    height: 18,
                    border: Border.all(color: vectorColor),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        width:215,
                        height: 38,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(OrderDetailsScreenWeb.routeName,
                                    arguments: OrderDetailsScreenWeb(
                                      id: widget.order?.id ?? 0,
                                    ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                textViewOrderDetails,
                                style: medium.copyWith(
                                    fontSize: 14,
                                    color: productDetailsScreenTextColor),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: productDetailsScreenTextColor,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 215,
                        height: 38,
                        decoration: BoxDecoration(
                            color: widget.buttonStatus ? primaryColor : Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            textAlign: TextAlign.center,
                            widget.buttonText1,
                            style: medium.copyWith(
                                fontSize: 14,
                                color: widget.buttonStatus ? Colors.white : passColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 215,
                        height: 38,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: OutlinedButton(
                          onPressed: () {
                            showMyDialog(
                                screenContext: context,
                                buttonName: "Yes",
                                onConfirm: () {
                                  Provider.of<OrderProvider>(context, listen: false).orderCancel(cancellationReason: "", orderId: widget.order?.id).then((value) => Navigator.pushNamed(context, AccountOrderScreenWeb.routeName));
                                },
                                title: "Cancel!",
                                contentText: "Do you really want to cancel");

                          },
                          child: Text(
                            textAlign: TextAlign.center,
                            widget.buttonText2,
                            style: medium.copyWith(
                                fontSize: 14,
                                color: productDetailsScreenTextColor),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
