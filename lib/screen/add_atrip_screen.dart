import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/tabItem.dart';
class AddAtripScreen extends StatefulWidget {
  const AddAtripScreen({super.key});

  @override
  State<AddAtripScreen> createState() => _AddAtripScreenState();
}
class _AddAtripScreenState extends State<AddAtripScreen>{

  @override
  Widget build(BuildContext context){
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      builder: (_, controller)=>DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          controller: controller,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "38".tr,
                    style: TextStyle(
                      fontSize: 20,color:Colors.indigo,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 560,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      PreferredSize(
                        preferredSize: Size.fromHeight(40),
                        child: Container(
                          height: 40,
                          child: TabBar(
                            indicatorColor: Color.fromRGBO(42, 33, 100, 1.0),
                            unselectedLabelColor: Colors.grey,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelColor: Color.fromRGBO(42, 33, 100, 1.0),
                            dividerColor: Colors.transparent,
                            tabs: [
                              TabItem(title: "41".tr,),
                              TabItem(title: "40".tr,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 500,
                        child: TabBarView(
                          children:[
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children:[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10,),
                                      Text(
                                        "41".tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      Container(
                                        height: 55,
                                        alignment: Alignment.center,
                                        child: TextField(
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            hintText: "41".tr,
                                            hintStyle: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5,),

                                      const SizedBox(height: 20,),
                                      Container(
                                        height: 55,
                                        alignment: Alignment.center,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            hintText: "42".tr,
                                            hintStyle: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 100,),
                                      Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(42, 33, 100, 0.3),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "38".tr,
                                              style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //انتقال الصحه الثانيه
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                children:[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10,),
                                      Text(
                                        "40".tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        height: 55,
                                        alignment: Alignment.center,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            hintText: "40".tr,
                                            hintStyle: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5,),

                                      SizedBox(height: 20,),
                                      Container(
                                        height: 55,
                                        alignment: Alignment.center,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            hintText: "42".tr,
                                            hintStyle: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 100,),
                                      Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(42, 33, 100, 0.3),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "38".tr,
                                              style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}