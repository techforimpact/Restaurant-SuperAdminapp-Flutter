import 'package:flutter/material.dart';

import '../../../constants/style.dart';

class RevenueInfo extends StatelessWidget {
  final String? amount;
  final String? title;
  const RevenueInfo({
    Key? key,
    this.amount,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title\n\n',
              style: TextStyle(
                color: lightGrey,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: '$amount\n\n',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
