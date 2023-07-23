// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rentz/feature/onboarding/widget/onboarding_widget1.dart';
import 'package:rentz/feature/onboarding/widget/onboarding_widget2.dart';
import 'package:rentz/feature/onboarding/widget/onboarding_widget3.dart';
import 'package:rentz/feature/onboarding/widget/onboarding_widget4.dart';

class OnBoardingBottomsheet extends StatefulWidget {
  static const String routeName = '/onboarding-screen1';

  const OnBoardingBottomsheet({Key? key}) : super(key: key);

  @override
  State<OnBoardingBottomsheet> createState() => _OnBoardingBottomsheetState();
}

class _OnBoardingBottomsheetState extends State<OnBoardingBottomsheet> {
  int selectedWidgetIndex = 0;

  void selectWidget(int index) {
    setState(() {
      selectedWidgetIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.72,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          // onborading screen2
          child: switchWidgets(selectedWidgetIndex), // onborading screen2 end
        ),
      ),
    );
  }

  Widget switchWidgets(int index) {
    switch (index) {
      case 0:
        return OnBoardingWidget1(
          showOnBoardingWidget2: () {
            // Callback function to switch to OnBoardingWidget2
            selectWidget(1);
          },
        );
      case 1:
        return OnBoardingWidget2(
            // Callback function to switch to OnBoardingWidget3
            nextOnBoardingWidget: () => selectWidget(2),
            // Callback function to switch to OnBoardingWidget1
            previosOnBoardingWidget: () => selectWidget(0));
      case 2:
        return OnBoardingWidget3(
          // Callback function to switch to OnBoardingWidget4
          nextOnBoardingWidget: () => selectWidget(3),
          // Callback function to switch to OnBoardingWidget2
          previosOnBoardingWidget: () => selectWidget(1),
        );
      case 3:
        return OnBoardingWidget4(
          // Callback function to switch to OnBoardingWidget2
          previosOnBoardingWidget: () => selectWidget(2),
        );
      default:
        return Container();
    }
  }
}
