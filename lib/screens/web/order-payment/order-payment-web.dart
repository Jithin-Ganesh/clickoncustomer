import 'package:clickoncustomer/components/payment_item.dart';
import 'package:clickoncustomer/screens/web/review-order/address-list.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/checkout_component.dart';
import '../../../components/web/WebNavBar2.dart';
import '../../../components/web/zig-zag-sheet.dart';
import '../../../models/address.dart';
import '../../../models/user.dart';
import '../../../providers/cart-provider.dart';
import '../../../providers/user-provider.dart';
import '../../../utils/constants/color.dart';

import '../../../utils/constants/fontStyles/kanit.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/img-provider.dart';
import '../../../utils/pref_utils.dart';
import '../review-order/add-address.dart';
import '../review-order/select-address.dart';

class PaymentOrderScreenWeb extends StatefulWidget {
  static const routeName = '/payment-order-screen-web';

  const PaymentOrderScreenWeb({
    Key? key,
  }) : super(key: key);

  @override
  _PaymentOrderScreenWebState createState() => _PaymentOrderScreenWebState();
}

class _PaymentOrderScreenWebState extends State<PaymentOrderScreenWeb> {
  final List<String> items = [
    'Address 1',
    'Address 2',
    'Address 3',
  ];

  String selectedValue = 'Address 1';
@override
  void initState() {
    // TODO: implement initState
  Provider.of<UserProvider>(context, listen: false)
      .fetchUserProfile(id: PrefUtils().getUserId());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: const Center(
        child: ImgProvider(
          url: "assets/images/clickOn-logo.png",
          height: 100,
          width: 200,
        ),
      ),
      mobile: const Center(
        child: ImgProvider(
          url: "assets/images/clickOn-logo.png",
          height: 100,
          width: 200,
        ),
      ),
      desktop: Scaffold(
        backgroundColor: bgColor2,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(175), child: WebNavBar2()),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.083,
                vertical: 60),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Consumer<UserProvider>(
                          builder: (context, value, child) => Checkout(
                              title: 'Account',
                              text: value.user?.firstName ?? 'asd',
                              email: value.user?.email,
                              isAccount: true,
                              isProcessing: false,
                              isSubmit: true),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        DeliveryAddress(context),
                        const SizedBox(
                          height: 14,
                        ),
                        Consumer<CartProvider>(builder: (context, value, child) => Checkout(
                            title: 'Review Order',
                            text: '${value.onlineProductList.length.toString()} Items',
                            isAccount: false,
                            isSubmit: true,buttonTitle: 'Edit Items',
                            isProcessing: false,onPressed: (){
                              Navigator.pop(context);
                        },
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const PaymentItem(
                            imageIcon: 'assets/images/icon-book-mark.png',
                            title: 'Demo',
                            isCvv: true,
                            isPay: true)
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.0182,
                    ),
                    const ZigZagSheet(isCoupon: true)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container DeliveryAddress(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: canvasColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.622,
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.009,
            top: MediaQuery.of(context).size.width * 0.0119,
            right: 23,
            bottom: 30),
        child: Consumer<UserProvider>(
          builder: (context, value, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PaymentTitle(
                    title: 'Delivery Address',
                    isProcessing: false,
                    isSubmit: true,
                    slNumber: '0',
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  SizedBox(
                    height: 55,
                    width: 655,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 71,
                        ),
                        Expanded(
                          child: Text(
                            value.selectedAddress?.getFullAddress() ??
                                'No Address Selected',
                            style: thin.copyWith(color: productSubTextColor),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.072,
                height: 45,
                child: OutlinedButton(
                    style: ButtonStyle(
                      shadowColor:
                          MaterialStateProperty.all<Color>(shadowColor2),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                    ),
                    onPressed: () {
                      if (value.addressList != null) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.0),
                                child: AddressListAlertBox(),
                              );
                            });
                      } else if (value.addressList == null) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: AddAddressWeb(
                                  isEdit: false,
                                ),
                              );
                            });
                      }
                    },
                    child: Text(
                      textChange,
                      style: medium.copyWith(
                          fontSize: 14, color: productDetailsScreenTextColor),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
