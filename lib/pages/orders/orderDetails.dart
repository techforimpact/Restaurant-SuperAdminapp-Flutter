
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constants/controller.dart';
import '../../constants/style.dart';
import '../../helpers/responsiveness.dart';
import '../../utils/responsive.dart';

class Status {
  String name;
  String orderid;
  String date;
  String price;
  String customer;
  Color color;
  Status(
      {required this.name,
      required this.color,
      required this.orderid,
      required this.date,
      required this.price,
      required this.customer});
}

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage(
      {Key? key,
      this.documentSnapshot,
      this.restDocumentSnapshot,
      this.userDocumentSnapshot})
      : super(key: key);

  final DocumentSnapshot? documentSnapshot;
  final DocumentSnapshot? restDocumentSnapshot;
  final DocumentSnapshot? userDocumentSnapshot;
  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final List<Status> _status = [
    Status(
        name: "Pending",
        color: const Color(0xfff8b250),
        orderid: "#5552351",
        date: "26 March 2020, 12:42 AM",
        customer: "James WItcwicky",
        price: "Rs164.52"),
    Status(
        name: "Delivered",
        color: const Color(0xff13d38e),
        orderid: "#5552323",
        date: "26 March 2020, 12:42 AM",
        customer: "Veronica",
        price: "Rs74.92"),
    Status(
        name: "Cancelled",
        color: Colors.grey,
        orderid: "#5552375",
        date: "26 March 2020, 02:12 AM",
        customer: "Emilia Johanson",
        price: "Rs251.16"),
    Status(
        name: "Pending",
        color: const Color(0xfff8b250),
        orderid: "#5552311",
        date: "26 March 2020, 12:42 AM",
        customer: "Olivia Shine",
        price: "Rs82.46"),
    Status(
        name: "Delivered",
        color: const Color(0xff13d38e),
        orderid: "#5552388",
        date: "26 March 2020, 12:42 AM",
        customer: "Jessica Wong",
        price: "Rs24.17"),
    Status(
        name: "Pending",
        color: const Color(0xfff8b250),
        orderid: "#5552322",
        date: "26 March 2020, 01:42 PM",
        customer: "David Horison",
        price: "Rs24.55"),
    Status(
        name: "Cancelled",
        color: Colors.grey,
        orderid: "#5552322",
        date: "26 March 2020, 01:42 PM",
        customer: "Samantha Bake",
        price: "Rs22.18"),
    Status(
        name: "Cancelled",
        color: Colors.grey,
        orderid: "#5552397",
        date: "26 March 2020, 01:42 PM",
        customer: "Franky Sihotang",
        price: "Rs45.86"),
    Status(
        name: "Delivered",
        color: const Color(0xff13d38e),
        orderid: "#5552349",
        date: "26 March 2020, 01:42 PM",
        customer: "Roberto Carlo",
        price: "Rs34.41"),
    Status(
        name: "Delivered",
        color: const Color(0xff13d38e),
        orderid: "#5552356",
        date: "26 March 2020, 01:42 PM",
        customer: "Rendy Greenlee",
        price: "Rs44.99"),
  ];

  @override
  Widget build(BuildContext context) {
    DateTime dt =
        (widget.documentSnapshot!.get('date_time') as Timestamp).toDate();
    return Column(
      children: [
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: ResponsiveWidget.isSmallScreen(context) ? 56 : 40,
              ),
              child: Text(
                menuController.activeItem.value,
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: active),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: customThemeColor),
                  child: const Center(
                    child: Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        )),        Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: ResponsiveWidget.isSmallScreen(context) ? 56 : 40,
              ),
              child: Text(
                "Order Details",
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: active),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Container(
                          width: 500,
                          // height: 590,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: active.withOpacity(.4), width: .5),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 6),
                                  color: active.withOpacity(.1),
                                  blurRadius: 12)
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Wrap(
                                children: List.generate(
                                    widget.documentSnapshot!
                                        .get('product_list')
                                        .length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 450,
                                      // height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: const Offset(0, 6),
                                              color: active.withOpacity(.1),
                                              blurRadius: 4)
                                        ],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: 80,
                                              width: 80,
                                              decoration: const BoxDecoration(
                                                  color: Colors.grey,
                                                  shape: BoxShape.circle),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                child: Image.network(
                                                  '${widget.documentSnapshot!.get('product_list')[index]['image']}',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  '${widget.documentSnapshot!.get('product_list')[index]['name']}',
                                                  style: const TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                  '${dt.toString()}',
                                                  style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey[200]),
                                                ),
                                                Text(
                                                  '${widget.documentSnapshot!.get('restaurant')}',
                                                  style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey[200]),
                                                )
                                              ],
                                            ),
                                            Text(
                                              'Rs${widget.documentSnapshot!.get('product_list')[index]['dis_price'].toString()}',
                                              style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: active),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              width: 500,
                              // height: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: active.withOpacity(.4), width: .5),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 6),
                                      color: active.withOpacity(.1),
                                      blurRadius: 12)
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text(
                                        'Restaurent',
                                        style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: active),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Name",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        SelectableText(
                                          '${widget.documentSnapshot!.get('restaurant')}',
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Phone No.",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        SelectableText(
                                          '${widget.restDocumentSnapshot!.get('phone')}',
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Website",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        SelectableText(
                                          '${widget.restDocumentSnapshot!.get('website_address')}',
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Address",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Expanded(
                                          child: SelectableText(
                                            '${widget.restDocumentSnapshot!.get('address')}',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: active),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 500,
                              // height: 230,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: active.withOpacity(.4), width: .5),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 6),
                                      color: active.withOpacity(.1),
                                      blurRadius: 12)
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text(
                                        'Customer',
                                        style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: active),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Name",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        SelectableText(
                                          "${widget.userDocumentSnapshot!.get('name')}",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Email",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        SelectableText(
                                          "${widget.userDocumentSnapshot!.get('email')}",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Phone No.",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        SelectableText(
                                          "${widget.userDocumentSnapshot!.get('phone')}",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),
                                    // SizedBox(
                                    //   height: 20,
                                    // ),
                                    //
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text("Address",
                                    //       style: TextStyle(
                                    //           fontFamily: "Nunito",
                                    //           fontSize: 17,
                                    //           fontWeight: FontWeight.w300,
                                    //           color: Colors.grey
                                    //       ),
                                    //
                                    //     ),
                                    //     Text("5 Lancaster St.Eastlake",
                                    //       style: TextStyle(
                                    //           fontFamily: "Nunito",
                                    //           fontSize: 15,
                                    //           fontWeight: FontWeight.bold,
                                    //           color: active
                                    //       ),
                                    //
                                    //     )
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 500,
                              // height: 230,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: active.withOpacity(.4), width: .5),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 6),
                                      color: active.withOpacity(.1),
                                      blurRadius: 12)
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text(
                                        'Take Away',
                                        style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: active),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Do you want it Take away?",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        SelectableText(
                                          widget.documentSnapshot!
                                              .get('isTakeAway')
                                              .toString() ==
                                              'true'
                                              ? "Yes"
                                              : "No",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 500,
                              // height: 230,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: active.withOpacity(.4), width: .5),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 6),
                                      color: active.withOpacity(.1),
                                      blurRadius: 12)
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        // const Text(
                                        //   "Bite Points",
                                        //   style: TextStyle(
                                        //       fontFamily: "Nunito",
                                        //       fontSize: 17,
                                        //       fontWeight: FontWeight.w300,
                                        //       color: Colors.grey),
                                        // ),
                                        // SelectableText(
                                        //   widget.documentSnapshot!
                                        //       .get('bite_points')
                                        //       .toString(),
                                        //   style: TextStyle(
                                        //       fontFamily: "Nunito",
                                        //       fontSize: 15,
                                        //       fontWeight: FontWeight.bold,
                                        //       color: active),
                                        // )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 500,
                              // height: 400,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: active.withOpacity(.4), width: .5),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 6),
                                      color: active.withOpacity(.1),
                                      blurRadius: 12)
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 20),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text(
                                        "Summary",
                                        style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: active),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Total Price",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Rs${widget.documentSnapshot!.get('total_price')}",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Product Discount",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "${widget.documentSnapshot!.get('total_discount_percentage')}%",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Coupon Discount",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Rs${widget.documentSnapshot!.get('coupon_discount')}",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Gross Total",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Rs${widget.documentSnapshot!.get('net_price') - int.parse(widget.documentSnapshot!.get('coupon_discount').toString())}",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Commission",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "${widget.restDocumentSnapshot!.get('commission').toString()}%",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Net Price",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Rs${widget.documentSnapshot!.get('net_price') - ((int.parse(widget.restDocumentSnapshot!.get('commission').toString()) ~/ 100))}",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    // SizedBox(
                                    //   height: 100,
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.end,
                                    //   children: [
                                    //     SizedBox(
                                    //       height: 60,
                                    //       // width: 120,
                                    //       child: ElevatedButton(
                                    //           onPressed: (){
                                    //             },
                                    //           style: ElevatedButton.styleFrom(
                                    //               primary: active,
                                    //               shape: RoundedRectangleBorder(
                                    //                 borderRadius: BorderRadius.circular(30.0),
                                    //
                                    //               )
                                    //           ),
                                    //           child:Align(
                                    //             alignment: Alignment.center,
                                    //             child: Text(
                                    //               'Order Processed',
                                    //               style: TextStyle(
                                    //                 color: Colors.white,
                                    //               ),
                                    //             ),
                                    //           )
                                    //       ),
                                    //     ),
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              // OrderWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
