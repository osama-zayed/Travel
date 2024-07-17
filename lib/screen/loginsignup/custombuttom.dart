import 'package:bilqis/confeig/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final void Function()? onpressed;

  const CustomButtom({Key? key, required this.text, this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(vertical: 13),
          onPressed:  onpressed,
          color: palette.textColor2,
          textColor: Colors.white,
          child: Text(text),

        )
    );
  }
}
