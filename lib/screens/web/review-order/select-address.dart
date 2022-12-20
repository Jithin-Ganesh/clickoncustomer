import 'package:clickoncustomer/components/elevated-buton.dart';
import 'package:clickoncustomer/providers/user-provider.dart';
import 'package:clickoncustomer/screens/web/review-order/add-address.dart';
import 'package:clickoncustomer/screens/web/review-order/address-list.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
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
      title: Padding(
        padding: const EdgeInsets.only(left: 50,right: 50),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Spacer(),
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.close,size: 14,)),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
               Text(
                  'Address List',style: bold,
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
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.07,
                )
              ],
            ),
          ],
        ),
      ),
      titleTextStyle: Theme.of(context)
          .textTheme
          .headline2
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