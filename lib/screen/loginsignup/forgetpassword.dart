import 'package:bilqis/confeig/palette.dart';
import 'package:bilqis/screen/loginsignup/verfiycode.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custombuttom.dart';
import 'forgetemail.dart';

class ForgetPassword extends StatefulWidget {
  const  ForgetPassword({Key? key}):super(key: key);
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}
class _ForgetPasswordState extends State<ForgetPassword> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Check phone",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50,),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.3),
                          blurRadius: 10,spreadRadius:5,
                        ),
                      ],
                    ),
                    child:

                    Container(
                      margin: const EdgeInsets.only(top: 20,left: 15,right: 15),

                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(CommunityMaterialIcons.phone,color: palette.iconColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: palette.textColor1),
                                borderRadius: BorderRadius.all(Radius.circular(35.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: palette.textColor1),
                                borderRadius: BorderRadius.all(Radius.circular(35.0)),
                              ),
                              contentPadding: EdgeInsets.only(top: 10,),
                              hintText: "Phone",
                              hintStyle: TextStyle(fontSize: 14,color: palette.textColor1),
                            ),
                          ),
                          CustomButtom(text:"متابعه",onpressed:(){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder:(context)=> VerfiyCode()),);

                          }),
                          SizedBox(height: 10,),
                          ListTile(
                            title: Text("بحث باستخدام البريد الإلكتروني بدلا من ذلك"),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder:(context)=> ForgetEmail()),);
                            },
                          ),




                        ],
                      ),


                    )




                ),







              ],

            )

        )

    );
  }
}

