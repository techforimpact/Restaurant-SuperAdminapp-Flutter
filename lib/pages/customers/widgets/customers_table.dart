import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../constants/style.dart';
import '../../../models/style.dart';
import '../../../responsive_layout.dart';
import '../../../utils/global.dart';
import 'customerDetails.dart';

class Status {
  String name;
  String orderid;
  bool enable;
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

class CustomerTable extends StatefulWidget {
  @override
  State<CustomerTable> createState() => _CustomerTableState();
}

class _CustomerTableState extends State<CustomerTable> {
  String dropdownvalue = 'All';

  late String valueChoose;
  var items = ['All', 'This Week', 'This Month', 'This Year'];

  final List<String> _banner = [
    "Customer ID",
    "Email",
    "Customer Name",
    "Phone no.",
    "Total Spent",
  ];

  final List<Status> _status = [
    Status(
        enable: false,
        name: "+919191919191",
        color: const Color(0xfff8b250),
        orderid: "#C-52351",
        date: "xyz@gmail.com",
        customer: "James WItcwicky",
        price: "Rs164.52"),
    Status(
        enable: false,
        name: "+919191919191",
        color: const Color(0xff13d38e),
        orderid: "#C-52323",
        date: "xyz@gmail.com",
        customer: "Veronica",
        price: "Rs74.92"),
    Status(
        enable: false,
        name: "+919191919191",
        color: Colors.grey,
        orderid: "#C-52375",
        date: "xyz@gmail.com",
        customer: "Emilia Johanson",
        price: "Rs251.16"),
    Status(
        enable: false,
        name: "+919191919191",
        color: const Color(0xfff8b250),
        orderid: "#C-52311",
        date: "xyz@gmail.com",
        customer: "Olivia Shine",
        price: "Rs82.46"),
    Status(
        enable: false,
        name: "+919191919191",
        color: const Color(0xff13d38e),
        orderid: "#C-52388",
        date: "xyz@gmail.com",
        customer: "Jessica Wong",
        price: "Rs24.17"),
    Status(
        enable: false,
        name: "+919191919191",
        color: const Color(0xfff8b250),
        orderid: "#C-52322",
        date: "xyz@gmail.com",
        customer: "David Horison",
        price: "Rs24.55"),
    Status(
        enable: false,
        name: "+919191919191",
        color: Colors.grey,
        orderid: "#C-52322",
        date: "xyz@gmail.com",
        customer: "Samantha Bake",
        price: "Rs22.18"),
    Status(
        enable: false,
        name: "+919191919191",
        color: Colors.grey,
        orderid: "#C-52397",
        date: "xyz@gmail.com",
        customer: "Franky Sihotang",
        price: "Rs45.86"),
    Status(
        enable: false,
        name: "+919191919191",
        color: const Color(0xff13d38e),
        orderid: "#C-52349",
        date: "xyz@gmail.com",
        customer: "Roberto Carlo",
        price: "Rs34.41"),
    Status(
        enable: false,
        name: "+919191919191",
        color: const Color(0xff13d38e),
        orderid: "#C-52356",
        date: "xyz@gmail.com",
        customer: "Rendy Greenlee",
        price: "Rs44.99"),
  ];

  bool show = false;
  bool showItems = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          // Row(
          //   children: [
          //     Text("Customer", style: TextStyle(
          //         fontSize: 30,
          //         fontWeight: FontWeight.w800,
          //         color: Global.deepOrange)),
          //   ],
          // ),
          const SizedBox(
            height: 15,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // if (ResponsiveLayout.isComputer(context))
              //   ...List.generate(
              //     _buttonNames.length,
              //         (index) => FlatButton(
              //       color: _currentSelectedButton == index
              //           ?deepOrange:
              //       Colors.white,
              //       onPressed: () {
              //         setState(() {
              //           _currentSelectedButton = index;
              //         });
              //       },
              //       child: Padding(
              //         padding: const EdgeInsets.all(Constants.kPadding * 2),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Text(
              //               _buttonNames[index],
              //               style: TextStyle(
              //                 color: _currentSelectedButton == index
              //                     ? Colors.black
              //                     : Colors.black87,
              //               ),
              //             ),
              //             Container(
              //               margin: EdgeInsets.all(Constants.kPadding / 2),
              //               width: 60,
              //               height: 2,
              //               decoration: BoxDecoration(
              //                 gradient: _currentSelectedButton == index
              //                     ? LinearGradient(
              //                   colors: [
              //                     Constants.red,
              //                     Constants.orange,
              //                   ],
              //                 )
              //                     : null,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   )
              // else
              //   Padding(
              //     padding: const EdgeInsets.all(Constants.kPadding * 2),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Text(
              //           _buttonNames[_currentSelectedButton],
              //           style: TextStyle(
              //             color: Colors.white,
              //           ),
              //         ),
              //         Container(
              //           margin: EdgeInsets.all(Constants.kPadding / 2),
              //           width: 60,
              //           height: 2,
              //           decoration: BoxDecoration(
              //             gradient: LinearGradient(
              //               colors: [
              //                 Constants.red,
              //                 Constants.orange,
              //               ],
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),

              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: deepGreen.withOpacity(0.1),
                        blurRadius: 4,

                        offset: const Offset(0, 4), // changes position of shadow
                      ),
                    ]),
                child: ListTile(
                  //SEARCH BAR
                  trailing: Icon(
                    Icons.search_outlined,
                    color: active,
                  ),
                  title: const TextField(
                    //SEARCH BAR TYPO
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w200,
                        // fontStyle: FontStyle.normal,
                        color: deepGreen,
                        fontSize: 15,
                      ),
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                  ),
                  //FILTER ICON

                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: 30, top: 5, bottom: 5),
                  //   child: IconButton(
                  //     icon: Icon(
                  //       MyIcons.filter_icon,
                  //       color: deepOrange,
                  //     ),
                  //     iconSize: 15,
                  //     onPressed: () {
                  //       showDialog(
                  //           context: context,
                  //           builder: (context) =>
                  //               AlertDialog(
                  //                 shape: RoundedRectangleBorder(
                  //                     borderRadius:
                  //                     BorderRadius
                  //                         .circular(
                  //                         30)),
                  //                 title: Center(
                  //                   child: Text(
                  //                     'Select Your Type',
                  //                     style: TextStyle(
                  //                         fontFamily:
                  //                         "Nunito",
                  //                         fontSize: 14,
                  //                         color: Colors
                  //                             .black,
                  //                         fontWeight:
                  //                         FontWeight
                  //                             .w900),
                  //                   ),
                  //                 ),
                  //                 content: Filter(),
                  //               ));
                  //     },
                  //   ),
                  // ),
                ),
              ),
              const SizedBox(
                width: 760,
              ),

              Container(
                height: 60,
                width: 190,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: active.withOpacity(0.2))],
                    // borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: active)),
                child: Center(
                  child: DropdownButton(
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    elevation: 0,
                    // dropdownColor: active,

                    value: dropdownvalue,
                    icon: const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Colors.black38,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        onTap: () {
                          items;
                        },
                        alignment: Alignment.center,
                        value: items,
                        child: Text(
                          items,
                          style: TextStyle(color: active),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
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
              Container(
                width: 1225,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                builder: (builder) => const CustomerDetailsPage()));
                      },
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Text(
                            _status[index].orderid,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              _status[index].date,
                              style: const TextStyle(color: Colors.black),
                            ),
                            Text(
                              _status[index].customer,
                              style: const TextStyle(color: Colors.black),
                            ),
                            Text(
                              _status[index].name,
                              style: const TextStyle(color: Colors.black),
                            ),
                            Text(
                              _status[index].price,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz_outlined,
                              color: Colors.black,
                            )),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        _pageNo[index],
                                        style: TextStyle(
                                          color:
                                              _currentSelectedButton1 == index
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
                              padding:
                                  const EdgeInsets.all(Constants.kPadding * 2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    _buttonNames[_currentSelectedButton1],
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.all(Constants.kPadding / 2),
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
        ],
      ),
    );
  }
}
