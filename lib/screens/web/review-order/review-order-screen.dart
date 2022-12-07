import 'package:clickoncustomer/components/checkout_component.dart';
import 'package:clickoncustomer/components/web/bottom-web-bar-2.dart';
import 'package:clickoncustomer/components/web/zig-zag-sheet.dart';
import 'package:clickoncustomer/providers/user-provider.dart';
import 'package:clickoncustomer/screens/web/review-order/select-address.dart';
import 'package:clickoncustomer/screens/web/review-order/stepper.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/payment_item.dart';
import '../../../components/web/WebNavBar2.dart';
import '../../../models/address.dart';
import '../../../models/user.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/decoration.dart';
import '../../../utils/constants/fontstyles.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/img-provider.dart';

class ReviewOrderScreenWeb extends StatefulWidget {
  static const routeName = '/review-order-screen-web';
  const ReviewOrderScreenWeb({Key? key, this.user}) : super(key: key);
final User? user;
  @override
  _ReviewOrderScreenWebState createState() => _ReviewOrderScreenWebState();
}

class _ReviewOrderScreenWebState extends State<ReviewOrderScreenWeb> {
  final List<String> items = [
    'Address 1',
    'Address 2',
    'Address 3',
  ];

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<UserProvider>(context,listen: false).fetchAddressList(userID:widget.user?.id );

    Provider.of<UserProvider>(context,listen: false).fetchUserProfile(id: null );
    super.initState();
  }

  String selectedValue = 'Address 1';
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
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.083,
                right: MediaQuery.of(context).size.width * 0.083,
                top: 60),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<UserProvider>(builder: (context, value, child) => Column(
                        children: [
                          const Checkout(
                              title: 'Account',
                              text: 'ID: kvsanz',
                              isAccount: true,
                              isProcessing: false,
                              isSubmit: true),
                          const SizedBox(
                            height: 14,
                          ),
                          DeliveryAddress(context),
                          // const SizedBox(
                          //   height: 14,
                          // ),
                          // const StepperReview(),
                          const SizedBox(
                            height: 14,
                          ),
                          value.selectedAddress == null ? PaymentTile() :  PaymentItem(
                              imageIcon: 'assets/images/icon-book-mark.png',
                              title: 'Demo',
                              isCvv: true,
                              isPay: true)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.0182,
                    ),
                    const ZigZagSheet(isCoupon: true)
                  ],
                ),
                const SizedBox(
                  height: 218,
                ),
                const BottomWebBar2()
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
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
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
                                    Container(
                                      height: 55,
                                      width: 655,
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 71,
                                          ),
                                          Expanded(
                                            child: Text(
                                              value.selectedAddress?.getFullAddress() ?? 'No Address Selected',
                                              style: thin.copyWith(
                                                  color: productSubTextColor),
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
                                  width:  MediaQuery.of(context).size.width * 0.072,
                                  height: 45,
                                  child: OutlinedButton(
                                      style: ButtonStyle(
                                        shadowColor: MaterialStateProperty.all<Color>(shadowColor2),
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0))),
                                      ),
                                      onPressed: (){
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                                child: AddressListAlertBox( ),
                                              );
                                            });
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

class PaymentTile extends StatelessWidget {
  const PaymentTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
        child: const PaymentTitle(
            title: 'Payment',
            isProcessing: false,
            isSubmit: false,
            slNumber: '3'),
      ),
    );
  }
}
