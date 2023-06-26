import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/style.dart';
import '../../controllers/general_controller.dart';
import '../../helpers/responsiveness.dart';
import '../../models/style.dart';

import 'package:universal_html/html.dart' as html;

import '../../utils/global.dart';
import '../../utils/responsive.dart';

/// Example without datasource
///

class Status {
  String name;
  String orderid;
  bool enable;
  String date;
  String price;
  String bitehub;
  String customer;
  Color color;
  Status(
      {required this.name,
      required this.color,
      required this.orderid,
      required this.date,
      required this.price,
      required this.bitehub,
      required this.customer,
      this.enable = false});
}

class Order {
  String name;
  Order({
    required this.name,
  });
}

List<String> _buttonNames = [
  "All Status",
  "New Order",
  "On Progress",
  "Delivered"
];
List<String> _pageNo = ["1", "2", "3", "4"];
int _currentSelectedButton = 0;
int _currentSelectedButton1 = 1;

class ReportTable extends StatefulWidget {
  const ReportTable({Key? key}) : super(key: key);

  @override
  State<ReportTable> createState() => _ReportTableState();
}

class _ReportTableState extends State<ReportTable>
    with SingleTickerProviderStateMixin {
  final List<String> _banner = [
    "Sr.",
    "Restaurant",
    "Date",
    "Amount",
  ];
  final List<String> _revenueBanner = [
    "Total Earning",
    "Total Profit",
  ];
  final List<String> _banner1 = [
    "Sr.",
    "Restaurant",
    "Earning",
    "Commission",
    "Paid",
    "Net"
  ];

  bool show = false;
  bool showItems = false;

  String dropdownvalue = 'Select BiteHub';
  String dropdownvalue1 = 'All';
  late String valueChoose;
  var items = ['Select BiteHub', 'Select BiteHubs'];
  var items1 = ['All', 'Accepted', 'Pending', 'Completed'];

  late TabController tabController;
  @override
  void initState() {
    getReportDetail();
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  getReportDetail() async {
    reportList = [];
    QuerySnapshot restQuery = await FirebaseFirestore.instance
        .collection('restaurants')
        .where('id',
            isEqualTo: Get.find<GeneralController>().boxStorage.read('id'))
        .get();
    restQuery.docs.forEach((element1) async {
      QuerySnapshot orderQuery = await FirebaseFirestore.instance
          .collection('orders')
          .where('restaurant_id', isEqualTo: element1.get('id'))
          .get();
      double earning = 0;
      for (var element2 in orderQuery.docs) {
        earning = earning + double.parse(element2.get('net_price').toString()).toPrecision(2);
      }

      double commission = 0;
      commission =
          (earning * (double.parse(element1.get('commission').toString()) / 100)).toPrecision(2)
              ;
      QuerySnapshot payoutQuery = await FirebaseFirestore.instance
          .collection('payouts')
          .where('restaurant_id', isEqualTo: element1.get('id'))
          .get();
      double payoutAmount = 0;
      for (var element3 in payoutQuery.docs) {
        payoutAmount =
            payoutAmount + double.parse(element3.get('amount').toString()).toPrecision(2);
      }
      double net = earning - commission - payoutAmount;
      setState(() {
        reportList.add({
          'name': element1.get('name'),
          'earning': earning,
          'commission': commission,
          'paid': payoutAmount,
          'net': net
        });
      });
    });
    Future.delayed(const Duration(seconds: 4)).whenComplete(() => getRevenue());

  }
  double? totalEarning = 0;
  double? totalProfit = 0;
  getRevenue() {
    for (var element in reportList) {
      setState(() {
        totalEarning = totalEarning! + double.parse(element['earning'].toString()).toPrecision(2);
        totalProfit =
            totalProfit! + (double.parse(element['earning'].toString()) -
                double.parse(element['commission'].toString()));
      });
    }
    setState(() {
      loader = false;
    });
  }
  bool loader = true;
  List<Map<String, dynamic>> reportList = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: ResponsiveWidget.isSmallScreen(context) ? 56 : 40,
              ),
              child: Text(
                'Revenue',
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: active),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: active.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: active.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 30),
          child: loader
              ? const Center(child: CircularProgressIndicator())
              : Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Global.deepOrange,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        _revenueBanner.length,
                            (index) => Expanded(
                          child: Center(
                            child: Text(
                              _revenueBanner[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    //
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              reportList.isEmpty
                  ? const SizedBox()
                  : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Rs'+double.parse(totalEarning.toString()).toPrecision(2).toString(),
                            style: const TextStyle(
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Rs'+double.parse(totalProfit.toString()).toPrecision(2).toString(),
                            style: const TextStyle(
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: active.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: active.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 30),
          child: loader
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            generateCSVReports();
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                color: customThemeColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                              child: Text(
                                'Export',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: Global.deepOrange,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                              _banner1.length,
                              (index) => index == 0
                                  ? SizedBox(
                                      width: 50,
                                      child: Text(
                                        _banner[index],
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    )
                                  : Expanded(
                                      child: Center(
                                        child: Text(
                                          _banner1[index],
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                            )
                            //
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    reportList.isEmpty
                        ? const SizedBox()
                        : StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('restaurants')
                                .where('id',
                                    isEqualTo: Get.find<GeneralController>()
                                        .boxStorage
                                        .read('id'))
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.docs.isEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Text(
                                      'Record not found',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  );
                                } else {
                                  return Wrap(
                                    children: List.generate(
                                      snapshot.data!.docs.length,
                                      (index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: SizedBox(
                                          height: 60,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 50,
                                                child: Text(
                                                  '${index + 1}',
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    reportList[index]['name']
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    'Rs${reportList[index]['earning']}',
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    'Rs${reportList[index]['commission']}',
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    'Rs${reportList[index]['paid']}',
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    'Rs${reportList[index]['net']}',
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                return Text(
                                  'Record not found',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                );
                              }
                            }),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: ResponsiveWidget.isSmallScreen(context) ? 56 : 40,
              ),
              child: Text(
                'Payouts',
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: active),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: active.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: active.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 30),
          child: loader
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () async {
                            generateCSVPayouts();
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                color: customThemeColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                              child: Text(
                                'Export',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      color: Global.deepOrange,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                              _banner.length,
                              (index) => index == 0
                                  ? SizedBox(
                                      width: 50,
                                      child: Text(
                                        _banner[index],
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    )
                                  : Expanded(
                                      child: Center(
                                        child: Text(
                                          _banner[index],
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                            )
                            //
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    reportList.isEmpty
                        ? const SizedBox()
                        : StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('payouts')
                                .where('restaurant_id',
                                    isEqualTo: Get.find<GeneralController>()
                                        .boxStorage
                                        .read('id'))
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.docs.isEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Text(
                                      'Record not found',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  );
                                } else {
                                  return Wrap(
                                    children: List.generate(
                                      snapshot.data!.docs.length,
                                      (index) {
                                        DateTime dt = (snapshot
                                                .data!.docs[index]
                                                .get('dateTime') as Timestamp)
                                            .toDate();
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: SizedBox(
                                            height: 60,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 50,
                                                  child: Text(
                                                    '${index + 1}',
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      '${snapshot.data!.docs[index].get('restaurant_name')}',
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      dt
                                                          .toString()
                                                          .substring(0, 10),
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.black),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      'Rs${snapshot.data!.docs[index].get('amount')}',
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }
                              } else {
                                return Text(
                                  'Record not found',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                );
                              }
                            }),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  Future<void> generateCSVReports() async {
    // we will declare the list of headers that we want
    List<String> rowHeader = [
      "Sr.",
      "Restaurant",
      "Earning",
      "Commission",
      "Paid",
      "Net"
    ];
    // here we will make a 2D array to handle a row
    List<List<dynamic>> rows = [];
    //First add entire row header into our first row
    rows.add(rowHeader);

    int? indexPrivate = 1;
    for (int i = 0; i < reportList.length; i++) {
      List<dynamic> dataRow = [];

      dataRow.add('$indexPrivate');
      dataRow.add('${reportList[i]['name']}');
      dataRow.add('${reportList[i]['earning']}');
      dataRow.add('${reportList[i]['commission']}');
      dataRow.add('${reportList[i]['paid']}');
      dataRow.add('${reportList[i]['net']}');
      //lastly add dataRow to our 2d list
      rows.add(dataRow);
      setState(() {
        indexPrivate = indexPrivate! + 1;
      });
    }
    //now convert our 2d array into the csvlist using the plugin of csv
    String csv = const ListToCsvConverter().convert(rows);
    //this csv variable holds entire csv data
    //Now Convert or encode this csv string into utf8
    final bytes = utf8.encode(csv);
    //NOTE THAT HERE WE USED HTML PACKAGE
    final blob = html.Blob([bytes]);
    //It will create downloadable object
    final url = html.Url.createObjectUrlFromBlob(blob);
    //It will create anchor to download the file
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'reports.csv';
    //finally add the csv anchor to body
    html.document.body!.children.add(anchor);
    // Cause download by calling this function
    anchor.click();
    //revoke the object
    html.Url.revokeObjectUrl(url);
  }

  Future<void> generateCSVPayouts() async {
    // we will declare the list of headers that we want
    List<String> rowHeader = _banner;
    // here we will make a 2D array to handle a row
    List<List<dynamic>> rows = [];
    //First add entire row header into our first row
    rows.add(rowHeader);

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('payouts')
        .where('restaurant_id',
            isEqualTo: Get.find<GeneralController>().boxStorage.read('id'))
        .get();

    int? indexPrivate = 1;
    for (var element in querySnapshot.docs) {
      List<dynamic> dataRow = [];

      DateTime dt = (element.get('dateTime') as Timestamp).toDate();
      dataRow.add('$indexPrivate');
      dataRow.add('${element.get('restaurant_name')}');
      dataRow.add(dt.toString().substring(0, 10));
      dataRow.add('Rs${element.get('amount')}');
      //lastly add dataRow to our 2d list
      rows.add(dataRow);
      setState(() {
        indexPrivate = indexPrivate! + 1;
      });
    }
    //now convert our 2d array into the csvlist using the plugin of csv
    String csv = const ListToCsvConverter().convert(rows);
    //this csv variable holds entire csv data
    //Now Convert or encode this csv string into utf8
    final bytes = utf8.encode(csv);
    //NOTE THAT HERE WE USED HTML PACKAGE
    final blob = html.Blob([bytes]);
    //It will create downloadable object
    final url = html.Url.createObjectUrlFromBlob(blob);
    //It will create anchor to download the file
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'payouts.csv';
    //finally add the csv anchor to body
    html.document.body!.children.add(anchor);
    // Cause download by calling this function
    anchor.click();
    //revoke the object
    html.Url.revokeObjectUrl(url);
  }

  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController controller = TextEditingController();
  void payoutDialogue({BuildContext? context, String? id, String? name}) {
    showDialog(
        barrierDismissible: true,
        context: context!,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Container(
                width: Get.width / 1.5,
                // height: 400,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _key,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  'Amount',
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.w500,
                                    // fontStyle: FontStyle.normal,
                                    color: deepGreen,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            // height: 45,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: deepGreen.withOpacity(0.3),
                                    blurRadius: 8,

                                    offset: const Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ]),
                            child: ListTile(
                              //SEARCH BAR
                              title: TextField(
                                controller: controller,
                                //SEARCH BAR TYPO
                                textInputAction: TextInputAction.search,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.w500,
                                    // fontStyle: FontStyle.normal,
                                    color: deepGreen,
                                    fontSize: 15,
                                  ),
                                  // hintText: "Enter Code..",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        FirebaseFirestore.instance
                                            .collection('payouts')
                                            .doc()
                                            .set({
                                          'restaurant_id': id,
                                          'restaurant_name': name,
                                          'amount': int.parse(
                                              controller.text.toString()),
                                          'dateTime': DateTime.now()
                                        }).whenComplete(
                                                () => getReportDetail());
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: active,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          )),
                                      child: const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Pay',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        });
  }
}
