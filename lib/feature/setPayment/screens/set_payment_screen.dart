import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentz/common/widgets/custom_button_widget.dart';
import 'package:rentz/constants/global_constants.dart';
import 'package:rentz/feature/setPayment/widgets/skip_next_buttons_row.dart';

class SetPaymentScreen extends StatelessWidget {
  static final List<Map<String, dynamic>> _paymentMethodButtonList = [
    {
      'text': 'Apple Pay',
      'svgIconPath': '${GlobalConstants.iconsDirPath}/apple-icon.svg',
    },
    {
      'text': 'PayPal',
      'svgIconPath': '${GlobalConstants.iconsDirPath}/payple-icon.svg',
    },
    {
      'text': 'Credit or Debit Card',
      'svgIconPath': '${GlobalConstants.iconsDirPath}/ecommerce-outline.svg',
    },
    {
      'text': 'Cash',
      'svgIconPath': '${GlobalConstants.iconsDirPath}/cash-icon.svg',
    },
    {
      'text': 'Gift Card',
      'svgIconPath': '${GlobalConstants.iconsDirPath}/finance-and-payment.svg',
    },
  ];

  const SetPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add your button tap action here
                    },
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: GlobalConstants.blackKnight300),
                      padding: const EdgeInsets.all(4),
                      child: SvgPicture.asset(
                          '${GlobalConstants.iconsDirPath}/rounded-left-arrow.svg'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Select your Preferred payment method",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: GlobalConstants.blackKnight900,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: _paymentMethodButtonList.map((buttonData) {
                      String text = buttonData['text'];
                      String svgIconPath = buttonData['svgIconPath'];

                      return Column(
                        children: [
                          CustomButtonWidget(
                            onTap: () {},
                            contentAlignment: MainAxisAlignment.start,
                            buttonColor: GlobalConstants.blackKnight200,
                            svgIconPath: svgIconPath,
                            text: text,
                            textColor: GlobalConstants.blackKnight800,
                            iconPosition: IconPosition.beforeText,
                            padding: const EdgeInsets.all(16),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SkipNextButtonsRow(
                onBackButtonPressed: () {},
                onNextButtonPressed: () {},
              ),
              const SizedBox(
                height: 56,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
