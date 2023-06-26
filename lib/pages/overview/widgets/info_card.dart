// import 'package:flutter/material.dart';

// import '../../../charts/sales_chart.dart';
// import '../../../constants/style.dart';
// import '../../../utils/global.dart';

// class InfoCard extends StatelessWidget {
//   final String? title;
//   final String? value;
//   final Color? topColor;
//   final bool? isActive;
//   final Function()? onTap;
//   const InfoCard({
//     Key? key,
//     this.title,
//     this.value,
//     this.topColor,
//     this.isActive = false,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: InkWell(
//         onTap: onTap,
//         child: Container(
//           height: 220,
//           width: 250,
//           // alignment: Alignment.center,
//           decoration: BoxDecoration(
//             // color: Colors.red,
//             // color: Colors.white,
//             //   boxShadow: [
//             //     BoxShadow(
//             //       color: Global.deepOrange.withOpacity(0.3),
//             //     ),
//             //   ],
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Center(
//               child: LineChartSample2()
//           ),
//           // Column(
//           //   children: [
//           //     Row(
//           //       children: [
//           //         Expanded(
//           //           child: Container(
//           //             color: topColor ?? active,
//           //             height: 5,
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //     Expanded(child: Container()),
//           //     RichText(
//           //       textAlign: TextAlign.center,
//           //       text: TextSpan(
//           //         children: [
//           //           TextSpan(
//           //             text: '$title\n',
//           //             style: TextStyle(
//           //               fontSize: 16,
//           //               color: isActive! ? active : lightGrey,
//           //             ),
//           //           ),
//           //           TextSpan(
//           //             text: '$value',
//           //             style: TextStyle(
//           //               fontSize: 40,
//           //               color: isActive! ? active : dark,
//           //             ),
//           //           ),
//           //         ],
//           //       ),
//           //     ),
//           //     Expanded(child: Container()),
//           //   ],
//           // ),
//         ),
//       ),
//     );
//   }
// }
