// import 'package:flutter/material.dart';
// import 'package:kipling/ui/badge_screen.dart';
// import 'package:kipling/ui/delete_account.dart';
// import 'package:kipling/ui/personal_details.dart';
// import 'package:kipling/ui/voucher_screen.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             RaisedButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => PersonalDetails()));
//               },
//               color: Color(0xFF88b14a),
//               child: Text(
//                 'Personal Details',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             RaisedButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => BadgeScreen()));
//               },
//               color: Color(0xFF88b14a),
//               child: Text(
//                 'Badge',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             RaisedButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => Voucher()));
//               },
//               color: Color(0xFF88b14a),
//               child: Text(
//                 'Voucher',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             RaisedButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => DeleteAccount()));
//               },
//               color: Color(0xFF88b14a),
//               child: Text(
//                 'Delete Account',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
