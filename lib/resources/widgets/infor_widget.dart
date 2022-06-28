import 'package:flutter/material.dart';
import 'package:statelessonpractice/resources/strings.dart';

class InforWidget extends StatelessWidget {
  const InforWidget(
      {Key? key,
      required this.textInfor,
      required this.inputInfor,
      required this.controller})
      : super(key: key);
  final String textInfor;
  final String inputInfor;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(textInfor, textAlign: TextAlign.left),
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: inputInfor,
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
