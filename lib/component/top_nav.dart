import 'package:flutter/material.dart';

import '../constants/style.dart';
import '../helpers/responsiveness.dart';
import 'custom_text.dart';

AppBar topNavigationBar(BuildContext? context, GlobalKey<ScaffoldState>? key) =>
    AppBar(
      toolbarHeight: 30,
      leading: !ResponsiveWidget.isSmallScreen(context!)
          ? Row(
              children: [
                // Container(
                //   padding: EdgeInsets.only(left: 14, top: 10),
                //   child: Image.asset(
                //     'assets/Logo.png',
                //     height: 60,
                //     width: 60,
                //   ),
                // ),
              ],
            )
          : IconButton(
              onPressed: () {
                key!.currentState!.openDrawer();
              },
              icon: Icon(Icons.menu),
            ),
      elevation: 0,
      title: Row(
        children: [
          // Image.asset(
          //   'assets/Logo.png',
          //   height: 100,
          //   width: 100,
          // ),
          // Visibility(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Image.asset(
          //       'assets/Logo.png',
          //       height: 57,
          //       width: 60,
          //     ),
          //   ),
          // ),

          Expanded(
            child: Container(),
          ),

          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.settings,
          //     color: dark,
          //   ),
          // ),
          // Stack(
          //   children: [
          //     IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.notifications,
          //         color: dark.withOpacity(.7),
          //       ),
          //     ),
          //     Positioned(
          //       top: 7,
          //       right: 7,
          //       child: Container(
          //         width: 12,
          //         height: 12,
          //         padding: EdgeInsets.all(4),
          //         decoration: BoxDecoration(
          //             color: active,
          //             borderRadius: BorderRadius.circular(30),
          //             border: Border.all(
          //               color: light,
          //               width: 2,
          //             )),
          //       ),
          //     ),
          //   ],
          // ),
          // Container(
          //   width: 1,
          //   height: 22,
          //   color: lightGrey,
          // ),
          // SizedBox(
          //   width: 24,
          // ),
          // CustomText(
          //   text: 'Yunus Kara',
          //   color: lightGrey,
          // ),
          // SizedBox(
          //   width: 16,
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(30),
          //   ),
          //   child: Container(
          //     padding: EdgeInsets.all(2),
          //     margin: EdgeInsets.all(2),
          //     child: CircleAvatar(
          //       backgroundColor: light,
          //       child: Icon(
          //         Icons.person_outline,
          //         color: dark,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      iconTheme: IconThemeData(color: dark),
      backgroundColor: Colors.transparent,
    );
