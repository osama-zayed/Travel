import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'confirmationPage.dart';

class PassengerSelectionScreen extends StatefulWidget {
  @override
  _PassengerSelectionScreenState createState() => _PassengerSelectionScreenState();
}

class _PassengerSelectionScreenState extends State<PassengerSelectionScreen> {
  int adultCount = 1;
  int childCount = 0;
  int infantCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختر المسافرين'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'اختر المسافرين',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            buildPassengerRow('بالغ', '12 عامًا أو أكثر', adultCount, (value) {
              setState(() {
                adultCount = value;
              });
            }),
            buildPassengerRow('طفل', '2 - 11 عامًا', childCount, (value) {
              setState(() {
                childCount = value;
              });
            }),
            buildPassengerRow('رضيع', 'أقل من سنتان', infantCount, (value) {
              setState(() {
                infantCount = value;
              });
            }),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // تأكيد العدد المختار
              },
              child: Text('تأكيد'),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPassengerRow(String title, String subtitle, int count, ValueChanged<int> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              count.toString(),
              style: TextStyle(fontSize: 18),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (count > 0) {
                      onChanged(count - 1);
                    }
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
                IconButton(
                  onPressed: () {
                    onChanged(count + 1);
                  },
                  icon: Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}