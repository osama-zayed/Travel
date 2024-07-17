import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/////تاكيد المسافر

class ConfirmationPage extends StatelessWidget {
  final int adultCount;
  final int childCount;
  final int infantCount;

  ConfirmationPage({required this.adultCount, required this.childCount, required this.infantCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تأكيد المسافرين'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('بالغ: $adultCount', style: TextStyle(fontSize: 18)),
            Text('طفل: $childCount', style: TextStyle(fontSize: 18)),
            Text('رضيع: $infantCount', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}