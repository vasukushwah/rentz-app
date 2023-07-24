// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:rentz/common/widgets/custom_button_widget.dart';
import 'package:rentz/common/widgets/custom_text_field.dart';
import 'package:rentz/constants/global_constants.dart';
import 'package:rentz/feature/onboarding/widget/back_next_buttons_row.dart';

class OnBoardingWidget2 extends StatefulWidget {
  final VoidCallback nextOnBoardingWidget;
  final VoidCallback previosOnBoardingWidget;

  const OnBoardingWidget2({
    Key? key,
    required this.nextOnBoardingWidget,
    required this.previosOnBoardingWidget,
  }) : super(key: key);

  @override
  State<OnBoardingWidget2> createState() => _OnBoardingWidget2State();
}

class _OnBoardingWidget2State extends State<OnBoardingWidget2> {
  final TextEditingController _firstNumberfieldController =
      TextEditingController();
  final TextEditingController _secondNumberfieldController =
      TextEditingController();
  final TextEditingController _thirdNumberfieldController =
      TextEditingController();
  final TextEditingController _fourthNumberfieldController =
      TextEditingController();

  late List<FocusNode> _focusNodes;
  late int _currentFocusIndex;

  void _onNextButtonPressed() {
    // Navigate to the OnBoardingWidget2 screen
    widget.nextOnBoardingWidget();
  }

  void _onBackButtonPressed() {
    // Navigate to the OnBoardingWidget2 screen
    widget.previosOnBoardingWidget();
  }

  @override
  void initState() {
    super.initState();
    _focusNodes = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
    ];
    _currentFocusIndex = 0;
  }

  @override
  void dispose() {
    _firstNumberfieldController.dispose();
    _secondNumberfieldController.dispose();
    _thirdNumberfieldController.dispose();
    _fourthNumberfieldController.dispose();

    for (var node in _focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Column(
        children: [
          Column(
            children: [
              const Text(
                "Enter the 4 digit code send to you at  xxx xxx 6542",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: GlobalConstants.textHeight,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  _buildCustomTextField(_firstNumberfieldController, 0),
                  const SizedBox(width: 8),
                  _buildCustomTextField(_secondNumberfieldController, 1),
                  const SizedBox(width: 8),
                  _buildCustomTextField(_thirdNumberfieldController, 2),
                  const SizedBox(width: 8),
                  _buildCustomTextField(_fourthNumberfieldController, 3),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          const Row(
            children: [
              Text(
                "I didn't receive a code (0:52)",
                style: TextStyle(
                    fontSize: 16,
                    height: GlobalConstants.textHeight,
                    fontWeight: FontWeight.w400,
                    color: GlobalConstants.blackKnight700),
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          BackNextButtonsRow(
              onBackButtonPressed: _onBackButtonPressed,
              onNextButtonPressed: _onNextButtonPressed),
          const SizedBox(
            height: 56,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTextField(
    TextEditingController controller,
    int index,
  ) {
    return CustomTextField(
      controller: controller,
      hintText: '',
      keyboardType: TextInputType.number,
      containerHeight: 56,
      containerWidth: 56,
      textInputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (value) {
        if (value.isNotEmpty && _currentFocusIndex < _focusNodes.length - 1) {
          // Move focus to the next CustomTextField
          _focusNodes[_currentFocusIndex + 1].requestFocus();
          _currentFocusIndex++;
        }
        if (value.isEmpty && _currentFocusIndex > 0) {
          // Move focus to the previous CustomTextField
          _focusNodes[_currentFocusIndex - 1].requestFocus();
          _currentFocusIndex--;
        }
      },
      focusNode: _focusNodes[index],
    );
  }
}
