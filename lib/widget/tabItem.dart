import 'package:flutter/material.dart';

class TabItem extends StatefulWidget {
  const TabItem({super.key, required this.title,});
  final String title;
  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(
            fontSize: 12,fontWeight: FontWeight.bold,
            ),
          ),

        ],

      ),

    );
  }
}
