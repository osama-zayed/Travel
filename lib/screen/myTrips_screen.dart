import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../Helpers/state_type.dart';
import '../blocs/my_trips_bloc.dart';
import 'add_atrip_screen.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({Key? key}) : super(key: key);

  @override
  State<MyTripsScreen> createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:const Icon(
          Icons.clear,
          color: Colors.amber,

        ),

        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(100 , 250),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "12".tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15,),
                Text(
                  "13".tr,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20,),

                GestureDetector(
                  onTap: (){
                    _bottomSheet(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.3),
                          blurRadius: 10,spreadRadius:5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: 100,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "image/47681158_1982197615406596_7744099143068418048_n.jpg",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 25,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "14".tr,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "15".tr,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        )
      ),
      body: BlocBuilder<MyTripsBloc , MyTripsState>(
        builder: (context , state){
          switch(state.currentState) {
            case StateTypes.loading:{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white10,
                      backgroundColor: Colors.black,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "جاري التحميل ...",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              );
            }
            break;
            case StateTypes.loaded:{
              return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context , index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25 ,vertical: 20),
                  padding: EdgeInsets.all(10),
                  height: 250,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,spreadRadius:5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "رقم  الرحلة :  ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "${state.items[index].flightNumber}",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "شركة الطيران :  ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "${state.items[index].airline}",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "الطائرة :  ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "${state.items[index].planeId}",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "المسار :  ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "${state.items[index].routeId}",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "اليوم :  ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "${state.items[index].day}",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "التاريخ :  ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "${state.items[index].date}",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "وقت المغادرة :  ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "${state.items[index].departureTime}",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "وقت الوصول :  ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "${state.items[index].arrivalTime}",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "الحالة :  ",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "${state.items[index].status}",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            break;
            default:{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red,),
                    SizedBox(height: 10,),
                    Text("Error", style: TextStyle(color: Colors.red),),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
  Future  _bottomSheet(BuildContext context){
    return showModalBottomSheet(isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),

        ),
      ),
      context: context,
      builder: (context)=> const AddAtripScreen(),
    );
  }
}
