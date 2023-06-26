import 'package:flutter/material.dart';

class CardPageAnimated extends StatefulWidget {
  CardPageAnimated({required this.widthX, required this.child});

  final double widthX;
  final Widget child;

  @override
  _CardPageAnimatedState createState() => _CardPageAnimatedState();
}

class _CardPageAnimatedState extends State<CardPageAnimated> {
  bool show = false;
  bool showItems = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 300),
      () => setState(
        () {
          show = true;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        width: show ? widget.widthX : 0.0,
        margin: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        duration: const Duration(seconds: 1),
        onEnd: () {
          setState(() {
            showItems = true;
          });
        },
        child: showItems ? widget.child : Container());
  }
}
