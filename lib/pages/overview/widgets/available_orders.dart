import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../component/custom_text.dart';
import '../../../constants/style.dart';
import '../../../controllers/general_controller.dart';
import '../../../utils/global.dart';
import '../../orders/orderDetails.dart';

class Person {
  String name;
  String orderid;
  String price;
  String menu;
  String status;
  String quantity;
  Color color;
  Person(
      {required this.name,
      required this.color,
      required this.orderid,
      required this.price,
      required this.quantity,
      required this.menu,
      required this.status});
}

class RecentOrder extends StatefulWidget {
  @override
  State<RecentOrder> createState() => _RecentOrderState();
}

class _RecentOrderState extends State<RecentOrder> {
  final List<Person> _persons = [
    Person(
        name: "Theia Bowen",
        color: const Color(0xff13d38e),
        menu: "Sweet Cheezy Pizza Meal",
        orderid: "#5552351",
        price: "Rs4.2",
        quantity: "x2",
        status: "Delivered"),
    Person(
        name: "Fariha Odling",
        color: const Color(0xfff8b250),
        menu: "Tuna soup spinach",
        orderid: "#5552323",
        price: "Rs4.2",
        quantity: "x3",
        status: "Pending"),
    Person(
        name: "Viola Willis",
        color: Colors.grey,
        menu: "Extreme Deluxe Pizza",
        orderid: "#5552375",
        price: "Rs4.2",
        quantity: "x2",
        status: "Cancelled"),
    Person(
        name: "Emmett Forrest",
        color: const Color(0xfff8b250),
        menu: "Mozarella Pizza with Random",
        orderid: "#5552311",
        price: "Rs4.2",
        quantity: "x2",
        status: "Pending"),
    Person(
        name: "Nick Jarvis",
        color: const Color(0xff13d38e),
        menu: "Tuna soup spinach",
        orderid: "#5552311",
        price: "Rs4.2",
        quantity: "x2",
        status: "Delivered"),
    Person(
        name: "ThAmit Clayeia",
        color: const Color(0xfff8b250),
        menu: "Mozarella Pizza with Random",
        orderid: "#5552311",
        price: "Rs4.2",
        quantity: "x2",
        status: "Pending"),
    Person(
        name: "ThAmalie Howardeia",
        color: Colors.grey,
        menu: "Sweet Cheezy Pizza Meal",
        orderid: "#5552311",
        price: "Rs4.2",
        quantity: "x2",
        status: "Cancelled"),
    Person(
        name: "Campbell Britton",
        color: const Color(0xff13d38e),
        menu: "Tuna soup spinach",
        orderid: "#5552311",
        price: "Rs4.2",
        quantity: "x2",
        status: "Delivered"),
    Person(
        name: "Haley Mellor",
        color: const Color(0xfff8b250),
        menu: "Extreme Deluxe Pizza",
        orderid: "#5552311",
        price: "Rs4.2",
        quantity: "x2",
        status: "Pending"),
    Person(
        name: "Harlen Higgins",
        color: const Color(0xff13d38e),
        menu: "Extreme Deluxe Pizza",
        orderid: "#5552311",
        price: "Rs4.2",
        quantity: "x2",
        status: "Delivered"),
  ];

  final List<String> _banner = [
    "Sr.",
    "Order ID",
    "Date",
    "Customer ID",
    "Amount",
    "Status Order",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 6),
                color: active.withOpacity(.1),
                blurRadius: 12)
          ],
          // border: Border.all(color: lightGrey, width: .5),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                CustomText(
                  text: 'Recent Order Request',
                  color: lightGrey,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
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
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  _banner[index],
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
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('orders')
                    .orderBy('date_time', descending: true)
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
                        children:
                            List.generate(snapshot.data!.docs.length, (index) {
                          DateTime dt = (snapshot.data!.docs[index]
                                  .get('date_time') as Timestamp)
                              .toDate();
                          if (snapshot.data!.docs[index].get('restaurant_id') ==
                              Get.find<GeneralController>()
                                  .boxStorage
                                  .read('id')) {
                            return InkWell(
                              onTap: () async {
                                QuerySnapshot query = await FirebaseFirestore
                                    .instance
                                    .collection('restaurants')
                                    .where("id",
                                        isEqualTo: snapshot.data!.docs[index]
                                            .get('restaurant_id'))
                                    .get();
                                QuerySnapshot query1 = await FirebaseFirestore
                                    .instance
                                    .collection('users')
                                    .where("uid",
                                        isEqualTo: snapshot.data!.docs[index]
                                            .get('uid'))
                                    .get();

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => OrderDetailsPage(
                                              documentSnapshot:
                                                  snapshot.data!.docs[index],
                                              restDocumentSnapshot:
                                                  query.docs[0],
                                              userDocumentSnapshot:
                                                  query1.docs[0],
                                            )));
                              },
                              child: SizedBox(
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              .get('id')
                                              .toString(),
                                          style:
                                              const TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${dt.toString().substring(0, 10)} - ${dt.toString().substring(11, 16)}',
                                          style:
                                              const TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              .get('uid')
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style:
                                              const TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Rs${snapshot.data!.docs[index].get('grand_total').toString()}",
                                          style:
                                              const TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 90,
                                          height: 40,
                                          // padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: snapshot.data!
                                                .docs[index]
                                                .get('status')
                                                .toString() ==
                                                'Complete'
                                                ? Colors.green
                                                : const Color(0XFFc4de8c),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                  .get('status')
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        }),
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

            // Column(
            //   children: List.generate(
            //     _persons.length,
            //         (index) => Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Container(
            //         height: 70,
            //         decoration: BoxDecoration(
            //             color: Colors.white,
            //             boxShadow: [
            //               BoxShadow(
            //                   color: Global.deepOrange.withOpacity(0.2),
            //                   blurRadius: 5
            //               )
            //             ]
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: [
            //             Container(
            //               color: _persons[index].color,
            //               width: 60,
            //               height: 60,
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Text(
            //                     _persons[index].menu,
            //                     style: TextStyle(
            //                         color: Colors.black87,
            //                         fontWeight: FontWeight.w700
            //                     ),
            //                   ),
            //                   Text(
            //                     _persons[index].orderid,
            //                     style: TextStyle(color: Global.deepOrange),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //
            //             Text(
            //               _persons[index].name,
            //               style: TextStyle(
            //                   color: Colors.black87,
            //                   fontWeight: FontWeight.w700
            //               ),
            //             ),
            //             Container(
            //               color: Colors.white,
            //               height: 15,
            //               child: Row(
            //                 children: [
            //                   Text(_persons[index].price,
            //                     style: TextStyle(
            //                         color: Colors.black87,
            //                         fontWeight: FontWeight.w700
            //                     ),
            //                   ),
            //                   SizedBox(
            //                     width: 5,
            //                   ),
            //                   Text(
            //                     _persons[index].quantity,
            //                     style: TextStyle(
            //                         color: Colors.black,
            //                         fontWeight: FontWeight.w500
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //
            //             Container(
            //               height: 30,
            //               width: 70,
            //               decoration: BoxDecoration(
            //                   border: Border.all(color: _persons[index].color)
            //               ),
            //               child: Align(
            //                 alignment: Alignment.center,
            //                 child: Text(
            //                   _persons[index].status,
            //                   style: TextStyle(
            //                       color: _persons[index].color,
            //                       fontWeight: FontWeight.w700
            //                   ),
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //
            //     //         ListTile(
            //     //   leading: Text(
            //     //     _persons[index].menu,
            //     //     style: TextStyle(color: Colors.white),
            //     //   ),
            //     //   title: Text(
            //     //     _persons[index].name,
            //     //     style: TextStyle(color: Colors.white),
            //     //   ),
            //     //   trailing: Text(_persons[index].price)
            //     // ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
