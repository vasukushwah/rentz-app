import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentz/constants/global_constants.dart';

enum IconPosition {
  beforeText,
  afterText,
}

class CustomButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final IconData? iconData; // Icon (IconData) to be displayed on the left side
  final String? svgIconPath; // SVG icon path (asset path or URL)
  final Color? iconColor; // Color of the icon
  final double? iconSize; // Size of the icon
  final Color? buttonColor;
  final Color? textColor;
  final MainAxisAlignment? contentAlignment;
  final EdgeInsetsGeometry?
      padding; // Enable or disable BoxShadow // Color of the button
  final IconPosition
      iconPosition; // Position of the icon (before or after the text)
  final Color? borderColor;
  final double? borderWidth;

  const CustomButtonWidget({
    Key? key,
    this.text,
    required this.onTap,
    this.textStyle,
    this.iconData,
    this.svgIconPath,
    this.iconColor,
    this.iconSize,
    this.buttonColor,
    this.textColor,
    this.padding,
    this.contentAlignment,
    this.iconPosition = IconPosition.beforeText,
    this.borderColor,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: padding,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
        ),
        backgroundColor: buttonColor,
        elevation: 0, // Set the background color of the button
      ),
      child: Row(
        mainAxisAlignment: contentAlignment ?? MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.beforeText && hasIcon()) buildIcon(),
          if (text != null &&
              hasIcon() &&
              iconPosition == IconPosition.beforeText)
            const SizedBox(width: 8), // Add space between icon and text
          if (text != null)
            Text(
              text!,
              style: textStyle ??
                  TextStyle(
                      fontSize: 16,
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.w700,
                      height: GlobalConstants.textHeight),
            ),
          if (text != null &&
              hasIcon() &&
              iconPosition == IconPosition.afterText)
            const SizedBox(width: 8), // Add space between icon and text
          if (iconPosition == IconPosition.afterText && hasIcon()) buildIcon(),
        ],
      ),
    );
  }

  bool hasIcon() {
    return iconData != null || svgIconPath != null;
  }

  Widget buildIcon() {
    if (iconData != null) {
      return Icon(
        iconData,
        color: iconColor,
        size: iconSize,
      );
    } else if (svgIconPath != null) {
      return SvgPicture.asset(
        svgIconPath!,
        width: iconSize,
        height: iconSize,
        alignment: Alignment.center,
      );
    } else {
      return Container();
    }
  }
}
