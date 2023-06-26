import 'package:flutter/material.dart';

import '../utils/global.dart';

class ButtonFloatingDialog extends StatefulWidget {
  ButtonFloatingDialog({
    required Key key,
    required this.child,
    required this.childButton,
    required this.widthCard,
    required this.heightCard,
    required this.decorationCard,
    required this.duration,
    required this.paddingCard,
    required this.marginCard,
  }) : super(key: key);

  Widget child;
  Widget childButton;
  double heightCard;
  double widthCard;
  BoxDecoration decorationCard;
  Duration duration;
  EdgeInsets paddingCard;
  EdgeInsets marginCard;

  @override
  _ButtonFloatingDialog createState() => new _ButtonFloatingDialog();
}

class _ButtonFloatingDialog extends State<ButtonFloatingDialog> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          AnimatedOpacity(
            opacity: open ? 1 : 0,
            duration: widget.duration,
            child: Container(
              height: widget.heightCard,
              width: widget.widthCard,
              margin: widget.marginCard,
              padding: widget.paddingCard,
              decoration: widget.decorationCard,
              child: open?widget.child:Container(
                height: 400.0,
                width: 250.0,
                margin: const EdgeInsets.only(bottom: 4.0, right: 40.0),
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 10.0,
                    )
                  ]
                ),
              ),
            ),
          ),
          // FloatingActionButton(
          //   backgroundColor: Global.deepOrange,
          //   onPressed: () {
          //     setState(() {
          //       open = !open;
          //     });
          //   },
          //   child: open?widget.childButton: Icon(Icons.close): Icon(Icons.send),
          // ),
        ],
      ),
    );
  }
}