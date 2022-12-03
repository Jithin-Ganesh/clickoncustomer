import 'package:clickoncustomer/components/elevated-buton.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../models/address.dart';
import '../../../providers/auth.dart';
import '../../../providers/user-provider.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/text-input-formater.dart';

class AddAddressWeb extends StatefulWidget {
  const AddAddressWeb({
    Key? key,
    this.address,
    required this.isEdit,
    this.id,
  }) : super(key: key);
  final Address? address;
  final bool isEdit;
  final int? id;

  @override
  State<AddAddressWeb> createState() => _AddAddressWebState();
}

class _AddAddressWebState extends State<AddAddressWeb> {
  late TextEditingController _address1Controller;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _pinCodeController;
  late TextEditingController _addressLine2Controller;
  late TextEditingController _countryController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _address1Controller = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _cityController = TextEditingController();
    _stateController = TextEditingController();
    _pinCodeController = TextEditingController();
    _addressLine2Controller = TextEditingController();
    _countryController = TextEditingController();
    super.initState();
  }

  //User? user;

  @override
  void didChangeDependencies() {
    if (widget.isEdit) {
      _address1Controller.text = widget.address?.addressLine1 ?? '';
      _address1Controller.text = widget.address?.addressLine1 ?? '';
      _firstNameController.text = widget.address?.firstName ?? '';
      _lastNameController.text = widget.address?.lastName ?? '';
      _cityController.text = widget.address?.city ?? '';
      _stateController.text = widget.address?.state ?? '';
      _pinCodeController.text = widget.address?.pincode ?? '';
      _addressLine2Controller.text = widget.address?.addressLine2 ?? '';
      _countryController.text = widget.address?.country ?? '';
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _pinCodeController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _address1Controller.dispose();
    _addressLine2Controller.dispose();
    _countryController.dispose();
    super.dispose();
  }

  bool enable = true;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Add new Delivery Address ",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: 18, color: priceOffersSubtextColor),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: AddressFiledWeb(
                            controller: _firstNameController,
                            validation: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                            textInputFormatter: [
                              NoLeadingSpaceFormatter(),
                            ],
                            title: "First Name")),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: AddressFiledWeb(
                        validation: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        textInputFormatter: [
                          NoLeadingSpaceFormatter(),
                        ],
                        controller: _lastNameController,
                        title: "Last Name",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: AddressFiledWeb(
                            validation: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              } else if (value.length < 3) {
                                return "Give a Valid Country";
                              }
                              return null;
                            },
                            textInputFormatter: [
                              NoLeadingSpaceFormatter(),
                            ],
                            controller: _countryController,
                            title: "Country / Region")),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: AddressFiledWeb(
                        validation: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else if (value.length < 3) {
                            return "Give a Valid State";
                          }
                          return null;
                        },
                        textInputFormatter: [
                          NoLeadingSpaceFormatter(),
                        ],
                        controller: _stateController,
                        title: "State",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: AddressFiledWeb(
                            validation: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              } else if (value.length < 3) {
                                return "Give a Valid City";
                              }
                              return null;
                            },
                            textInputFormatter: [
                              NoLeadingSpaceFormatter(),
                            ],
                            controller: _cityController,
                            title: "City")),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: 2,
                        child: AddressFiledWeb(
                            validation: (value) {
                              if (value!.isEmpty) {
                                return "Required";
                              } else if (value.length != 6) {
                                return "Give a Valid PinCode";
                              }
                              return null;
                            },
                            textInputFormatter: [
                              LengthLimitingTextInputFormatter(6),
                              NoLeadingSpaceFormatter()
                            ],
                            controller: _pinCodeController,
                            title: "PinCode")),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: AddressFiledWeb(
                          validation: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            } else if (value.length < 5) {
                              return "Give a Valid Address";
                            }
                            return null;
                          },
                          textInputFormatter: [
                            NoLeadingSpaceFormatter(),
                          ],
                          controller: _address1Controller,
                          title: "Address Line 1"),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: AddressFiledWeb(
                          validation: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            } else if (value.length < 5) {
                              return "Give a Valid Address";
                            }
                            return null;
                          },
                          textInputFormatter: [
                            NoLeadingSpaceFormatter(),
                          ],
                          controller: _addressLine2Controller,
                          title: "Address Line 2"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Consumer<AuthProvider>(
                  builder: (context, value, child) {
                    return SizedBox(
                      width: 100,
                      height: 40,
                      child: ButtonElevated(
                        isButtonEnable: true,
                        height: 45,
                        width: 70,
                        buttonTitle: value.isLoading ? 'Loading...' : 'Save',
                        onPressed: value.isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .enableLoading();
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .addUserAddress(
                                          userId: widget.id,
                                          firstName: _firstNameController.text,
                                          lastName: _lastNameController.text,
                                          addressLine1:
                                              _address1Controller.text,
                                          addressLine2:
                                              _addressLine2Controller.text,
                                          state: _stateController.text,
                                          pinCode: _pinCodeController.text,
                                          country: _countryController.text,
                                          city: _cityController.text,
                                          isEdit: widget.isEdit,
                                          addressId: widget.address?.id ?? 0)
                                      .then((value) {
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .fetchAddressList(userID: null)
                                        .then((value) {
                                      widget.isEdit
                                          ? Provider.of<UserProvider>(context,
                                                  listen: false)
                                              .removeAddress()
                                          : null;
                                      setState(() {
                                        Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .disableLoading();
                                        _firstNameController.clear();
                                        _lastNameController.clear();
                                        _address1Controller.clear();
                                        _pinCodeController.clear();
                                        _cityController.clear();
                                        _countryController.clear();
                                        _stateController.clear();
                                        _addressLine2Controller.clear();
                                      });
                                    }).then((value) => Navigator.pop(context));
                                  });
                                }
                              },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isEmail(String input) => EmailValidator.validate(input);
}

class AddressFiledWeb extends StatelessWidget {
  const AddressFiledWeb({
    Key? key,
    required this.title,
    this.controller,
    this.textInputFormatter,
    this.validation,
  }) : super(key: key);
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController? controller;
  final String title;
  final String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontSize: 12, color: accentColor),
        ),
        const SizedBox(
          height: 10,
        ),
        InputTextField(
          controller: controller,
          textInputFormatter: textInputFormatter,
          hintText: "Enter Here",
          validator: validation,
        ),
      ],
    );
  }
}

class InputTextField extends StatefulWidget {
  const InputTextField({
    Key? key,
    this.textInputFormatter,
    this.onChanged,
    this.validator,
    this.controller,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.onTap,
    this.readOnly = false,
    this.maxLine,
    this.keyBoardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.words,
    this.suffixIcon,
    this.initialValue,
    this.textInputAction = TextInputAction.next,
    this.height,
    this.mobileBorderColor = hintColor,
    this.style,
    this.maxLength = 500,
    this.inputDecoration,
  }) : super(key: key);

  final TextEditingController? controller;
  final int maxLength;
  final String? Function(String?)? validator;
  final String? hintText;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? textInputFormatter;
  final String? labelText;
  final String? initialValue;
  final Function()? onTap;
  final bool readOnly;
  final int? maxLine;
  final TextInputType keyBoardType;
  final TextCapitalization textCapitalization;
  final IconButton? suffixIcon;
  final bool? obscureText;
  final TextInputAction textInputAction;
  final double? height;
  final Color mobileBorderColor;
  final TextStyle? style;
  final InputDecoration? inputDecoration;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        maxLength: widget.maxLength,
        controller: widget.controller,
        focusNode: focusNode,
        keyboardType: widget.keyBoardType,
        cursorWidth: 1.0,
        onChanged: widget.onChanged,
        inputFormatters: widget.textInputFormatter,
        textInputAction: widget.textInputAction,
        readOnly: widget.readOnly,
        maxLines: widget.maxLine,
        textAlignVertical: TextAlignVertical.center,
        style: widget.style,
        cursorColor: Theme.of(context).dividerColor,
        validator: widget.validator,
        onTap: widget.onTap,
        obscureText: widget.obscureText ?? false,
        textCapitalization: widget.textCapitalization,
        decoration: widget.inputDecoration ??
            InputDecoration(
              counterText: '',
              // contentPadding:Edge,
              isDense: true,
              suffixIcon: widget.suffixIcon,
              labelText: widget.labelText,
              labelStyle: Theme.of(context).textTheme.subtitle1,

              filled: false,
              hintText: widget.hintText,
              fillColor: bgBoxColor,
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(36),
                  borderSide: BorderSide.none),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(36),
                  borderSide: BorderSide.none),
              hintStyle: Theme.of(context).textTheme.caption,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(36),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(36),
                  borderSide: BorderSide.none),
            ),
      ),
    );
  }
}
