import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  String buttonName;
  final VoidCallback onTap;

  double height;
  double width;
  double bottomMargin;
  double borderWidth;
  Color buttonColor;
  Color textColor;
  Color borderColor;
  bool showSaving;
  IconData icon;

  RoundedButton(
      {required this.buttonName,
        required this.onTap,
        required this.height,
        this.showSaving=false,
        this.bottomMargin=0.0,
        required this.borderWidth,
        required this.width,
        required this.buttonColor,
        required this.textColor,
        required this.icon,
        this.borderColor=const Color.fromRGBO(221, 221, 221, 1.0)});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
        color: textColor, fontSize: 16.0, fontWeight: FontWeight.bold);
    if (borderWidth != 0.0)
      return (InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          margin: EdgeInsets.only(bottom: bottomMargin),
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: borderColor,
                width: borderWidth),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(icon!=null)
                Container(
                  margin:const EdgeInsets.only(right: 5),
                  child: Icon(icon,color: textColor,),
                ),
              Text(buttonName, style: textStyle)
            ],
          ),
        ),
      ));
    else {
      return (
          InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          margin: EdgeInsets.only(bottom: bottomMargin),
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          ),
          child: showSaving==true?const CircularProgressIndicator(backgroundColor: Colors.white,): Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(icon!=null)
                Icon(icon,color: textColor,),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(buttonName, style: textStyle),
              )
            ],
          ),
        ),
      ));
    }
  }
}
