// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../widget/tabItem.dart';
// class SearchAirport extends StatefulWidget {
//   const SearchAirport({super.key});
//
//   @override
//   State<SearchAirport> createState() => _SearchAirportState();
// }
// class _SearchAirportState extends State<SearchAirport>{
//
//   @override
//   Widget build(BuildContext context){
//     return DraggableScrollableSheet(
//       initialChildSize: 0.7,
//       builder: (_, controller)=>DefaultTabController(
//         length: 2,
//         child: SingleChildScrollView(
//           controller: controller,
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: 20),
//                   child: ListTile(
//                     title:Text  ( "    ادخل وجهه المغادره".tr,),
//                       onTap: () {},
//                   ),
//
//                 ),
//                ///////////////////////////////////افعل البحث
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class DataSearch extends SearchDelegate{
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return[
//       IconButton(icon: Icon(Icons.close),onPressed: (){},)
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(icon: Icon(Icons.close),onPressed: (){},);
//   }
//
//   @override
//   Widget? buildResults(BuildContext context) {
//     return null;
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//    return  Text("بحث");
//   }
//
