// import 'package:flutter/material.dart';
//
// import 'dart:convert';
//
// import '../model/userModel.dart';
// import 'package:http/http.dart' as http;
//
//
//
// class UserViewModel extends ChangeNotifier {
//   UserModel _user = UserModel();
//
//   UserModel get user => _user;
//
//
//
//   void setUsername(String username) {
//     _user.username = username;
//     notifyListeners();
//   }
//
//   void setEmail(String email) {
//     _user.email = email;
//     notifyListeners();
//   }
//
//   void setPhone(String phone) {
//     _user.phone = phone;
//     notifyListeners();
//   }
//
//   void setPassword(String password) {
//     _user.password = password;
//     notifyListeners();
//   }
//
//   void setIsMale(bool isMale) {
//     _user.isMale = isMale;
//     notifyListeners();
//   }
//
//   Future<void> createUser() async {
//     final url = 'YOUR_API_URL_HERE';
//     final response = await http.post(
//       Uri.parse(url),
//       body: json.encode({
//         'username': _user.username,
//         'email': _user.email,
//         'phone': _user.phone,
//         'password': _user.password,
//         'is_male': _user.isMale,
//       }),
//       headers: {'Content-Type': 'application/json'},
//     );
//
//     if (response.statusCode == 200) {
//       // تم إنشاء الحساب بنجاح
//       print('Account created successfully');
//     } else {
//       // حدث خطأ أثناء إنشاء الحساب
//       print('Failed to create account');
//     }
//   }
// }
//
