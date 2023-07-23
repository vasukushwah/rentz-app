import 'package:flutter/material.dart';
import 'package:rentz/common/widgets/custom_button_widget.dart';
import 'package:rentz/constants/global_constants.dart';

class SkipNextButtonsRow extends StatelessWidget {
  final VoidCallback onBackButtonPressed;
  final VoidCallback onNextButtonPressed;

  const SkipNextButtonsRow({
    Key? key,
    required this.onBackButtonPressed,
    required this.onNextButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWidget(
                onTap: onBackButtonPressed,
                text: 'Skip',
                textColor: GlobalConstants.secondaryColor,
                buttonColor: Colors.white,
                borderColor: GlobalConstants.prussianBlue400,
                borderWidth: 1,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              ),
              CustomButtonWidget(
                text: "Next",
                onTap: onNextButtonPressed,
                iconPosition: IconPosition.afterText,
                svgIconPath:
                    '${GlobalConstants.iconsDirPath}/huge-arrow-right-outline.svg',
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              )
            ],
          ),
        ],
      ),
    );
  }
}
