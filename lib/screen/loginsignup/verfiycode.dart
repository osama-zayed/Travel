import 'package:bilqis/confeig/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body:Container(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
          child: ListView(children: [
            const SizedBox(height: 20),
            Text("Check code"),
            SizedBox(height: 20),
            Text("Please Enter The Digit Code Sent To"),
            SizedBox(height: 20),
            OtpTextField(
              fieldWidth:50.0,
              borderRadius:BorderRadius.circular(20),
              numberOfFields:5,
              borderColor:palette.textColor1,
              showFieldAsBox:true,
              onCodeChanged:(String code){

              },
              onSubmit:(String verificationCode){},
            )
          ],),

        )
    );
  }
}
