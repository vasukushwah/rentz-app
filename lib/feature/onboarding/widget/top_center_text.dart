import 'package:flutter/material.dart';
import 'package:rentz/constants/global_constants.dart';

class TopCenterText extends StatelessWidget {
  const TopCenterText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 12),
      child: Center(
        child: Text(
          'Rentz',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: GlobalConstants.secondaryColor,
          ),
        ),
      ),
    );
  }
}
