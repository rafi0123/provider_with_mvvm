import 'package:flutter/material.dart';
import '../../utils/app_color.dart';

// ignore: must_be_immutable
class TextFieldComponent extends StatelessWidget {
  TextFieldComponent(
      {super.key,
      this.validator,
      this.controller,
      this.keyBordType = TextInputType.name,
      this.suffixIcon,
      this.prefixIcon,
      this.fillColor = kWhite,
      this.isborder = true,
      required this.hintText,
      this.onFieldSubmited,
      this.focusNode,
      this.isDense = false,
      this.hPadding = 10,
      this.vPadding = 15,
      this.isObsecure = false});

  String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType keyBordType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color fillColor;
  final bool isborder;
  final String hintText;
  final bool? isObsecure;
  final bool? isDense;
  final double hPadding;
  final double vPadding;
  final Function(String)? onFieldSubmited;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isObsecure!,
      onFieldSubmitted: onFieldSubmited,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: fillColor,
        isDense: isDense,
        contentPadding:
            EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
        border: isborder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: kBorderColor))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
        enabledBorder: isborder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: kBorderColor))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kBorderColor)),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
