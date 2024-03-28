import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText, hintText;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final bool readOnly;
  final int? maxLength;
  final int? maxLines;
  final FocusNode? focusNode;
  final bool enabled;
  final bool isOutline;
  final Widget? prefixIcon;

  const CustomTextField({
    this.controller,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefix,
    this.obscureText = false,
    this.padding,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.onTap,
    this.readOnly = false,
    this.enabled = true,
    this.isOutline = false,
    super.key,
    this.inputFormatters,
    this.maxLength,
    this.maxLines,
    this.focusNode,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: 20.sp),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        focusNode: focusNode,
        maxLength: maxLength,
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        onFieldSubmitted: onSubmitted,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onTap: onTap,
        readOnly: readOnly,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hintText,
          prefix: prefix,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: border(),
          enabledBorder: border(),
          errorBorder: border(color: Colors.red),
          focusedBorder: border(color: primaryColor),
          hintStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.normal),
          contentPadding: EdgeInsets.all(18.sp),
        ),
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.normal),
      ),
    );
  }
}

InputBorder border({Color? color}) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.sp),
    borderSide:
        BorderSide(color: color ?? borderColor, style: BorderStyle.solid));

class CustomDropDown extends StatelessWidget {
  final List<DropdownMenuItem> items;
  final Function(dynamic) onChanged;
  final String? labelText, hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? padding;
  const CustomDropDown(
      {required this.items,
      required this.onChanged,
      this.hintText,
      this.labelText,
      this.suffixIcon,
      this.padding,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.sp),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: border(),
          focusedBorder: border(),
          enabledBorder: border(),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.normal),
          contentPadding: EdgeInsets.all(17.sp),
          suffixIcon: suffixIcon,
        ),
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.normal),
        items: items,
        isExpanded: true,
        onChanged: onChanged,
      ),
    );
  }

  InputBorder border({Color? color}) => OutlineInputBorder(
        borderSide: BorderSide(color: color ?? borderColor),
        borderRadius: BorderRadius.circular(10.sp),
      );
}
