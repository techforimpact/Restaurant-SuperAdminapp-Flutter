import 'package:flutter/material.dart';

import '../../../charts/chart.dart';
import '../../../component/custom_text.dart';
import '../../../constants/style.dart';
// import 'bar_chart.dart';

class RevenueSectionSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        children: const [
          // Container(
          //   height: 260,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       CustomText(
          //         text: "Revenue Chart",
          //         size: 20,
          //         fontWeight: FontWeight.bold,
          //         color: lightGrey,
          //       ),
          //       // Container(
          //       //     width: 600,
          //       //     height: 200,
          //       //     child: SimpleBarChart.withSampleData()),
          //     ],
          //   ),
          // ),
          // Container(
          //   width: 120,
          //   height: 1,
          //   color: lightGrey,
          // ),
          // Container(
          //   height: 260,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Row(
          //         children: [
          //           Text(
          //             "Business Analytics",
          //             style: TextStyle(
          //               fontFamily: "Nunito",
          //               color: Colors.black87,
          //               fontWeight: FontWeight.bold,
          //               fontSize: 18,
          //             ),
          //           ),
          //           // RevenueInfo(
          //           //   title: "Toda\'s revenue",
          //           //   amount: "230",
          //           // ),
          //           // RevenueInfo(
          //           //   title: "Last 7 days",
          //           //   amount: "1,100",
          //           // ),
          //         ],
          //       ),
          //       Row(
          //         children: [
          //
          //           Center(
          //             child: SizedBox(
          //                 // width: 950,
          //                 height: 400,
          //                 child: Flutterchart()
          //             ),
          //           ),
          //           // RevenueInfo(
          //           //   title: "Last 30 days",
          //           //   amount: "3,230",
          //           // ),
          //           // RevenueInfo(
          //           //   title: "Last 12 months",
          //           //   amount: "11,300",
          //           // ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
