import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {this.inputFormatters,
      this.onFieldSubmitted,
      this.controller,
      this.focusNode,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.cursorColor = AppColors.black,
      this.textAlignVertical = TextAlignVertical.center,
      this.textAlign = TextAlign.start,
      this.onChanged,
      this.maxLines = 1,
      this.validator,
      this.labelText,
      this.hindText,
      this.textStyle,
      this.fillColor = AppColors.blueLight,
      this.suffixIcon,
      this.suffixIconColor,
      this.fieldBorderRadius,
      this.fieldBorderColor = const Color(0xffE7F0FD),
      this.isPassword = false,
      this.isPrefixIcon = true,
      this.readOnly = false,
      this.maxLength,
      super.key,
      this.prefixIcon,
      this.onTap,
      this.horizontal,
      this.isEnabled = true,
      this.vertical});

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color cursorColor;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final int? maxLines;

  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final FormFieldValidator? validator;
  final String? labelText;
  final String? hindText;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? fieldBorderRadius;
  final double? vertical;
  final double? horizontal;
  final VoidCallback? onTap;

  final Color fieldBorderColor;
  final bool isPassword;
  final bool isPrefixIcon;
  final bool isEnabled;
  final bool readOnly;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      inputFormatters: widget.inputFormatters,
      onFieldSubmitted: widget.onFieldSubmitted,
      readOnly: widget.readOnly,
      controller: widget.controller,
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      textInputAction: widget.keyboardType == TextInputType.none
          ? TextInputAction.none
          : widget.textInputAction,
      cursorColor: widget.cursorColor,
      style: widget.textStyle,
      textAlign: widget.textAlign,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      obscureText: widget.isPassword ? obscureText : false,
      validator: widget.validator,
      enabled: widget.isEnabled,
      showCursor: widget.keyboardType == TextInputType.none ? false : true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: widget.vertical ?? 16.h,
            horizontal: widget.horizontal ?? 14.w),
        labelText: widget.labelText,
        hintText: widget.hindText,
        labelStyle: widget.textStyle,
        hintStyle: widget.textStyle,
        fillColor: widget.fillColor,
        filled: true,

        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: toggle,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  child: obscureText
                      ? Icon(
                          Icons.visibility_off_outlined,
                          size: 20.sp,
                          color: widget.cursorColor,
                        )
                      : Icon(
                          Icons.visibility_outlined,
                          color: widget.cursorColor,
                          size: 20.sp,
                        ),
                ),
              )
            : widget.suffixIcon,
        suffixIconColor: widget.suffixIconColor,
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(widget.fieldBorderRadius ?? 16.r),
            borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
            gapPadding: 0),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(widget.fieldBorderRadius ?? 16.r),
            borderSide:
                const BorderSide(color: AppColors.secondPrimary, width: 1),
            gapPadding: 0),
        enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(widget.fieldBorderRadius ?? 16.r),
            borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
            gapPadding: 0),
      ),
    );
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
