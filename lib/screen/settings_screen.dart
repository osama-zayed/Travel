import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'language.dart';

class SettingsScreen extends StatefulWidget{
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}
class _SettingsScreenState extends State<SettingsScreen>{
  bool notify = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text(
          "10".tr,
          style: TextStyle(
            color: Colors.amber,
            fontSize: 20,
          ),
        ),


        centerTitle: true,
      ),
        body: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(

              title: Text("57".tr,style: TextStyle(fontSize: 25,color: Colors.black),),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context)=> Language()),);
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("59".tr,style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    ),
                    ////ايقون تفعيل الاشعارات
                    Container(
                      child: Switch(value: notify, onChanged: (val){
                        setState(() {
                          notify =val;
                          print(notify);
                        });
                      }),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "60".tr,
                style: TextStyle(
                fontSize: 15,
                ),
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
        )

    );
}
}