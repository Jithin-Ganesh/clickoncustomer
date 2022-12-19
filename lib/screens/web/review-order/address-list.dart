import 'package:clickoncustomer/components/elevated-buton.dart';
import 'package:clickoncustomer/models/address.dart';
import 'package:clickoncustomer/providers/user-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/fontstyles.dart';

class AddressListView extends StatelessWidget {
  final List<Address>? addresses;
  const AddressListView({Key? key, this.addresses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 50),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: addresses?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Expanded(
              child: SizedBox(
            child: AddressCard(
              address: addresses?[index],
              index: index,
            ),
            width: MediaQuery.of(context).size.width * 0.8,
          )),
        );
      },
    );
    ;
  }
}

class AddressCard extends StatelessWidget {
  final Address? address;
  final int index;
  const AddressCard({Key? key, required this.address, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) => Container(
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
        width: MediaQuery.of(context).size.width * 9,
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                address?.getFullAddress() ?? '',
                style:
                    bold.copyWith(fontSize: 15, color: priceOffersSubtextColor),
              ),
              value.isAddressSelected(address?.id)
                  ? ButtonElevated(
                      onPressed: () {
                        value.removeAddress();
                      },
                      isButtonEnable: true,
                      buttonTitle: 'Deliver here',
                color: Colors.greenAccent,
                foregroundColor: Colors.greenAccent,
                      width: MediaQuery.of(context).size.width * 0.072,
                      height: 45,
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.072,
                      height: 45,
                      child: OutlinedButton(
                          style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all<Color>(shadowColor2),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          onPressed: () {
                            value.selectAddress(address);
                          },
                          child: Text(
                            'Deliver Here',
                            style: bold.copyWith(
                                fontSize: 14,
                                color: productDetailsScreenTextColor),
                          )),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
