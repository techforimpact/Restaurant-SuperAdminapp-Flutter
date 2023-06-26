import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../constants.dart';
import '../../../constants/controller.dart';
import '../../../constants/style.dart';
import '../../../helpers/responsiveness.dart';
import '../../../responsive_layout.dart';
import '../../../utils/global.dart';

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

List<String> _buttonNames = [
  "All Status",
  "New Order",
  "On Progress",
  "Delivered"
];
List<String> _pageNo = ["1", "2", "3", "4"];
int _currentSelectedButton = 0;
int _currentSelectedButton1 = 1;

class CustomerDetailsPage extends StatefulWidget {
  const CustomerDetailsPage({Key? key, this.userModel}) : super(key: key);

  final DocumentSnapshot? userModel;
  @override
  State<CustomerDetailsPage> createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
  List<String> _banner = [
    "Date",
    "Restaurent",
    "Amount",
  ];

  List<Status> _status = [
    Status(
        name: "+919191919191",
        color: const Color(0xfff8b250),
        orderid: "04-01-2022",
        date: "xyz@gmail.com",
        customer: "Grill Hub",
        price: "Rs164.52"),
    Status(
        name: "+919191919191",
        color: const Color(0xff13d38e),
        orderid: "04-01-2022",
        date: "xyz@gmail.com",
        customer: "Grill Hub",
        price: "Rs74.92"),
    Status(
        name: "+919191919191",
        color: Colors.grey,
        orderid: "04-01-2022",
        date: "xyz@gmail.com",
        customer: "Grill Hub",
        price: "Rs251.16"),
    Status(
        name: "+919191919191",
        color: const Color(0xfff8b250),
        orderid: "04-01-2022",
        date: "xyz@gmail.com",
        customer: "Grill Hub",
        price: "Rs82.46"),
    Status(
        name: "+919191919191",
        color: const Color(0xff13d38e),
        orderid: "04-01-2022",
        date: "xyz@gmail.com",
        customer: "Grill Hub",
        price: "Rs24.17"),
    Status(
        name: "+919191919191",
        color: const Color(0xfff8b250),
        orderid: "04-01-2022",
        date: "xyz@gmail.com",
        customer: "Grill Hub",
        price: "Rs24.55"),
    Status(
        name: "+919191919191",
        color: Colors.grey,
        orderid: "04-01-2022",
        date: "xyz@gmail.com",
        customer: "Samantha Bake",
        price: "Rs22.18"),
    Status(
        name: "+919191919191",
        color: Colors.grey,
        orderid: "04-01-2022",
        date: "xyz@gmail.com",
        customer: "Grill Hub",
        price: "Rs45.86"),
    Status(
        name: "+919191919191",
        color: const Color(0xff13d38e),
        orderid: "04-01-2022",
        date: "xyz@gmail.com",
        customer: "Grill Hub",
        price: "Rs34.41"),
    Status(
        name: "+919191919191",
        color: const Color(0xff13d38e),
        orderid: "04-01-2022",
        date: "xyz@gmail.com",
        customer: "Grill Hub",
        price: "Rs44.99"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
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
              ],
            )),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: ResponsiveWidget.isSmallScreen(context) ? 56 : 40,
              ),
              child: Text(
                "Customer Details",
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 500,
                        height: 400,
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
                          padding: const EdgeInsets.only(left: 20, right: 20),
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
                                height: 60,
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
                                  Text(
                                    "customer",
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
                                  Text(
                                    "+919292929252",
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
                                  Text(
                                    "5 Lancaster St.Eastlake",
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: active),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              width: 500,
                              height: 400,
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
                                      height: 60,
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
                                          "Rs100",
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
                                          "Total Savings",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Rs20",
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
                                          "Total Net Price",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Rs80",
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
                                          "Zero Hero Rank",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "95",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: active),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.end,
                                    //   children: [
                                    //     SizedBox(
                                    //       height: 60,
                                    //       // width: 120,
                                    //       child: ElevatedButton(
                                    //           onPressed: (){
                                    //           },
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
                height: 30,
              ),

              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top:
                              ResponsiveWidget.isSmallScreen(context) ? 56 : 40,
                        ),
                        child: Text(
                          "Order History",
                          style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: active),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 1230,
                    color: Global.deepOrange,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            _banner.length,
                            (index) => FlatButton(
                              color: _currentSelectedButton == index
                                  ? Global.deepOrange
                                  : Global.deepOrange,
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(Constants.kPadding * 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      _banner[index],
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ],
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
                  Card(
                    color: Colors.white,
                    elevation: 3,
                    child: Column(
                      children: List.generate(
                        _status.length,
                        (index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) =>
                                        const CustomerDetailsPage()));
                          },
                          child: ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: Text(
                                _status[index].orderid,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            title: Center(
                              child: Text(
                                _status[index].customer,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //
                            //     Text(
                            //       _status[index].customer,
                            //       style: TextStyle(color: Colors.black),
                            //     ),
                            //     // Text(
                            //     //   _status[index].name,
                            //     //   style: TextStyle(color: Colors.black),
                            //     // ),
                            //     Text(
                            //       _status[index].price,
                            //       style: TextStyle(color: Colors.black),
                            //     ),
                            //
                            //   ],
                            // ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 150.0),
                              child: Text(
                                _status[index].price,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),

                        // ListTile(
                        //   leading: Padding(
                        //     padding: const EdgeInsets.only(left: 60),
                        //     child: Text(
                        //       _status[index].orderid,
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //   ),
                        //
                        //   title: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //     children: [
                        //       Text(
                        //         _status[index].date,
                        //         style: TextStyle(color: Colors.black),
                        //       ),
                        //       Text(
                        //         _status[index].customer,
                        //         style: TextStyle(color: Colors.black),
                        //       ),
                        //       Text(
                        //         _status[index].price,
                        //         style: TextStyle(color: Colors.black),
                        //       ),
                        //       Container(
                        //         width: 75,
                        //         height: 30,
                        //         decoration: BoxDecoration(
                        //             color: _status[index].color
                        //         ),
                        //         child: Align(
                        //           alignment: Alignment.center,
                        //           child: Text(
                        //             _status[index].name,
                        //             style: TextStyle(color: Colors.white),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        //   trailing: IconButton(
                        //       onPressed: () {},
                        //       icon: Icon(
                        //         Icons.more_horiz_outlined,
                        //         color: Colors.black,
                        //       )
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Showing 10 from 46 data",
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              if (ResponsiveLayout.isComputer(context))
                                ...List.generate(
                                  _pageNo.length,
                                  (index) => FlatButton(
                                    minWidth: 15,
                                    color: _currentSelectedButton1 == index
                                        ? Global.deepOrange
                                        : Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        _currentSelectedButton1 = index;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          Constants.kPadding * 2),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            _pageNo[index],
                                            style: TextStyle(
                                              color: _currentSelectedButton1 ==
                                                      index
                                                  ? Colors.black
                                                  : Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              else
                                Padding(
                                  padding: const EdgeInsets.all(
                                      Constants.kPadding * 2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        _buttonNames[_currentSelectedButton1],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(
                                            Constants.kPadding / 2),
                                        width: 60,
                                        height: 2,
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Constants.red,
                                              Constants.orange,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    // _currentSelectedButton1 ;
                                  });
                                },
                                icon: const Icon(
                                  Icons.double_arrow,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ),

              // OrderWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
