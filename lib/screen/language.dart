

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../localization/changelocal.dart';


class Language extends GetView<LocaleController>{
  const Language ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(

              title: Text("العربيه",style: TextStyle(fontSize: 25,color: Colors.black),),
              onTap: () {
                controller.changeLang("ar");
              },
            ),


            SizedBox(height: 5,),
            Divider(
              height: 5,
              color: Colors.grey,
              endIndent: 10,
              thickness: 1,
            ),
            SizedBox(height: 5,),
            Center(
              child: ListTile(

                title: Text("English",style: TextStyle(fontSize: 25,color: Colors.black),),
                onTap: () {
                  controller.changeLang("en");
                },
              ),
            ),


            SizedBox(height:10,),
            Divider(
              height: 5,
              color: Colors.grey,
              endIndent: 10,
              thickness: 1,
            ),

          ],
        ),
      ),
    );
  }
}

