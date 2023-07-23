import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:rentz/constants/global_constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final double? containerHeight;
  final double? containerWidth;
  final Decoration? containerDecoration;
  final ValueChanged<String>? onChanged; // Added onChanged parameter
  final List<TextInputFormatter>? textInputFormatters;
  // Added maxLength parameter
  final FocusNode? focusNode; // Add the focusNode parameter

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    this.keyboardType,
    this.padding,
    this.containerHeight,
    this.containerWidth,
    this.containerDecoration,
    this.onChanged, // Added onChanged parameter
    this.textInputFormatters,
    this.focusNode, // Add the focusNode parameter// Added maxLength parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: containerHeight,
      padding: padding ?? const EdgeInsets.only(left: 16, right: 16),
      decoration: containerDecoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(
                0xFFf2f2f2), // Use your desired background color here
          ),
      child: Center(
        child: TextFormField(
          controller: controller,
          cursorColor: GlobalConstants.blackKnight600,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            hintText: hintText ?? '',
            border: InputBorder.none, // Remove border
            enabledBorder: InputBorder.none, // Remove border when not focused
          ),
          keyboardType: keyboardType, // Set the keyboardType
          inputFormatters: textInputFormatters, // Set the maxLength
          onChanged: onChanged,
          focusNode:
              focusNode, // Set the focusNode // Set the onChanged callback
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Enter your $hintText';
            }
            return null;
          },
        ),
      ),
    );
  }
}
