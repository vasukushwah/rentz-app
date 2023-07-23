import 'package:flutter/material.dart';
import 'package:rentz/common/widgets/custom_button_widget.dart';
import 'package:rentz/constants/global_constants.dart';

class BackNextButtonsRow extends StatelessWidget {
  final VoidCallback onBackButtonPressed;
  final VoidCallback onNextButtonPressed;

  const BackNextButtonsRow({
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
                svgIconPath:
                    '${GlobalConstants.iconsDirPath}/huge-arrow-left-outline.svg',
                buttonColor: GlobalConstants.blackKnight300,
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
