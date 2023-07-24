import 'package:flutter/material.dart';
import 'package:rentz/constants/global_constants.dart';
import 'package:rentz/feature/onboarding/widget/back_next_buttons_row.dart';
import 'package:rentz/feature/onboarding/widget/dashed_line_devider.dart';
import 'package:rentz/feature/setPayment/screens/set_payment_screen.dart';

class OnBoardingWidget4 extends StatefulWidget {
  final VoidCallback previosOnBoardingWidget;

  const OnBoardingWidget4({
    Key? key,
    required this.previosOnBoardingWidget,
  }) : super(key: key);

  @override
  State<OnBoardingWidget4> createState() => _OnBoardingWidget4State();
}

class _OnBoardingWidget4State extends State<OnBoardingWidget4> {
  bool _isChecked = false;

  final TextEditingController _firstNameFieldController =
      TextEditingController();
  final TextEditingController _lastNameFieldController =
      TextEditingController();

  void _onNextButtonPressed() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SetPaymentScreen()));
  }

  void _toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  void _onBackButtonPressed() {
    // Navigate to the OnBoardingWidget4 screen
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
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Rentz Terms & Review Privacy Policy",
                style: TextStyle(
                    fontSize: 20,
                    height: GlobalConstants.textHeight,
                    fontWeight: FontWeight.w700,
                    color: GlobalConstants.blackKnight900),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "By selecting “I Agree” below, I have reviewed and agree to the Terms & Conditions and acknowledge the Privacy Policy. I am at least 18 years of age.",
                style: TextStyle(
                    height: GlobalConstants.textHeight,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: GlobalConstants.blackKnight700),
              ),
              const SizedBox(
                height: 16,
              ),
              const DashedLineDevider(color: GlobalConstants.blackKnight400),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: _toggleCheckbox,
                    child: AnimatedContainer(
                      duration: const Duration(
                          milliseconds: 200), // Animation duration
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: const Color(0xfff2f2f2),
                      ),
                      child: _isChecked
                          ? const Icon(
                              Icons.check,
                              size: 24,
                              color: GlobalConstants
                                  .secondaryColor, // Color of the checkmark when checkbox is checked
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    "I Agree",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  )
                ],
              ),
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
