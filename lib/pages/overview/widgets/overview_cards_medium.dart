import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/general_controller.dart';
import '../../../utils/responsive.dart';
import '../overview.dart';

class OverviewCardsMediumScreen extends StatefulWidget {
  const OverviewCardsMediumScreen({Key? key}) : super(key: key);

  @override
  State<OverviewCardsMediumScreen> createState() => _OverviewCardsMediumScreenState();
}

class _OverviewCardsMediumScreenState extends State<OverviewCardsMediumScreen> {


  @override
  void initState() {
    getReportDetail();
    super.initState();
  }

  int? earningType = 0;

  getReportDetail() async {
    reportList = [];
    QuerySnapshot restQuery =
    await FirebaseFirestore.instance.collection('restaurants')
        .where('uid_id',isEqualTo:Get.find<GeneralController>().boxStorage.read('uid') ).get();
    restQuery.docs.forEach((element1) async {
      QuerySnapshot orderQuery = await FirebaseFirestore.instance
          .collection('orders')
          .where('restaurant_id', isEqualTo: element1.get('id'))
          .get();
      if (earningType == 0) {
        double earning = 0;
        for (var element2 in orderQuery.docs) {
          earning = earning +
              double.parse(element2.get('net_price').toString()).toPrecision(2);
        }

        double commission = 0;
        commission = (earning *
            (double.parse(element1.get('commission').toString())
                .toPrecision(2) /
                100));
        QuerySnapshot payoutQuery = await FirebaseFirestore.instance
            .collection('payouts')
            .where('restaurant_id', isEqualTo: element1.get('id'))
            .get();
        double payoutAmount = 0;
        for (var element3 in payoutQuery.docs) {
          payoutAmount = payoutAmount +
              double.parse(element3.get('amount').toString()).toPrecision(2);
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
      } else if (earningType == 1) {
        double earning = 0;
        for (var element2 in orderQuery.docs) {
          // log('1-->>${(element2.get('date_time') as Timestamp).toDate()}');
          // log('2-->>${DateTime.now().subtract(const Duration(days: 1))}');
          if ((element2.get('date_time') as Timestamp)
              .toDate()
              .isAfter(DateTime.now().subtract(const Duration(days: 30)))) {
            earning = earning +
                double.parse(element2.get('net_price').toString())
                    .toPrecision(2);
          }
        }

        double commission = 0;
        commission = (earning *
            (double.parse(element1.get('commission').toString())
                .toPrecision(2) /
                100));
        QuerySnapshot payoutQuery = await FirebaseFirestore.instance
            .collection('payouts')
            .where('restaurant_id', isEqualTo: element1.get('id'))
            .get();
        double payoutAmount = 0;
        for (var element3 in payoutQuery.docs) {
          payoutAmount = payoutAmount +
              double.parse(element3.get('amount').toString()).toPrecision(2);
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
      } else if (earningType == 2) {
        double earning = 0;
        for (var element2 in orderQuery.docs) {
          // log('1-->>${(element2.get('date_time') as Timestamp).toDate()}');
          // log('2-->>${DateTime.now().subtract(const Duration(days: 1))}');
          if ((element2.get('date_time') as Timestamp)
              .toDate()
              .isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
            earning = earning +
                double.parse(element2.get('net_price').toString())
                    .toPrecision(2);
          }
        }

        double commission = 0;
        commission = (earning *
            (double.parse(element1.get('commission').toString())
                .toPrecision(2) /
                100));
        QuerySnapshot payoutQuery = await FirebaseFirestore.instance
            .collection('payouts')
            .where('restaurant_id', isEqualTo: element1.get('id'))
            .get();
        double payoutAmount = 0;
        for (var element3 in payoutQuery.docs) {
          payoutAmount = payoutAmount +
              double.parse(element3.get('amount').toString()).toPrecision(2);
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
      }
    });
    Future.delayed(const Duration(seconds: 4)).whenComplete(() => getRevenue());
  }

  double? totalEarning = 0;
  double? totalProfit = 0;
  getRevenue() {
    for (var element in reportList) {
      setState(() {
        totalEarning = totalEarning! +
            double.parse(element['earning'].toString()).toPrecision(2);
        totalProfit = totalProfit! +
            (double.parse(element['earning'].toString()) -
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
    double _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    color: customThemeColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          // Text(
                          //   totalBites == 0 ? '...' : "$totalBites",
                          //   style: const TextStyle(
                          //       fontFamily: "Nunito",
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 25),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // const Text(
                          //   "Total Bites",
                          //   style: TextStyle(
                          //       fontFamily: "Nunito",
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.w600),
                          // ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.restaurant,
                        color: Colors.white,
                        size: 35,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    color: customThemeColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            totalOrders == 0 ? '...' : "$totalOrders",
                            style: const TextStyle(
                                fontFamily: "Nunito",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Total Orders",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                        size: 35,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                    color: customThemeColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ///---weekly
                          InkWell(
                            onTap: () {
                              setState(() {
                                getReportDetail();
                                earningType = 2;
                                loader = true;
                                totalProfit = 0;
                                totalEarning = 0;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: earningType == 2
                                      ? Colors.grey
                                      : Colors.white24,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  'This Week',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),

                          ///---monthly
                          InkWell(
                            onTap: () {
                              setState(() {
                                getReportDetail();
                                earningType = 1;
                                loader = true;
                                totalProfit = 0;
                                totalEarning = 0;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: earningType == 1
                                      ? Colors.grey
                                      : Colors.white24,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  'This Month',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),

                          ///---yearly
                          InkWell(
                            onTap: () {
                              getReportDetail();
                              setState(() {
                                earningType = 0;
                                loader = true;
                                totalProfit = 0;
                                totalEarning = 0;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: earningType == 0
                                      ? Colors.grey
                                      : Colors.white24,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  'This Year',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                loader ? '...' : 'Rs'+double.parse(totalEarning.toString()).toPrecision(2).toString(),
                                style: const TextStyle(
                                    fontFamily: "Nunito",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Total Earnings",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.white,
                            size: 35,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                    color: customThemeColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ///---weekly
                          InkWell(
                            onTap: () {
                              setState(() {
                                getReportDetail();
                                earningType = 2;
                                loader = true;
                                totalProfit = 0;
                                totalEarning = 0;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: earningType == 2
                                      ? Colors.grey
                                      : Colors.white24,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  'This Week',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),

                          ///---monthly
                          InkWell(
                            onTap: () {
                              setState(() {
                                getReportDetail();
                                earningType = 1;
                                loader = true;
                                totalProfit = 0;
                                totalEarning = 0;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: earningType == 1
                                      ? Colors.grey
                                      : Colors.white24,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  'This Month',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),

                          ///---yearly
                          InkWell(
                            onTap: () {
                              setState(() {
                                getReportDetail();
                                earningType = 0;
                                loader = true;
                                totalProfit = 0;
                                totalEarning = 0;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: earningType == 0
                                      ? Colors.grey
                                      : Colors.white24,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  'This Year',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                loader ? '...' : 'Rs'+double.parse(totalProfit.toString()).toPrecision(2).toString(),
                                style: const TextStyle(
                                    fontFamily: "Nunito",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Total Profits",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.white,
                            size: 35,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     Container(
        //       child: Row(
        //         children: [
        //           Icon(
        //             Icons.menu_rounded,
        //             color: Global.deepOrange,
        //             size: 40,
        //           ),
        //           SizedBox(
        //             width: 10,
        //           ),
        //           Text(
        //             "$totalBites",
        //             style: TextStyle(
        //                 fontFamily: "Nunito",
        //                 color: Colors.black87,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 25),
        //           ),
        //           SizedBox(
        //             width: 5,
        //           ),
        //           Text(
        //             "Bites",
        //             style: TextStyle(
        //                 fontFamily: "Nunito",
        //                 color: Colors.black,
        //                 fontWeight: FontWeight.w600),
        //           ),
        //           SizedBox(
        //             width: 5,
        //           ),
        //         ],
        //       ),
        //     ),
        //     SizedBox(
        //       width: _width / 64,
        //     ),
        //     Container(
        //       child: Row(
        //         children: [
        //           Icon(
        //             Icons.swap_vert_rounded,
        //             color: Global.deepOrange,
        //             size: 40,
        //           ),
        //           SizedBox(
        //             width: 10,
        //           ),
        //           Text(
        //             "$totalOrders",
        //             style: TextStyle(
        //                 fontFamily: "Nunito",
        //                 color: Colors.black87,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 25),
        //           ),
        //           SizedBox(
        //             width: 5,
        //           ),
        //           Text(
        //             "Orders",
        //             style: TextStyle(
        //                 fontFamily: "Nunito",
        //                 color: Colors.black,
        //                 fontWeight: FontWeight.w600),
        //           ),
        //           SizedBox(
        //             width: 5,
        //           ),
        //           Text(
        //             "",
        //             style: TextStyle(
        //                 fontFamily: "Nunito",
        //                 color: Colors.green,
        //                 fontSize: 12,
        //                 fontWeight: FontWeight.w600),
        //           ),
        //         ],
        //       ),
        //     ),
        //     SizedBox(
        //       width: _width / 64,
        //     ),
        //     Container(
        //       child: Row(
        //         children: [
        //           Icon(
        //             Icons.people_alt_rounded,
        //             color: Global.deepOrange,
        //             size: 40,
        //           ),
        //           SizedBox(
        //             width: 10,
        //           ),
        //           Text(
        //             "$totalCustomers",
        //             style: TextStyle(
        //                 fontFamily: "Nunito",
        //                 color: Colors.black87,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 25),
        //           ),
        //           SizedBox(
        //             width: 5,
        //           ),
        //           Text(
        //             "Customers",
        //             style: TextStyle(
        //                 fontFamily: "Nunito",
        //                 color: Colors.black,
        //                 fontWeight: FontWeight.w600),
        //           ),
        //           SizedBox(
        //             width: 5,
        //           ),
        //           Text(
        //             "",
        //             style: TextStyle(
        //                 fontFamily: "Nunito",
        //                 color: Colors.red,
        //                 fontSize: 12,
        //                 fontWeight: FontWeight.w600),
        //           ),
        //         ],
        //       ),
        //     )
        //     // Text("+2.7%",
        //     //   style: TextStyle(
        //     //       color: Colors.green,
        //     //       fontSize: 12,
        //     //       fontWeight: FontWeight.w600
        //     //   ),
        //     // ),
        //   ],
        // ),
        // Row(
        //   children: [
        //     InfoCard(
        //         // title: "Rides in progress",
        //         // value: "7",
        //         // onTap: () {},
        //         // topColor: Colors.orange,
        //         ),
        //     SizedBox(
        //       width: _width / 64,
        //     ),
        //     InfoCard(
        //         // title: "Packages delivered",
        //         // value: "17",
        //         // topColor: Colors.lightGreen,
        //         // onTap: () {},
        //         ),
        //     SizedBox(
        //       width: _width / 64,
        //     ),
        //     InfoCard(
        //         // title: "Cancelled delivery",
        //         // value: "3",
        //         // topColor: Colors.redAccent,
        //         // onTap: () {},
        //         ),
        //     // SizedBox(
        //     //   width: _width / 64,
        //     // ),
        //     // InfoCard(
        //     //   // title: "Scheduled deliveries",
        //     //   // value: "32",
        //     //   // onTap: () {},
        //     // ),
        //   ],
        // ),
      ],
    );
  }
}
