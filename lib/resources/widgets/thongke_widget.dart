import 'package:flutter/material.dart';

class CheckInfor extends StatelessWidget {
  const CheckInfor(
      {Key? key, required this.textInforLabel, required this.textInforOutput})
      : super(key: key);
  final String textInforLabel;
  final String textInforOutput;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(textInforLabel, textAlign: TextAlign.left),
        ),
        Expanded(
          child: Text(textInforOutput, textAlign: TextAlign.left),
        ),
      ],
    );
  }
}
