
import 'dart:convert';

import 'package:bilqis/confeig/palette.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../../Helpers/state_type.dart';
import '../../blocs/login_bloc.dart';
import '../../blocs/user_bloc.dart';
import '../../model/login_model.dart';
import '../../model/users_model.dart';
import '../home_screen.dart';
import 'checkemail.dart';
import 'forgetpassword.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}):super(key: key);
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
 //final userViewModel = Provider.of<UserViewModel>(context);


  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;


  var emailController =  TextEditingController();
  var userNameController =  TextEditingController();
  var phoneController =  TextEditingController();
  var passwordController =  TextEditingController();
  var _confirmPassController = TextEditingController();


  var emailLoginController =  TextEditingController();
  var passwordLoginController =  TextEditingController();
   int IsActive =0;

  final _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("image/277577642_2812900262336323_3120737462398614005_n.jpg"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "43".tr,
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? "44".tr : "45".tr,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? "46".tr
                          : "47".tr,
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          //buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;

                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "48".tr,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? palette.ACTIVEColor
                                        : palette.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Color.fromRGBO(42, 33, 100, 1.0),
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "49".tr,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? palette.ACTIVEColor
                                        : palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Color.fromRGBO(42, 33, 100, 1.0),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          //buildBottomHalfContainer(false),
          // Bottom buttons
          // Positioned(
          //   top: MediaQuery.of(context).size.height - 100,
          //   right: 0,
          //   left: 0,
          //   child: Column(
          //    children: [
          //      // Text(isSignupScreen ? "Or Signup with" : "Or Signin with"),
          //       Container(
          //          margin: EdgeInsets.only(right: 20, left: 20, top: 15),
          //          child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //            children: [
          //             buildTextButton(CommunityMaterialIcons.facebook,
          //                  "Facebook", palette.facbookColor),
          //              buildTextButton(CommunityMaterialIcons.google_plus,
          //                  "Google", palette.googleColor),
          //           ],
          //         ),
          //      ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  BlocListener<dynamic, dynamic> buildSigninSection() {
    var _blocL = context.read<LoginBloc>();
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async{
        if(state.currentState == StateTypes.submitted){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success")));
        }

        else if(state.currentState == StateTypes.error){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error??"")));
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // buildTextFieldLogin(
              //   Icons.mail_outline, "info@demouri.com", false, true,emailLoginController,
              // ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextField(
            controller: emailLoginController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.mail_outline,
                color: palette.iconColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: "info@demouri.com",
              hintStyle: TextStyle(fontSize: 14, color: palette.textColor1),
            ),

          ),
          ),

          Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            controller: passwordLoginController,
            obscureText: !isRememberMe,
            decoration: InputDecoration(
              prefixIcon: Icon(
                CommunityMaterialIcons.lock_outline,
                color: palette.iconColor,
              ),

              enabledBorder: OutlineInputBorder(

                borderSide: BorderSide(color: palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: "*******",
              hintStyle: TextStyle(fontSize: 14, color: palette.textColor1),
            ),
          ),
        ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isRememberMe,
                        activeColor: palette.textColor2,
                        onChanged: (value) {
                          setState(() {
                            isRememberMe = !isRememberMe;
                          });
                        },
                      ),
                      Text("51".tr,
                          style: TextStyle(fontSize: 12, color: palette.textColor1))
                    ],
                  ),
                  TextButton(
                    onPressed: () { Navigator.of(context).push(
                      MaterialPageRoute(builder:(context)=> ForgetPassword ()),);},
                    child: Text("50".tr,
                        style: TextStyle(fontSize: 12, color: palette.textColor1)),
                  )
                ],
              ),
              SizedBox(height: 10,),
              TextButton(
                onPressed: ()async{
                  if(_formKey.currentState!.validate())
                  {
                    print("--------- if valid");
                    var login = LoginModel(
                      email: emailLoginController.text,
                      password: passwordLoginController.text,
                    );
                    _blocL.add(SubmitLogin(login));
                  }
                },
                child: Text("sinin",),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildSignupSection() {
    var _blocR = context.read<UserBloc>();
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildTextField(
              CommunityMaterialIcons.account_outline, "52".tr,
              false,
              false,
              userNameController,
            ),
            buildTextField(
              CommunityMaterialIcons.email_outline, "53".tr, false, true,emailController,
            ),
            buildTextField(
              CommunityMaterialIcons.phone, "phone".tr, false, true,phoneController,
            ),
            buildTextField(
              CommunityMaterialIcons.lock_outline, "54".tr, true, false,passwordController,
            ),
            buildTextField(
              CommunityMaterialIcons.lock_outline, "62".tr, true, false,_confirmPassController,
            ),
            SizedBox(height: 10,),
            TextButton(
              onPressed: ()async{
                if (passwordController.text == _confirmPassController.text)
                {
                  if(_formKey.currentState!.validate())
                  {
                    var user = UsersModel(
                      name: userNameController.text,
                      email: emailController.text,
                      phoneNumber: phoneController.text,
                      password: passwordController.text,
                      password_confirmation: _confirmPassController.text,
                    );
                    _blocR.add(Submit(user));
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Theme.of(context).colorScheme.background,
                        content: Text(
                          "تمت الاضافة",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color.fromRGBO(143, 26, 17, 1),
                          ),
                        ),
                        icon: Icon(
                          Icons.done,
                          color: Color.fromRGBO(143, 26, 17, 1),
                        ),
                      ),
                    );
                  }
                  else{
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Theme.of(context).colorScheme.background,
                        content: Text(
                          "الرجاء التاكد من صحة البيانات",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color.fromRGBO(143, 26, 17, 1),
                          ),
                        ),
                        icon: Icon(
                          Icons.error,
                        ),
                      ),
                    );
                  }
                }
                else{
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      content: Text(
                        "كلمة السر غير مطابقة",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color.fromRGBO(143, 26, 17, 1),
                        ),
                      ),
                      icon: Icon(
                        Icons.error,
                        color: Color.fromRGBO(143, 26, 17, 1),
                      ),
                    ),
                  );
                }
              },
              child: Text("sinup"),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10, left: 10),
            //   child: Row(
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             isMale = true;
            //                 // (value) => userViewModel.setIsMale(value);
            //           });
            //         },
            //         child: Row(
            //           children: [
            //             Container(
            //               width: 30,
            //               height: 30,
            //               margin: EdgeInsets.only(right: 8),
            //               decoration: BoxDecoration(
            //                   color: isMale
            //                       ? palette.textColor2
            //                       : Colors.transparent,
            //                   border: Border.all(
            //                       width: 1,
            //                       color: isMale
            //                           ? Colors.transparent
            //                           : palette.textColor1),
            //                   borderRadius: BorderRadius.circular(15)),
            //               child: Icon(
            //                 CommunityMaterialIcons.account_outline,
            //                 color: isMale ? Colors.white : palette.iconColor,
            //               ),
            //             ),
            //             Text(
            //               "55".tr,
            //               style: TextStyle(color: palette.textColor1),
            //             )
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         width: 30,
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             isMale = false;
            //           });
            //         },
            //         child: Row(
            //           children: [
            //             Container(
            //               width: 30,
            //               height: 30,
            //               margin: EdgeInsets.only(right: 8),
            //               decoration: BoxDecoration(
            //                   color: isMale
            //                       ? Colors.transparent
            //                       : palette.textColor2,
            //                   border: Border.all(
            //                       width: 1,
            //                       color: isMale
            //                           ? palette.textColor1
            //                           : Colors.transparent),
            //                   borderRadius: BorderRadius.circular(15)),
            //               child: Icon(
            //                 CommunityMaterialIcons.account_outline,
            //                 color: isMale ? palette.iconColor : Colors.white,
            //               ),
            //             ),
            //             Text(
            //               "56".tr,
            //               style: TextStyle(color: palette.textColor1),
            //             )
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              width: 200,
              margin: EdgeInsets.only(top: 20),

            ),
          ],
        ),
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  // Widget buildBottomHalfContainer(bool showShadow) {
  //   return AnimatedPositioned(
  //     duration: Duration(milliseconds: 700),
  //     curve: Curves.bounceInOut,
  //     top: isSignupScreen ? 535 : 430,
  //     right: 0,
  //     left: 0,
  //     child: Center(
  //       child: Container(
  //         height: 90,
  //         width: 90,
  //         padding: EdgeInsets.all(15),
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(50),
  //             boxShadow: [
  //               if (showShadow)
  //                 BoxShadow(
  //                   color: Colors.black.withOpacity(.3),
  //                   spreadRadius: 1.5,
  //                   blurRadius: 10,
  //                 ),
  //
  //             ]),
  //         child: !showShadow?
  //           Container(
  //           decoration: BoxDecoration(
  //               gradient: LinearGradient(
  //                   colors: [Colors.indigo, Colors.amber],
  //                   begin: Alignment.topLeft,
  //                   end: Alignment.bottomRight,),
  //               borderRadius: BorderRadius.circular(30),
  //               boxShadow: [
  //                 BoxShadow(
  //                     color: Colors.black.withOpacity(.3),
  //                     spreadRadius: 1,
  //                     blurRadius: 2,
  //                     offset: Offset(0, 1),
  //
  //                 )
  //               ]
  //           ),
  //
  //           child: TextButton(
  //             onPressed: () {
  //               Navigator.of(context).push(
  //                 MaterialPageRoute(builder:(context)=> CheckEmail()),);
  //             },
  //             child: Icon(
  //               Icons.arrow_forward,
  //
  //               color: Colors.white,),
  //           )
  //
  //         )
  //             : Center(),
  //
  //       ),
  //     ),
  //   );
  // }
  Widget buildTextField(
      IconData icon, String hintText, bool isPassword, bool isEmail,TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: palette.textColor1),
        ),

      ),

    );
  }
  Widget buildTextFieldLogin(
      IconData icon, String hintText, bool isPassword, bool isEmail,TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: palette.textColor1),
        ),

      ),

    );
  }
}