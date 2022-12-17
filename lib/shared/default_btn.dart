import 'package:flutter/material.dart';

class Default_Button extends StatelessWidget {
  const Default_Button({
    Key? key,
    required this.context,
    this.backgroundColor,
    this.txtColor,
    required this.borderColor,
    required this.name,
    required this.onClick,
  }) : super(key: key);

  final BuildContext context;
  final String name;
 final Color? backgroundColor;
final  Color? txtColor;
  final Color borderColor;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.065,
        width: MediaQuery.of(context).size.width * 0.95,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: backgroundColor == null ? Colors.white : backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: borderColor)),
          ),
          onPressed: onClick,
          child: Text(
            '$name',
            style: TextStyle(color:  txtColor == null ? Colors.black : txtColor, fontSize: 18),
          ),
        ));
  }
}
