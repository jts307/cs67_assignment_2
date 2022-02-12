import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String placeHolderText;
  final TextEditingController controller;
  final Color lineColor;

  const TextFieldWidget(
      {Key? key,
      this.placeHolderText = '',
      required this.controller,
      this.lineColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 6,
        right: MediaQuery.of(context).size.width / 6,
        bottom: 10,
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: lineColor,
          fontSize: 22,
        ),
        cursorColor: lineColor,
        decoration: InputDecoration(
            hintText: placeHolderText,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            )),
      ),
    );
  }
}
