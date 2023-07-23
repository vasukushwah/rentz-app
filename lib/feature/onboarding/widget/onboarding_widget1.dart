import 'package:flutter/material.dart';
import 'package:rentz/common/widgets/custom_button_widget.dart';
import 'package:rentz/common/widgets/custom_text_field.dart';
import 'package:rentz/constants/global_constants.dart';

// Constants
const List<String> countryFlags = [
  '🇺🇸', // United States
  '🇬🇧', // United Kingdom
  '🇨🇦', // Canada
  '🇦🇺', // Australia
  '🇮🇳', // India
  // Add more country flags as needed
];

class OnBoardingWidget1 extends StatefulWidget {
  final VoidCallback showOnBoardingWidget2;

  const OnBoardingWidget1({
    Key? key,
    required this.showOnBoardingWidget2,
  }) : super(key: key);

  @override
  State<OnBoardingWidget1> createState() => _OnBoardingWidget1State();
}

class _OnBoardingWidget1State extends State<OnBoardingWidget1> {
  String selectedCountryFlag = '🇮🇳';
  final TextEditingController _mobileNumberController = TextEditingController();

  void _onContinueButtonPressed() {
    // Navigate to the OnBoardingWidget2 screen
    widget.showOnBoardingWidget2();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Enter your mobile number",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            // Country flag dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(
                    0xFFf2f2f2), // Use your desired background color here
              ),
              child: DropdownButton<String>(
                value: selectedCountryFlag,
                onChanged: (String? newValue) {
                  // Update the selected country flag when the user selects an option
                  if (newValue != null) {
                    setState(() {
                      selectedCountryFlag = newValue;
                    });
                  }
                },
                items: countryFlags.map((String flag) {
                  return DropdownMenuItem<String>(
                    value: flag,
                    child: Text(flag),
                  );
                }).toList(),
                icon: const Icon(
                  Icons
                      .arrow_drop_down, // Replace with your desired custom icon
                  color: Colors.black, // Set the color of the custom icon
                ), // Remove the default underline of the DropdownButton
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(
                      0xFFf2f2f2), // Use your desired background color here
                ),
                child: CustomTextField(
                  controller: _mobileNumberController,
                  hintText: 'Mobile Number',
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 24),
        CustomButtonWidget(
          text: 'Continue',
          onTap: _onContinueButtonPressed,
          padding: const EdgeInsets.symmetric(vertical: 8),
        ),
        const SizedBox(height: 24),
        const DividerSection(),
        const SizedBox(height: 24),
        const SocialButtonsSection(),
        const SizedBox(height: 24),
        const Column(
          children: [
            Text(
              "Find my account",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: GlobalConstants.secondaryColor,
                fontStyle: FontStyle.normal,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Lorem ipsum dolor sit amet consectetur. Pulvinar nec aliquet risus quis massa aenean eros non in. Integer tristique aenean mauris luctus.",
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: GlobalConstants.blackKnight700,
              ),
            )
          ],
        ),
      ],
    );
  }
}

//  DividerSection Widget
class DividerSection extends StatelessWidget {
  const DividerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: GlobalConstants.blackKnight600,
            thickness: 1.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "or",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: GlobalConstants.blackKnight600,
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}

// Social Button Section
class SocialButtonsSection extends StatelessWidget {
  const SocialButtonsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButtonWidget(
          text: 'Continue with Google',
          textColor: GlobalConstants.blackKnight900,
          onTap: () {},
          svgIconPath: "assets/images/google-icon.svg",
          buttonColor: GlobalConstants.blackKnight300,
        ),
        const SizedBox(height: 16),
        CustomButtonWidget(
          text: 'Continue with Apple',
          textColor: GlobalConstants.blackKnight900,
          onTap: () {},
          svgIconPath: "assets/images/apple-icon.svg",
          buttonColor: GlobalConstants.blackKnight300,
        ),
        const SizedBox(height: 16),
        CustomButtonWidget(
          text: 'Continue with Facebook',
          textColor: GlobalConstants.blackKnight900,
          onTap: () {},
          svgIconPath: "assets/images/facebook-icon.svg",
          buttonColor: GlobalConstants.blackKnight300,
        ),
      ],
    );
  }
}
