import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CommonButtonWidget extends StatefulWidget {
  double? height;
  double? width;
  Color? borderColor;
  String label;
  bool? isEnabled;
  TextStyle? labelTextStyle;
  Function onTap;

  CommonButtonWidget(
      {super.key,
      required this.label,
      required this.onTap,
      this.labelTextStyle,
      this.height,
      this.width,
      this.borderColor,
      this.isEnabled});

  @override
  State<CommonButtonWidget> createState() => _CommonButtonWidgetState();
}

class _CommonButtonWidgetState extends State<CommonButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isEnabled ?? false) {
          HapticFeedback.selectionClick();
          widget.onTap();
        }
      },
      child: Container(
        height: Get.height * 0.06,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
            color: (widget.isEnabled ?? false)
                ? Colors.black
                : Colors.grey.shade600,
            borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: Text(widget.label,
              style: GoogleFonts.rocknRollOne(
                textStyle: widget.labelTextStyle ??
                    Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
              )),
        ),
      ),
    );
  }
}
