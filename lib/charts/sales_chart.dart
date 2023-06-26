// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// import '../utils/global.dart';

// class LineChartSample2 extends StatefulWidget {
//   // const LineChartSample2({) : super(key: key);

//   @override
//   _LineChartSample2State createState() => _LineChartSample2State();
// }

// class _LineChartSample2State extends State<LineChartSample2> {
//   List<Color> gradientColors = [
//     const Color(0xffFFA500),
//     Global.deepOrange.withOpacity(0.5),
//   ];

//   bool showAvg = false;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AspectRatio(
//           aspectRatio: 1.15,
//           child: Container(
//             decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20),
//                 ),
//                  color: Colors.white
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   right: 18.0, left: 12.0, top: 24, bottom: 12),
//               child: LineChart(
//                 showAvg ? avgData() : mainData(),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 60,
//           height: 34,
//           child: TextButton(
//             onPressed: () {
//               setState(() {
//                 showAvg = !showAvg;
//               });
//             },
//             child: Text(
//               'avg',
//               style: TextStyle(
//                   fontFamily: "Nunito",
//                   fontSize: 12,
//                   color:
//                   showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   LineChartData mainData() {
//     return LineChartData(
//       gridData: FlGridData(
//         show: true,
//         drawVerticalLine: true,
//         getDrawingHorizontalLine: (value) {
//           return FlLine(
//             color: Colors.white,
//             strokeWidth: 1,
//           );
//         },
//         getDrawingVerticalLine: (value) {
//           return FlLine(
//             color: Colors.white,
//             strokeWidth: 1,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         rightTitles: SideTitles(showTitles: false),
//         topTitles: SideTitles(showTitles: false),
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 22,
//           interval: 1,
//           // getTextStyles: (context, value) => const TextStyle(
//           //     color: Color(0xff68737d),
//           //     fontWeight: FontWeight.bold,
//           //     fontSize: 16),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 2:
//                 return 'MAR';
//               case 5:
//                 return 'JUN';
//               case 8:
//                 return 'SEP';
//             }
//             return '';
//           },
//           margin: 8,
//         ),
//         leftTitles: SideTitles(
//           showTitles: true,
//           interval: 1,
//           // getTextStyles: (context, value) => const TextStyle(
//           //   color: Color(0xff67727d),
//           //   fontWeight: FontWeight.bold,
//           //   fontSize: 15,
//           // ),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 1:
//                 return '10k';
//               case 3:
//                 return '30k';
//               case 5:
//                 return '50k';
//             }
//             return '';
//           },
//           reservedSize: 32,
//           margin: 12,
//         ),
//       ),
//       borderData: FlBorderData(
//           show: true,
//           border: Border.all(color:  const Color(0xffFFFFFF), width: 1)),
//       minX: 0,
//       maxX: 11,
//       minY: 0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           spots: [
//             const FlSpot(0, 3),
//             const FlSpot(2.6, 2),
//             const FlSpot(4.9, 5),
//             const FlSpot(6.8, 3.1),
//             const FlSpot(8, 4),
//             const FlSpot(9.5, 3),
//             const FlSpot(11, 4),
//           ],
//           isCurved: true,
//           colors: gradientColors,
//           barWidth: 5,
//           isStrokeCapRound: true,
//           dotData: FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             colors:
//             gradientColors.map((color) => color.withOpacity(0.3)).toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   LineChartData avgData() {
//     return LineChartData(
//       lineTouchData: LineTouchData(enabled: false),
//       // gridData: FlGridData(
//       //   show: true,
//       //   drawHorizontalLine: true,
//       //   getDrawingVerticalLine: (value) {
//       //     return FlLine(
//       //       color:  Colors.white,
//       //       strokeWidth: 1,
//       //     );
//       //   },
//       //   getDrawingHorizontalLine: (value) {
//       //     return FlLine(
//       //       color:  Colors.white,
//       //       strokeWidth: 1,
//       //     );
//       //   },
//       // ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 22,
//           // getTextStyles: (context, value) => const TextStyle(
//           //     color: Color(0xff68737d),
//           //     fontWeight: FontWeight.bold,
//           //     fontSize: 16),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 2:
//                 return 'MAR';
//               case 5:
//                 return 'JUN';
//               case 8:
//                 return 'SEP';
//             }
//             return '';
//           },
//           margin: 8,
//           interval: 1,
//         ),
//         leftTitles: SideTitles(
//           showTitles: true,
//           // getTextStyles: (context, value) => const TextStyle(
//           //   color: Color(0xff67727d),
//           //   fontWeight: FontWeight.bold,
//           //   fontSize: 15,
//           // ),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 1:
//                 return '10k';
//               case 3:
//                 return '30k';
//               case 5:
//                 return '50k';
//             }
//             return '';
//           },
//           reservedSize: 32,
//           interval: 1,
//           margin: 12,
//         ),
//         topTitles: SideTitles(showTitles: false),
//         rightTitles: SideTitles(showTitles: false),
//       ),
//       borderData: FlBorderData(
//           show: true,
//           border: Border.all(color:  const Color(0xffFFFFFF), width: 1)),
//       minX: 0,
//       maxX: 11,
//       minY: 0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           spots:  [
//             const FlSpot(0, 3.44),
//             const FlSpot(2.6, 3.44),
//             const FlSpot(4.9, 3.44),
//             const FlSpot(6.8, 3.44),
//             const FlSpot(8, 3.44),
//             const FlSpot(9.5, 3.44),
//             const FlSpot(11, 3.44),
//           ],
//           isCurved: true,
//           colors: [
//             const Color(0xffFFA500),
//             const Color(0xffF5F5F8),
//             // ColorTween(begin: gradientColors[0], end: gradientColors[1])
//             //     .lerp(0.2),
//             // ColorTween(begin: gradientColors[0], end: gradientColors[1])
//             //     .lerp(0.2),
//           ],
//           barWidth: 5,
//           isStrokeCapRound: true,
//           dotData: FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(show: true, colors: [
//             // ColorTween(begin: gradientColors[0], end: gradientColors[1])
//             //     .lerp(0.2)
//             //     .withOpacity(0.1),
//             // ColorTween(begin: gradientColors[0], end: gradientColors[1])
//             //     .lerp(0.2)
//             //     .withOpacity(0.1),
//           ]),
//         ),
//       ],
//     );
//   }
// }