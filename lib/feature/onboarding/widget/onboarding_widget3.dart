// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rentz/common/widgets/custom_text_field.dart';
import 'package:rentz/constants/global_constants.dart';
import 'package:rentz/feature/onboarding/widget/back_next_buttons_row.dart';

class OnBoardingWidget3 extends StatefulWidget {
  final VoidCallback nextOnBoardingWidget;
  final VoidCallback previosOnBoardingWidget;

  const OnBoardingWidget3({
    Key? key,
    required this.nextOnBoardingWidget,
    required this.previosOnBoardingWidget,
  }) : super(key: key);

  @override
  State<OnBoardingWidget3> createState() => _OnBoardingWidget3State();
}

class _OnBoardingWidget3State extends State<OnBoardingWidget3> {
  final TextEditingController _firstNameFieldController =
      TextEditingController();
  final TextEditingController _lastNameFieldController =
      TextEditingController();

  void _onNextButtonPressed() {
    // Navigate to the OnBoardingWidget3 screen
    widget.nextOnBoardingWidget();
  }

  void _onBackButtonPressed() {
    // Navigate to the OnBoardingWidget3 screen
    widget.previosOnBoardingWidget();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _firstNameFieldController.dispose();
    _lastNameFieldController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What’s your name?",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: GlobalConstants.blackKnight900),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Let us know how to properly address you",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: GlobalConstants.blackKnight700),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: _firstNameFieldController,
                hintText: 'First Name',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: _lastNameFieldController,
                hintText: 'Last Name',
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
}
