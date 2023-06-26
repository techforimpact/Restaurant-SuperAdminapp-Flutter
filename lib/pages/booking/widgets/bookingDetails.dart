import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../constants/controller.dart';
import '../../../constants/style.dart';
import '../../../helpers/responsiveness.dart';
import '../../../utils/responsive.dart';

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

class BookingDetailsPage extends StatefulWidget {
  const BookingDetailsPage({Key? key, this.bookingModel, this.restModel})
      : super(key: key);

  final DocumentSnapshot? bookingModel;
  final DocumentSnapshot? restModel;
  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  @override
  Widget build(BuildContext context) {
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
        )),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: ResponsiveWidget.isSmallScreen(context) ? 56 : 40,
              ),
              child: Text(
                "Details",
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
                      Container(
                        width: 500,
                        // height: 550,
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
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    'Bite',
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
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 300,
                                    height: 200,
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        '${widget.bookingModel!.get('image')}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Text(
                                    '${widget.bookingModel!.get('name')}',
                                    style: const TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: active,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                                color: active.withOpacity(0.3))
                                          ]),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Rs${widget.bookingModel!.get('dis_price')}',
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: active,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          '0',
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    widget.bookingModel!
                                                .get('name')
                                                .toString() !=
                                            ''
                                        ? const SizedBox()
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0),
                                                child: Row(
                                                  children: const [
                                                    Text(
                                                      'Bag Items',
                                                      style: TextStyle(
                                                          fontFamily: "Nunito",
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.black),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${widget.bookingModel!.get('items')}',
                                                      style: const TextStyle(
                                                          fontFamily: "Nunito",
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.black38),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        children: const [
                                          Text(
                                            'Category',
                                            style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(
                                            widget.bookingModel!
                                                .get('category')
                                                .length, (i) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              '${widget.bookingModel!.get('category')[i]},',
                                              style: const TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black38),
                                            ),
                                          );
                                        })),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        children: const [
                                          Text(
                                            'Chefs Note',
                                            style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${widget.bookingModel!.get('chef_note')}',
                                            style: const TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black38),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
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
                              // height: 530,
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
                                      height: 30,
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
                                          "${widget.restModel!.get('name')}",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
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
                                          "${widget.restModel!.get('phone')}",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
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
                                          "${widget.restModel!.get('website_address')}",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
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
                                            "${widget.restModel!.get('address')}",
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
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )

              // OrderWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
