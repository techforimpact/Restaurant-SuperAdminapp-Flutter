
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// import '../constants/style.dart';
// import '../constants/style.dart';
// import '../constants/style.dart';


// class Flutterchart extends StatefulWidget{
//   @override
//   _State createState()=>new _State();
// }
// class Sales{
//   String year;
//   int sales;
//   Sales(this.year,this.sales);
// }
// class _State extends State<Flutterchart>{
//   late List<Sales>_data;
//   late List<charts.Series<Sales,String>>_chartdata;
//   void makeData(){
//     _data=<Sales>[];
//     _chartdata=<charts.Series<Sales,String>>[];
//     final rnd=Random();
//     for(int i=2015;i<2021;i++){
//       _data.add(new Sales(i.toString(), rnd.nextInt(1000)));
//     }
//     _chartdata.add(
//         new charts.Series(id:'Sales'
//         '', data: _data,
//       domainFn: (Sales sales,__)=>sales.year,
//       measureFn:(Sales sales,__)=>sales.sales,
//       seriesColor: charts.ColorUtil.fromDartColor(Color(0xffFFA500)),
//       // colorFn: (Sales sales,__)=>charts.MaterialPalette.black,
//       fillPatternFn: (Sales sales,__)=>charts.FillPatternType.forwardHatch,
//       displayName: 'sales',
//     ));

//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     makeData();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        // color: Colors.blue,
//       // width: 1000,
//       // padding: new EdgeInsets.all(32.0),
//       child: new Row(
//         children: <Widget>[
//           new Expanded(
//               child: new charts.BarChart(_chartdata)),
//         ],
//       ),
//     );
//   }
// }
