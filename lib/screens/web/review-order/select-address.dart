import 'package:clickoncustomer/components/elevated-buton.dart';
import 'package:clickoncustomer/providers/user-provider.dart';
import 'package:clickoncustomer/screens/web/review-order/add-address.dart';
import 'package:clickoncustomer/screens/web/review-order/address-list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/img-provider.dart';


class AddressListAlertBox extends StatelessWidget {
  const AddressListAlertBox({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Stack(
        children: [
          Positioned(
            top: 0,
            right: 10,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },

              child: const Icon(Icons.close,size: 18,),
            ),
          ),
          Row(
            children: [
              const Text(
                'Address List',
              ),
              Spacer(),
              ButtonElevated(
                buttonTitle: 'Add New Address',
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: AddAddressWeb(isEdit: false,),
                        );
                      });
                },
                height: 50,
                width: MediaQuery.of(context).size.width * 0.1,
              )
            ],
          ),
        ],
      ),
      titleTextStyle: Theme.of(context)
          .textTheme
          .headline1
          ?.copyWith(fontSize: 20),
      content: SizedBox(
        height: MediaQuery.of(context).size.height *
            0.7,
        width:
        MediaQuery.of(context).size.width * 0.6,
        child: Expanded(
          child: Consumer<UserProvider>(builder: (context, value, child) =>AddressListView(
             addresses: value.addressList,
           ),),
        ),
      ),
    );
  }
}