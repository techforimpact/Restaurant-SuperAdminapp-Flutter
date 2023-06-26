import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/general_controller.dart';
import '../../../utils/responsive.dart';
import '../overview.dart';

class OverviewCardsLargeScreen extends StatefulWidget {
  const OverviewCardsLargeScreen({Key? key}) : super(key: key);

  @override
  State<OverviewCardsLargeScreen> createState() => _OverviewCardsLargeScreenState();
}

class _OverviewCardsLargeScreenState extends State<OverviewCardsLargeScreen> {

   @override
  void initState() {
    getReportDetail();
    getReportDetailForProfit();
    super.initState();
  }

  int? earningType = 0;
  int? earningTypeForProfit = 0;
 double? totalEarning = 0;
  double? totalProfit = 0;
    bool loader = true;
  bool loaderForProfit = true;

  List<Map<String, dynamic>> reportList = [];
  List<Map<String, dynamic>> reportListForProfit = [];
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


  getReportDetailForProfit() async {
    reportListForProfit = [];
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
          reportListForProfit.add({
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
          reportListForProfit.add({
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
          reportListForProfit.add({
            'name': element1.get('name'),
            'earning': earning,
            'commission': commission,
            'paid': payoutAmount,
            'net': net
          });
        });
      }
    });
    Future.delayed(const Duration(seconds: 4)).whenComplete(() => getRevenueForProfit());
  }


 
  getRevenue() {
    for (var element in reportList) {
      setState(() {
        totalEarning = totalEarning! +
            double.parse(element['earning'].toString()).toPrecision(2);
      });
    }
    setState(() {
      loader = false;
    });
  }

 getRevenueForProfit() {
    for (var element in reportListForProfit) {
      setState(() {
        totalProfit = totalProfit! +
            (double.parse(element['earning'].toString()) -
                double.parse(element['commission'].toString()));
      });
    }
    setState(() {
      loaderForProfit = false;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        //first row
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
                        children:  [
                          Text(
                            totalProducts == 0 ? '...' : "$totalProducts",
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
                            "Total Products",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
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
        //second row
        Row(
          children: [
            //total earning
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
            //total profit
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
                                getReportDetailForProfit();
                                earningTypeForProfit = 2;
                                loaderForProfit = true;
                                totalProfit = 0;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: earningTypeForProfit == 2
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
                                getReportDetailForProfit();
                                earningTypeForProfit = 1;
                                loaderForProfit = true;
                                totalProfit = 0;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: earningTypeForProfit == 1
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
                                getReportDetailForProfit();
                                earningTypeForProfit = 0;
                                loaderForProfit = true;
                                totalProfit = 0;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: earningTypeForProfit == 0
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
                                loaderForProfit ? '...' : 'Rs'+double.parse(totalProfit.toString()).toPrecision(2).toString(),
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
      
      ],
    );
  }
}
