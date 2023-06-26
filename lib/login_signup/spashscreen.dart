// import 'dart:async';
// import 'package:booking_management_dashboard/login_signup/welcomeScreen.dart';
// import 'package:booking_management_dashboard/screen/home_screen.dart';
// import 'package:booking_management_dashboard/sputils/sputils.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   SplashScreenState createState() => new SplashScreenState();
// }
//
// class SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   var _visible = true;
//
//   AnimationController animationController;
//   Animation<double> animation;
//
//   startTime() async {
//     var _duration = new Duration(seconds: 3); //SetUp duration here
//     // return new Timer(_duration, navigationPage);
//   }
//
//   void navigationPage() {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (builder) => HomePage()));
//   }
//
//   bool isloading = false;
//   dynamic userdetail;
//   getuserdetails() async {
//     setState(() {
//       isloading = true;
//     });
//
//     var data = await PrefManager().get('userdetails', '');
//
//     if (data == null || data == '') {
//       Navigator.pushAndRemoveUntil(
//           (context),
//           MaterialPageRoute(builder: (context) => HomePage()),
//           (route) => false);
//     } else {
//       Navigator.pushAndRemoveUntil(
//           (context),
//           MaterialPageRoute(builder: (context) => HomeScreen()),
//           (route) => false);
//       // userdetail =
//       //     await json.decode(await PrefManager().get('userdetails', ''));
//     }
//
//     if (userdetail == '' || userdetail == null) {
//     } else {}
//     setState(() {
//       isloading = false;
//     });
//     print(userdetail);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getuserdetails();
//     animationController = new AnimationController(
//         vsync: this, duration: new Duration(seconds: 5));
//     animation =
//         new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
//
//     animation.addListener(() => this.setState(() {}));
//     animationController.forward();
//
//     setState(() {
//       _visible = !_visible;
//     });
//     startTime();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.indigo,
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           new Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               // Padding(padding: EdgeInsets.only(bottom: 30.0),child:new
//               // Image.asset('assets/img.png',height: 25.0,fit: BoxFit.scaleDown,))
//             ],
//           ),
//           new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new SvgPicture.asset(
//                 "assets/Vlogos.svg",
//                 width: animation.value * 250,
//                 height: animation.value * 250,
//               )
//
//               // Image.asset(
//               //   'assets/logo.jpeg',
//               //   width: animation.value * 250,
//               //   height: animation.value * 250,
//               // ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
