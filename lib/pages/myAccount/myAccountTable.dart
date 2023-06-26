import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/controller.dart';
import '../../constants/style.dart';
import '../../controllers/general_controller.dart';
import '../../login_signup/welcomeScreen.dart';
import '../../models/style.dart';
import '../../routing/routes.dart';

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

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
  void _changePassword(String currentPassword, String newPassword) async {
    final user = await FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user!.email!, password: currentPassword);

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        Get.find<GeneralController>().firebaseAuthentication.signOut();
        menuController.changeActiveItemTo(DashboardPageDisplayName);
        Get.offAll(const WelcomePage());
        Get.snackbar('SUCCESS', 'Password Updated Successfully');
      }).catchError((error) {
        //Error, show something
        Get.snackbar('FAILED', 'Password Incoorect');
      });
    }).catchError((err) {});
  }

  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController currentController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Container(
              //   width: 500,
              //   height: 470,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     // border: Border.all(color: active.withOpacity(.4), width: .5),
              //     boxShadow: [
              //       BoxShadow(
              //           offset: Offset(0, 6),
              //           color: active.withOpacity(.1),
              //           blurRadius: 12)
              //     ],
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //
              //   child: Padding(
              //     padding: const EdgeInsets.all(20.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           children: [
              //             Text(
              //               "Update Account",
              //               style: TextStyle(
              //                   fontFamily: "Nunito",
              //                   fontSize: 20,
              //                   fontWeight: FontWeight.bold,
              //                   color: active
              //               ),
              //
              //             ),
              //           ],
              //         ),
              //         Divider(
              //           color: deepOrange.withOpacity(0.9),
              //           height: 50,
              //         ),
              //        SizedBox(
              //          height: 20,
              //        ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               'First Name',
              //               style: TextStyle(
              //                 fontFamily:
              //                 "Nunito",
              //                 fontWeight: FontWeight.w500,
              //                 // fontStyle: FontStyle.normal,
              //                 color: deepOrange,
              //                 fontSize: 18,
              //               ),
              //             ),
              //             Container(
              //               // height: 45,
              //               width: 300,
              //               decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius:
              //                   BorderRadius.circular(20),
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: deepOrange.withOpacity(0.3),
              //                       blurRadius: 8,
              //
              //                       offset: Offset(0, 4), // changes position of shadow
              //                     ),
              //                   ]
              //               ),
              //               child: ListTile(
              //                 //SEARCH BAR
              //                 title: TextField(
              //                   //SEARCH BAR TYPO
              //
              //                   textInputAction:
              //                   TextInputAction.search,
              //                   decoration: InputDecoration(
              //                     hintStyle: TextStyle(
              //                       fontFamily:
              //                       "Nunito",
              //                       fontWeight: FontWeight.w500,
              //                       // fontStyle: FontStyle.normal,
              //                       color: deepOrange,
              //                       fontSize: 15,
              //                     ),
              //                     hintText: "admin",
              //                     border: InputBorder.none,
              //                   ),
              //                 ),
              //                 //FILTER ICON
              //
              //
              //                 // Padding(
              //                 //   padding: EdgeInsets.only(
              //                 //       left: 30, top: 5, bottom: 5),
              //                 //   child: IconButton(
              //                 //     icon: Icon(
              //                 //       MyIcons.filter_icon,
              //                 //       color: deepOrange,
              //                 //     ),
              //                 //     iconSize: 15,
              //                 //     onPressed: () {
              //                 //       showDialog(
              //                 //           context: context,
              //                 //           builder: (context) =>
              //                 //               AlertDialog(
              //                 //                 shape: RoundedRectangleBorder(
              //                 //                     borderRadius:
              //                 //                     BorderRadius
              //                 //                         .circular(
              //                 //                         30)),
              //                 //                 title: Center(
              //                 //                   child: Text(
              //                 //                     'Select Your Type',
              //                 //                     style: TextStyle(
              //                 //                         fontFamily:
              //                 //                         "Nunito",
              //                 //                         fontSize: 14,
              //                 //                         color: Colors
              //                 //                             .black,
              //                 //                         fontWeight:
              //                 //                         FontWeight
              //                 //                             .w900),
              //                 //                   ),
              //                 //                 ),
              //                 //                 content: Filter(),
              //                 //               ));
              //                 //     },
              //                 //   ),
              //                 // ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               'Last Name',
              //               style: TextStyle(
              //                 fontFamily:
              //                 "Nunito",
              //                 fontWeight: FontWeight.w500,
              //                 // fontStyle: FontStyle.normal,
              //                 color: deepOrange,
              //                 fontSize: 18,
              //               ),
              //             ),
              //             Container(
              //               // height: 45,
              //               width: 300,
              //               decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius:
              //                   BorderRadius.circular(20),
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: deepOrange.withOpacity(0.3),
              //                       blurRadius: 8,
              //
              //                       offset: Offset(0, 4), // changes position of shadow
              //                     ),
              //                   ]
              //               ),
              //               child: ListTile(
              //                 //SEARCH BAR
              //                 title: TextField(
              //                   //SEARCH BAR TYPO
              //
              //                   textInputAction:
              //                   TextInputAction.search,
              //                   decoration: InputDecoration(
              //                     hintStyle: TextStyle(
              //                       fontFamily:
              //                       "Nunito",
              //                       fontWeight: FontWeight.w500,
              //                       // fontStyle: FontStyle.normal,
              //                       color: deepOrange,
              //                       fontSize: 15,
              //                     ),
              //                     hintText: "panel",
              //                     border: InputBorder.none,
              //                   ),
              //                 ),
              //                 //FILTER ICON
              //
              //
              //                 // Padding(
              //                 //   padding: EdgeInsets.only(
              //                 //       left: 30, top: 5, bottom: 5),
              //                 //   child: IconButton(
              //                 //     icon: Icon(
              //                 //       MyIcons.filter_icon,
              //                 //       color: deepOrange,
              //                 //     ),
              //                 //     iconSize: 15,
              //                 //     onPressed: () {
              //                 //       showDialog(
              //                 //           context: context,
              //                 //           builder: (context) =>
              //                 //               AlertDialog(
              //                 //                 shape: RoundedRectangleBorder(
              //                 //                     borderRadius:
              //                 //                     BorderRadius
              //                 //                         .circular(
              //                 //                         30)),
              //                 //                 title: Center(
              //                 //                   child: Text(
              //                 //                     'Select Your Type',
              //                 //                     style: TextStyle(
              //                 //                         fontFamily:
              //                 //                         "Nunito",
              //                 //                         fontSize: 14,
              //                 //                         color: Colors
              //                 //                             .black,
              //                 //                         fontWeight:
              //                 //                         FontWeight
              //                 //                             .w900),
              //                 //                   ),
              //                 //                 ),
              //                 //                 content: Filter(),
              //                 //               ));
              //                 //     },
              //                 //   ),
              //                 // ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               'Mobile',
              //               style: TextStyle(
              //                 fontFamily:
              //                 "Nunito",
              //                 fontWeight: FontWeight.w500,
              //                 // fontStyle: FontStyle.normal,
              //                 color: deepOrange,
              //                 fontSize: 18,
              //               ),
              //             ),
              //             Container(
              //               // height: 45,
              //               width: 300,
              //               decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius:
              //                   BorderRadius.circular(20),
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: deepOrange.withOpacity(0.3),
              //                       blurRadius: 8,
              //
              //                       offset: Offset(0, 4), // changes position of shadow
              //                     ),
              //                   ]
              //               ),
              //               child: ListTile(
              //                 //SEARCH BAR
              //                 title: TextField(
              //                   //SEARCH BAR TYPO
              //
              //                   textInputAction:
              //                   TextInputAction.search,
              //                   decoration: InputDecoration(
              //                     hintStyle: TextStyle(
              //                       fontFamily:
              //                       "Nunito",
              //                       fontWeight: FontWeight.w500,
              //                       // fontStyle: FontStyle.normal,
              //                       color: deepOrange,
              //                       fontSize: 15,
              //                     ),
              //                     hintText: "111111",
              //                     border: InputBorder.none,
              //                   ),
              //                 ),
              //                 //FILTER ICON
              //
              //
              //                 // Padding(
              //                 //   padding: EdgeInsets.only(
              //                 //       left: 30, top: 5, bottom: 5),
              //                 //   child: IconButton(
              //                 //     icon: Icon(
              //                 //       MyIcons.filter_icon,
              //                 //       color: deepOrange,
              //                 //     ),
              //                 //     iconSize: 15,
              //                 //     onPressed: () {
              //                 //       showDialog(
              //                 //           context: context,
              //                 //           builder: (context) =>
              //                 //               AlertDialog(
              //                 //                 shape: RoundedRectangleBorder(
              //                 //                     borderRadius:
              //                 //                     BorderRadius
              //                 //                         .circular(
              //                 //                         30)),
              //                 //                 title: Center(
              //                 //                   child: Text(
              //                 //                     'Select Your Type',
              //                 //                     style: TextStyle(
              //                 //                         fontFamily:
              //                 //                         "Nunito",
              //                 //                         fontSize: 14,
              //                 //                         color: Colors
              //                 //                             .black,
              //                 //                         fontWeight:
              //                 //                         FontWeight
              //                 //                             .w900),
              //                 //                   ),
              //                 //                 ),
              //                 //                 content: Filter(),
              //                 //               ));
              //                 //     },
              //                 //   ),
              //                 // ),
              //               ),
              //             ),
              //           ],
              //         ),
              //
              //         SizedBox(
              //           height: 50,
              //         ),
              //
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: [
              //               SizedBox(
              //                 height: 50,
              //                 // width:150 ,
              //                 child: ElevatedButton(
              //                     onPressed: (){},
              //                     style: ElevatedButton.styleFrom(
              //                         primary: active,
              //                         shape: RoundedRectangleBorder(
              //                           borderRadius: BorderRadius.circular(20.0),
              //
              //                         )
              //                     ),
              //                     child:Align(
              //                       alignment: Alignment.center,
              //                       child: Text(
              //                         'SUBMIT',
              //                         style: TextStyle(
              //                           color: Colors.white,
              //                         ),
              //                       ),
              //                     )
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Container(
                  width: 500,
                  height: 470,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Change Password",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: active),
                            ),
                          ],
                        ),
                        Divider(
                          color: deepGreen.withOpacity(0.9),
                          height: 50,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Old Password',
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w500,
                                // fontStyle: FontStyle.normal,
                                color: deepGreen,
                                fontSize: 18,
                              ),
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
                                title: TextFormField(
                                  //SEARCH BAR TYPO

                                  controller: currentController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field Required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  textInputAction: TextInputAction.search,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.w500,
                                      // fontStyle: FontStyle.normal,
                                      color: deepGreen,
                                      fontSize: 15,
                                    ),
                                    hintText: "old password",
                                    border: InputBorder.none,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'New Password',
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w500,
                                // fontStyle: FontStyle.normal,
                                color: deepGreen,
                                fontSize: 18,
                              ),
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
                                title: TextFormField(
                                  //SEARCH BAR TYPO

                                  controller: newController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field Required';
                                    } else if (value.length < 8) {
                                      return 'Weak Password';
                                    } else {
                                      return null;
                                    }
                                  },
                                  textInputAction: TextInputAction.search,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.w500,
                                      // fontStyle: FontStyle.normal,
                                      color: deepGreen,
                                      fontSize: 15,
                                    ),
                                    hintText: "new password",
                                    border: InputBorder.none,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Confirm Password',
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w500,
                                // fontStyle: FontStyle.normal,
                                color: deepGreen,
                                fontSize: 18,
                              ),
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
                                title: TextFormField(
                                  //SEARCH BAR TYPO

                                  controller: confirmController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field Required';
                                    } else if (newController.text !=
                                        confirmController.text) {
                                      return 'Password Not Match';
                                    } else {
                                      return null;
                                    }
                                  },
                                  textInputAction: TextInputAction.search,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.w500,
                                      // fontStyle: FontStyle.normal,
                                      color: deepGreen,
                                      fontSize: 15,
                                    ),
                                    hintText: "confirm password",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 50,
                                // width:150 ,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        _changePassword(currentController.text,
                                            newController.text);
                                      }
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
                                        'Change Password',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
