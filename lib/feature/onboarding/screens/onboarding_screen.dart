import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentz/common/widgets/custom_button_widget.dart';
import 'package:rentz/feature/onboarding/widget/onboarding_bottom_sheet.dart';
import 'package:rentz/feature/onboarding/widget/top_center_text.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding-screen1';

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap the Column with SingleChildScrollView
          child: Column(
            children: [
              const TopCenterText(),
              const SvgContainer(), // Replace with your SVG container widget
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, bottom: 16, left: 24, right: 24),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'Ride to anywhere Comfortably & Securely ',
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      CustomButtonWidget(
                        text: 'Get Started',
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        onTap: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const OnBoardingScreen2(),
                          //   ),
                          // );
                          showModalBottomSheet<dynamic>(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return const OnBoardingBottomsheet();
                              });
                          //   return SizedBox(
                          //     height: 400,
                          //     child: Center(
                          //       child: CustomButtonWidget(
                          //         text: 'Close',
                          //         onTap: () {
                          //           Navigator.pop(context);
                          //         },
                          //       ),
                          //     ),
                          //   );
                          // });
                        },
                      ),
                      // Add more widgets to the third column as needed
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SvgContainer extends StatelessWidget {
  const SvgContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/images/onboarding_screen1_image.svg',
        width: double.infinity,
        height: 350,
      ),
    );
  }
}
