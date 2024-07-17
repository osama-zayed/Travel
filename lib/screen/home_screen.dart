import 'package:bilqis/screen/settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


import '../Helpers/state_type.dart';
import '../blocs/news_bloc.dart';
import 'loginsignup/login_signup.dart';
import 'notifications_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

          child:Column(

            children: [

              UserAccountsDrawerHeader(

                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.amber,
                    child: Text("S"),
                  ),
                  accountName: Text("SALWAN"),
                  accountEmail: Text("salw@gmil.com")),
              Padding(

                padding: const EdgeInsets.only(left: 10.0),
                child: ListTile(
                  leading: const Icon(Icons.account_circle,color: Colors.black,size: 40,),
                  title: Text("الملف الشخصي".tr),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const  EdgeInsets.only(left: 10.0),
                child: ListTile(
                  leading: const Icon(Icons.notifications_active,color: Colors.black,size: 40,),
                  title: Text("6".tr),
                  onTap: () {Navigator.of(context).push(
                    MaterialPageRoute(builder:(context)=> NotificationsScreen()),);},
                ),
              ),
              Padding(
                padding: const  EdgeInsets.only(left: 10.0),
                child: ListTile(
                  leading: const Icon(Icons.watch_later_outlined,color: Colors.black,size: 40,),
                  title: Text("8".tr),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const  EdgeInsets.only(left: 10.0),
                child: ListTile(
                  leading: const Icon(Icons.help_outline_outlined,color: Colors.black,size: 40,),
                  title:  Text("9".tr),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const  EdgeInsets.only(left: 10.0),
                child: ListTile(
                  leading: const Icon(Icons.brightness_5_outlined,color: Colors.black,size: 40,),
                  title: Text("10".tr,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder:(context)=> SettingsScreen()),);
                  },
                ),
              ),
              Padding(
                padding: const  EdgeInsets.only(left: 10.0),
                child: ListTile(
                  leading: const Icon(Icons.exit_to_app,color: Colors.black,size: 40,),
                  title: Text("تسجيل خروج".tr,
                  ),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginSignupScreen()),
                    );
                  },
                ),
              ),


            ],
          )

      ),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(42, 33, 100, 1.0),

        title:  Text(
          "11".tr,
          style: TextStyle(
            color: Colors.amber,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "الوجهة المختارة",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black54
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              "خصيصا لك",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40,),
            Text(
              "متعة السفر",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
                    height: 380,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.3),
                          blurRadius: 10,spreadRadius:5,
                        ),
                      ],
                    ),
                    child:  Container(
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
                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "لم تنطم اللى العضوية؟",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              "انطم الان للاستمتاع بلامتيازات",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 25,),
          ],
        ),
      ),
      // body: BlocBuilder<NewsBloc , NewsState>(
      //   builder: (context , state){
      //     switch(state.currentState) {
      //       case StateTypes.loading:{
      //         return Center(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               CircularProgressIndicator(
      //                 color: Colors.white10,
      //                 backgroundColor: Colors.black,
      //               ),
      //               SizedBox(height: 10,),
      //               Text(
      //                 "جاري التحميل ...",
      //                 style: TextStyle(
      //                   color: Colors.green,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         );
      //       }
      //       break;
      //       case StateTypes.loaded:{
      //         return ListView.builder(
      //           scrollDirection: Axis.vertical,
      //           itemCount: state.items.length,
      //           itemBuilder: (context , index) => Padding(
      //             padding: EdgeInsets.all(20),
      //             child: ListTile(
      //               title: Text(
      //                 "${state.items[index].content}",
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.w400,
      //                   fontSize: 14,
      //                   color: Colors.red,
      //                 ),
      //               ),
      //               subtitle: Text(
      //                 "${state.items[index].address}",
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.w400,
      //                   fontSize: 14,
      //                   color: Colors.red,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         );
      //       }
      //       break;
      //       default:{
      //         return Center(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Icon(Icons.error, color: Colors.red,),
      //               SizedBox(height: 10,),
      //               Text("Error", style: TextStyle(color: Colors.red),),
      //             ],
      //           ),
      //         );
      //       }
      //     }
      //   },
      // ),
    );
  }
}
