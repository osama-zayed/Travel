import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../widget/tabItem.dart';
import 'choose_passenger.dart';


class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  TextEditingController returnDepartureDate = TextEditingController();
  TextEditingController returnReturnDate = TextEditingController();
  TextEditingController oneWayReturnDate = TextEditingController();
  TextEditingController oneWayDepartureDate = TextEditingController();
  DateTime date = DateTime.now();
  bool isMale =true;
  bool isSignupScreen=true;
  bool isRememberMe=false;
// الخطوة 2: إضافة وظيفة البحث
  void searchFlights() {
    // هنا يمكنك إضافة منطق البحث الخاص بك
    print('بحث عن الرحلات...');
    // على سبيل المثال، يمكنك استدعاء واجهة برمجة التطبيقات (API) هنا
  }


  List airportData = [];
  int _airportValue = 1;
  getAirportData()async{
    final res = await http.get(Uri.parse("http://localhost:8000/api/airports"));
    airportData = jsonDecode(res.body);
    setState(() {

    });
  }
  final List<String> languages =['درجه السياحيه','درجه رجال الاعمال ','الدرجه الاولى'];
  String? selectedLanguage;


  @override
  Widget build(BuildContext context) {
    getAirportData();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(

          leading:const Icon(
            Icons.clear,
            color: Colors.amber,

          ),

          title:  Text(
            "16".tr,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 9),
                child: Text(
                  "17".tr,
                  style: TextStyle(
                      fontSize: 20,color:Colors.indigo,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  right: 20,
                  left: 20,
                ),
                padding: const EdgeInsets.all(10),
                height: 2800,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,spreadRadius:5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    PreferredSize(
                      preferredSize: Size.fromHeight(40),
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  TabBar(
                          indicatorColor: Color.fromRGBO(42, 33, 100, 1.0),
                          unselectedLabelColor: Colors.grey,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Color.fromRGBO(42, 33, 100, 1.0),
                          dividerColor: Colors.transparent,
                          tabs: [
                            TabItem(title: "18".tr,),
                            TabItem(title: "19".tr,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 550,
                      child: TabBarView(
                        children: [
                          //return
                      SingleChildScrollView(
                            child: Column(
                              children:[
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.only(
                                    top: 20,
                                    right: 10,
                                    left: 10,
                                  ),
                                  height: 250,
                                  width: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius:0,
                                      ),
                                    ],
                                  ),

                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "20".tr,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      //المطار
                                      DropdownButton(
                                        value: _airportValue,
                                        items: airportData.map((e){
                                          return DropdownMenuItem(
                                            child: Text(
                                              e["city"],
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            value: e["id"],
                                          );
                                        }).toList(),
                                        onChanged: (v){
                                          _airportValue = v as int;
                                          setState(() {

                                          });
                                        },
                                      ),
                                      DropdownButton(
                                        value: _airportValue,
                                        items: airportData.map((e){
                                          return DropdownMenuItem(
                                            child: Text(
                                              e["name"],
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            value: e["id"],
                                          );
                                        }).toList(),
                                        onChanged: (v){
                                          _airportValue = v as int;
                                          setState(() {

                                          });
                                        },
                                      ),
                                      ////////////////////////////////////////////////////////////////////////////////////////////////////
                                      // Text(
                                      //   "22".tr,
                                      //   style: TextStyle(
                                      //     fontSize: 15,
                                      //     color: Colors.black,
                                      //   ),
                                      // ),
                                      Divider(
                                        height: 5,
                                        color: Colors.grey,
                                        endIndent: 20,
                                        thickness: 2,
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        "23".tr,
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      DropdownButton(
                                        value: _airportValue,
                                        items: airportData.map((e){
                                          return DropdownMenuItem(
                                            child: Text(
                                              e["city"],
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            value: e["id"],
                                          );
                                        }).toList(),
                                        onChanged: (v){
                                          _airportValue = v as int;
                                          setState(() {

                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.only(
                                    top: 20,
                                    right: 10,
                                    left: 10,
                                  ),
                                  height: 210,
                                  width: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius:0,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // return && departure
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "25".tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "28".tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      //date
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          //departure date
                                          Container(
                                            width: 120,
                                            alignment: Alignment.topRight,
                                            child: TextFormField(
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                              controller: returnDepartureDate,
                                              decoration: InputDecoration(
                                                hintText: "تاريخ المغادرة",
                                                hintStyle: TextStyle(
                                                  fontSize: 10,
                                                ),
                                                filled: false,
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide.none
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              readOnly: true,
                                              onTap: (){
                                                _selectReturnDepartureDate();
                                              },
                                            ),
                                          ),
                                          //return date
                                          Container(
                                            alignment: Alignment.topLeft,
                                            width: 120,
                                            child: TextFormField(
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                              controller: returnReturnDate,
                                              decoration: InputDecoration(
                                                hintText: "تاريخ العودة",
                                                hintStyle: TextStyle(
                                                  fontSize: 10,
                                                ),
                                                filled: false,
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              readOnly: true,
                                              onTap: (){
                                                _selectReturnReturnDate();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: Colors.grey,
                                        height: 30,
                                      ),
                                       SizedBox(height: 0,),
                                      Center(
                                        child: ListTile(
                                          title: Text( "37".tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                          onTap: () async {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) => PassengerSelectionScreen()),
                                            );
                                            await FirebaseAuth.instance.signOut();

                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                                  //اضفتها ان
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.only(
                                    top: 20,
                                    right: 10,
                                    left: 10,
                                  ),
                                  height: 100,
                                  width: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  //////////////////////////////////////////////////////////////////////////////////////
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        'درجة المقعد',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      items:languages.map((language){
                                        return DropdownMenuItem<String>(
                                          value: language,
                                          child: Text(
                                            language,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        );
                                      }).toList(),
                                      value: selectedLanguage,
                                      onChanged: (value){
                                        setState(() {
                                          selectedLanguage =value;
                                        });
                                      },
                                      //buttonHeight:40,
                                      //buttonWidth:200,
                                      //itemHeight:40,

                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: ElevatedButton(
                                      onPressed: searchFlights, // ربط الزر بوظيفة البحث
                                      child: Text('بحث عن الرحلات'),
                                      style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 50,
                                            vertical: 20,
                                          ),
                                          primary: Color.fromRGBO(42, 33, 100, 1.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          )
                                      ),

                                    )
                                )


                              ],
                            ),
                          ),
                         //one way
                            SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.only(
                                      top: 30,
                                      right: 10,
                                      left: 10
                                  ),
                                  height: 250,
                                  width: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius:0,
                                      ),
                                    ],
                                  ),
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "30".tr,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      DropdownButton(
                                        value: _airportValue,
                                        items: airportData.map((e){
                                          return DropdownMenuItem(
                                            child: Text(
                                              e["city"],
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            value: e["id"],
                                          );
                                        }).toList(),
                                        onChanged: (v){
                                          _airportValue = v as int;
                                          setState(() {

                                          });
                                        },
                                      ),
                                      DropdownButton(
                                        value: _airportValue,
                                        items: airportData.map((e){
                                          return DropdownMenuItem(
                                            child: Text(
                                              e["name"],
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            value: e["id"],
                                          );
                                        }).toList(),
                                        onChanged: (v){
                                          _airportValue = v as int;
                                          setState(() {

                                          });
                                        },
                                      ),
                                      Divider(
                                        height: 5,
                                        color: Colors.grey,
                                        endIndent: 20,
                                        thickness: 2,
                                      ),
                                      Text(
                                        "33".tr,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      DropdownButton(
                                        value: _airportValue,
                                        items: airportData.map((e){
                                          return DropdownMenuItem(
                                            child: Text(
                                              e["city"],
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            value: e["id"],
                                          );
                                        }).toList(),
                                        onChanged: (v){
                                          _airportValue = v as int;
                                          setState(() {

                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.only(
                                    top: 20,
                                    right: 10,
                                    left: 10,
                                  ),
                                  height: 200,
                                  width: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius:0,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // return && departure
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "25".tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // Text(
                                          //   "28".tr,
                                          //   style: TextStyle(
                                          //     fontSize: 12,
                                          //     color: Colors.grey,
                                          //     fontWeight: FontWeight.bold,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      //date
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          //departure date
                                          Container(
                                            width: 120,
                                            alignment: Alignment.topRight,
                                            child: TextField(
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                              controller: oneWayDepartureDate,
                                              decoration: InputDecoration(
                                                hintText: "تاريخ المغادرة",
                                                hintStyle: TextStyle(
                                                  fontSize: 10,
                                                ),
                                                filled: false,
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide.none
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              readOnly: true,
                                              onTap: (){
                                                _selectOneWayDepartureDate();
                                              },
                                            ),
                                          ),
                                          //return date

                                        ],
                                      ),
                                      const Divider(
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 0,),
                                      Center(
                                        child: ListTile(
                                          title: Text( "37".tr,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                          onTap: () async {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) => PassengerSelectionScreen()),
                                            );
                                            await FirebaseAuth.instance.signOut();

                                          },
                                      ),
                                      ),
                                      const SizedBox(height: 10,),
                                    ],
                                  ),
                                ),
                                        //اضفتها انا
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(20),
                                  margin: const EdgeInsets.only(
                                    top: 20,
                                    right: 10,
                                    left: 10,
                                  ),
                                  height: 100,
                                  width: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        'درجة المقعد',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      items:languages.map((language){
                                        return DropdownMenuItem<String>(
                                          value: language,
                                          child: Text(
                                            language,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        );
                                      }).toList(),
                                      value: selectedLanguage,
                                      onChanged: (value){
                                        setState(() {
                                          selectedLanguage =value;
                                        });
                                      },
                                      //buttonHeight:40,
                                      //buttonWidth:200,
                                      //itemHeight:40,

                                    ),
                                  ),
                                  ),

                                      Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: ElevatedButton(
                                         onPressed: searchFlights, // ربط الزر بوظيفة البحث
                                        child: Text('بحث عن الرحلات'),
                                            style: ElevatedButton.styleFrom(
                                       padding: EdgeInsets.symmetric(
                                                  horizontal: 50,
                                                   vertical: 20,
                                                 ),
                                       primary: Color.fromRGBO(42, 33, 100, 1.0),
                                  shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(20),
                                     )
                                          ),

                                                    )
                                                   )

                                                    ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Future  _bottomSheet(BuildContext context){
  //   return showModalBottomSheet(isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(20),
  //
  //       ),
  //     ),
  //     context: context,
  //     //builder: (context)=> const SearchAirport(),
  //   );
  // }
  Future<void> _selectReturnDepartureDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if ( picked != null){
      setState(() {
        returnDepartureDate.text = picked.toString().split(" ")[0];
      });
    }
  }
  Future<void> _selectReturnReturnDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null){
      setState(() {
        returnReturnDate.text = picked.toString().split(" ")[0];
      });
    }
  }
  Future<void> _selectOneWayDepartureDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if ( picked != null){
      setState(() {
        oneWayDepartureDate.text = picked.toString().split(" ")[0];
      });
    }
  }
  Future<void> _selectOneWayReturnDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null){
      setState(() {
        oneWayReturnDate.text = picked.toString().split(" ")[0];
      });
    }
  }
}