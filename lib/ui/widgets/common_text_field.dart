import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CommonTextFieldWidget extends StatefulWidget {
  String? hintText;
  TextStyle? hintTextStyle;
  TextEditingController? controller;
  TextStyle? textStyle;
  double? borderRadius;
  Function? onChanged;
  int? maxLength;
  int? maxLines;
  int? minLines;
  bool? autofocus;
  TextInputAction? textInputAction;
  Function? onChangeComplete;
  FocusNode? focusNode;
  Function? onSubmit;
  TextInputType? textInputType;
  Widget? rightIcon;
  BoxConstraints? rightIconConstraints;
  Color? rightIconColor;
  Widget? leftIcon;
  BoxConstraints? leftIconConstraints;
  Color? leftIconColor;
  String? label;
  bool showCursor;
  Decoration? decoration;
  List<TextInputFormatter>? textInputFormatters;
  String? errorText;
  bool? obscureText;
  final FormFieldValidator<String>? validator;

  CommonTextFieldWidget(
      {super.key,
      this.controller,
      this.rightIcon,
      this.textStyle,
      this.hintText,
      this.minLines,
      this.onSubmit,
      this.textInputAction,
      this.borderRadius,
      this.hintTextStyle,
      this.focusNode,
      this.autofocus,
      this.onChangeComplete,
      this.onChanged,
      this.textInputType,
      this.maxLines,
      this.maxLength,
      this.rightIconColor,
      this.rightIconConstraints,
      this.leftIcon,
      this.label,
      this.decoration,
      this.leftIconColor,
      this.leftIconConstraints,
      this.showCursor = true,
      this.errorText,
      this.validator,
      this.textInputFormatters,
      this.obscureText});

  @override
  State<CommonTextFieldWidget> createState() => _CommonTextFieldWidgetState();
}

class _CommonTextFieldWidgetState extends State<CommonTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: Get.height * 0.12,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.label ?? "Label",
          style: GoogleFonts.rocknRollOne(
            textStyle: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Material(
          color: Colors.transparent,
          child: TextField(
            obscureText: widget.obscureText ?? false,
            focusNode: widget.focusNode,
            style: Theme.of(context).textTheme.titleMedium,
            controller: widget.controller,
            maxLength: widget.maxLength,
            onChanged: (value) {
              HapticFeedback.selectionClick();
              widget.onChanged?.call();
            },
            autofocus: widget.autofocus ?? false,
            selectionHeightStyle: BoxHeightStyle.max,
            buildCounter: null,
            maxLines: widget.maxLines ?? 1,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: widget.textInputType,
            inputFormatters: widget.textInputFormatters,
            textInputAction: widget.textInputAction,
            showCursor: widget.showCursor,
            onSubmitted: (value) {
              widget.onSubmit?.call();
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: widget.leftIcon,
              prefixIconConstraints: widget.leftIconConstraints,
              prefixIconColor: widget.leftIconColor,
              suffixIcon: widget.rightIcon,
              suffixIconConstraints: widget.rightIconConstraints,
              suffixIconColor: widget.rightIconColor,
              counterText: "",
              errorText: widget.errorText,
              errorMaxLines: 1,
              errorStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.red),
              hintStyle: widget.hintTextStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
                borderSide: BorderSide(
                  color: Colors.grey[400]!,
                ),
              ),
              // errorBorder: OutlineInputBorder(
              //   borderRadius:
              //       BorderRadius.circular(widget.borderRadius ?? 8.0),
              //   borderSide: const BorderSide(
              //     color: Colors.red,
              //   ),
              // ),
              // focusedErrorBorder: OutlineInputBorder(
              //   borderRadius:
              //       BorderRadius.circular(widget.borderRadius ?? 8.0),
              //   borderSide: const BorderSide(color: Colors.red),
              // ),
            ),
          ),
        ),
      ]),
    );
  }
}
