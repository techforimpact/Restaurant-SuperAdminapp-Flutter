import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

import '../../../charts/bar_chart.dart';
import '../../../charts/chart.dart';
import '../../../component/custom_text.dart';
import '../../../constants/style.dart';

// import 'bar_chart.dart';

class RevenueSectionLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text("Business Analytics",
        // style: TextStyle(),
        // ),
        Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            // Row(
            //   children:  [
            //
            //     // SizedBox(
            //     //   height: 30,
            //     // ),
            //
            //     // Text(
            //     //   "Business Analytics",
            //     //   //
            //     //   // style: TextStyle(
            //     //   //
            //     //   //   color: Colors.black87,
            //     //   //   fontWeight: FontWeight.bold,
            //     //   //   fontSize: 18,
            //     //   // ),
            //     // ),
            //   ],
            // ),
            // Center(
            //   child: SizedBox(
            //        width: 1100,
            //       height: 400,
            //       child: Flutterchart()
            //   ),
            // ),
            // Container(
            //   height: 500,
            //   padding: EdgeInsets.all(24),
            //   margin: EdgeInsets.symmetric(vertical: 30),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //     borderRadius: BorderRadius.circular(8),
            //     boxShadow: [
            //       BoxShadow(
            //           offset: Offset(0, 6),
            //           color: lightGrey.withOpacity(.1),
            //           blurRadius: 12)
            //     ],
            //     border: Border.all(color: lightGrey, width: .5),
            //   ),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             CustomText(
            //               text: "Revenue Chart",
            //               size: 20,
            //               fontWeight: FontWeight.bold,
            //               color: lightGrey,
            //             ),
            //             // Container(
            //             //     width: 600,
            //             //     height: 200,
            //             //     child: SimpleBarChart.withSampleData()),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         width: 1,
            //         height: 120,
            //         color: lightGrey,
            //       ),
            //       Expanded(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             Row(
            //               children: [
            //                 RevenueInfo(
            //                   title: "Toda\'s revenue",
            //                   amount: "230",
            //                 ),
            //                 RevenueInfo(
            //                   title: "Last 7 days",
            //                   amount: "1,100",
            //                 ),
            //               ],
            //             ),
            //             SizedBox(
            //               height: 30,
            //             ),
            //             Row(
            //               children: [
            //                 RevenueInfo(
            //                   title: "Last 30 days",
            //                   amount: "3,230",
            //                 ),
            //                 RevenueInfo(
            //                   title: "Last 12 months",
            //                   amount: "11,300",
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
