// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:kipling/MediaQuery/get_mediaquery.dart';
// import 'package:kipling/main.dart';
// import 'package:kipling/module/my_account_details_model.dart';
// import 'package:kipling/ui/login_screen.dart';
// import 'package:percent_indicator/percent_indicator.dart';
//
// class MyAccountDetails extends StatefulWidget {
//   @override
//   _MyAccountDetailsState createState() => _MyAccountDetailsState();
// }
//
// class _MyAccountDetailsState extends State<MyAccountDetails> {
//   MyAccountDetailsModel? ld;
//   List<PageName> pageNameList = [];
//
//   String avatar_url = '';
//
//   // listOfPage() {
//   //   for(int i = 0; i < ld!.value!.tabs.)
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     ld = myAccountDetailsData;
//   }
//
//   double percentageCount() {
//     return ((2300 * 100) / 2500);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Padding(
//               padding: EdgeInsets.only(
//                   top: displayWidth(context) * 0.08,
//                   right: displayWidth(context) * 0.08,
//                   left: displayWidth(context) * 0.08),
//               child: Center(
//                 child: Text(
//                   index == 0
//                       ? ld!.value!.titleTextEn.toString()
//                       : ld!.value!.titleTextNl.toString(),
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: displayWidth(context) * 0.04,
//                       fontFamily: 'Kipling_Bold'),
//                 ),
//               )),
//           Center(
//             child: Stack(
//               children: [
//                 avatar_url == ""
//                     ? Container()
//                     : Container(
//                   width: displayWidth(context),
//                   height: displayHeight(context) * 0.2,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage(avatar_url.toString()),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child:
//                   avatar_url != "" || avatar_url
//                       .toString()
//                       .isNotEmpty
//                       ? BackdropFilter(
//                     filter: ImageFilter.blur(
//                         sigmaX: 10.0, sigmaY: 10.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.2)),
//                     ),
//                   )
//                       : Container(),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Center(
//                       child: Padding(
//                         padding: EdgeInsets.all(displayWidth(context) * 0.05),
//                         child: Container(
//                           height: displayWidth(context) * 0.25,
//                           width: displayWidth(context) * 0.25,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image: NetworkImage(avatar_url == ""
//                                       ? ld!.value!.loyaltyCardBgImageUrl
//                                       .toString()
//                                       : avatar_url.toString()))),
//                         ),
//                       ),
//                     ),
//                     Text(
//                       'User Name',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'Kipling_Bold',
//                           fontSize: displayWidth(context) * 0.05),
//                     ),
//                     RaisedButton(
//                         color: Color(0xFF88b14a),
//                         onPressed: () {},
//                         child: Text(
//                           'Voyager',
//                           style: TextStyle(
//                               fontSize: displayWidth(context) * 0.04,
//                               fontFamily: 'Kipling_Regular',
//                               color: Colors.white),
//                         )),
//                     SizedBox(height: 10),
//                     CircularPercentIndicator(
//                       radius: displayWidth(context) * 0.3,
//                       lineWidth: 5.0,
//                       backgroundColor: Color(0xFF88b14a).withOpacity(0.2),
//                       circularStrokeCap: CircularStrokeCap.round,
//                       percent: 0.5,
//                       center: FittedBox(
//                         child: Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Column(
//                             children: [
//                               Text(
//                                 "500",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontFamily: 'Kipling_Regular',
//                                     fontSize: displayWidth(context) * 0.07),
//                               ),
//                               Text(
//                                 "Smile point",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontFamily: 'Kipling_Regular',
//                                     fontSize: displayWidth(context) * 0.03),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       progressColor: Color(0xFF88b14a),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           vertical: displayWidth(context) * 0.03,
//                           horizontal: displayWidth(context) * 0.08),
//                       child: Text(
//                         index == 0
//                             ? ld!.value!.savingDescriptionTextEn.toString()
//                             : ld!.value!.savingDescriptionTextNl.toString(),
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: displayWidth(context) * 0.03,
//                             fontFamily: 'Kipling_Regular',
//                             color: Colors.grey.shade400),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Card(
//             elevation: 5,
//             margin: EdgeInsets.zero,
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
//             color: Color(0xFF88b14a),
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: displayWidth(context) * 0.05,
//                   vertical: displayWidth(context) * 0.05),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Next journey: Secret collectable',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Kipling_Bold',
//                         fontSize: displayWidth(context) * 0.03),
//                   ),
//                   SizedBox(height: 5),
//                   LinearPercentIndicator(
//                     lineHeight: 10.0,
//                     percent: (2300 / 2500),
//                     padding: EdgeInsets.zero,
//                     backgroundColor: Color(0xFFabc97e),
//                     progressColor: Colors.white,
//                     linearStrokeCap: LinearStrokeCap.butt,
//                   ),
//                   SizedBox(height: 5),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '200 smile points to the next level',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'Kipling_Regular',
//                             fontSize: displayWidth(context) * 0.025),
//                       ),
//                       Text(
//                         '2300/2500 smile points',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'Kipling_Regular',
//                             fontSize: displayWidth(context) * 0.025),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           // ListView.builder(itemBuilder: (BuildContext context, int index) {
//           //   return
//           // })
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/custom_widget/loader.dart';
import 'package:kipling/helper/shared_prefs.dart';
import 'package:kipling/main.dart';
import 'package:kipling/module/get_user_data.dart';
import 'package:kipling/module/my_account_details_model.dart';
import 'package:kipling/ui/all_badges.dart';
import 'package:kipling/ui/badge_screen.dart';
import 'package:kipling/ui/login_screen.dart';
import 'package:kipling/ui/personal_details.dart';
import 'package:kipling/ui/voucher_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyAccountDetails extends StatefulWidget {
  @override
  _MyAccountDetailsState createState() => _MyAccountDetailsState();
}

class _MyAccountDetailsState extends State<MyAccountDetails> {
  MyAccountDetailsModel? ld;

  // List<PageName> pageNameList = [];

  String avatar_url = '';
  String avatar_url1 = 'assets/images/user.png';
  bool selected = false;
  int? statusCode;
  String? userName;
  String? phoneNumber;

  // listOfPage() {
  //   for(int i = 0; i < ld!.value!.tabs.)
  // }

  Dio _dio = Dio();

  Future<int> logoutAPI() async {
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl: 'https://auth-mobile-app-staging.loyalty-cloud.com/api/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.post(
        "logout",
      );
      setState(() {
        statusCode = response.statusCode;
      });
      print('Logout Status Code: $statusCode');
      if (statusCode == 200) {
        Shared_Preferences.clearAllPref();
        Shared_Preferences.clearPref(Shared_Preferences.keyId);
        Shared_Preferences.clearPref(Shared_Preferences.email);
        Shared_Preferences.clearPref(Shared_Preferences.phoneNumber);
        Shared_Preferences.clearPref(Shared_Preferences.fusionAuthId);
        Fluttertoast.showToast(
            msg: 'Logout Successfully',
            textColor: Colors.white,
            backgroundColor: Colors.black);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => login_screen()));
      }
      return response.statusCode!;
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["message"];
        throw Exception(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }

  Future<GetUserDataModel> getUserDataAPI(String id) async {
    showLoader();
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl:
            'https://api-mobile-app-staging.loyalty-cloud.com/v1/customers-service/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.get('customers/$id');
      print('afdsfgdsgdfsgfgfgfg: ${response.data}');
      hideLoader();
      return GetUserDataModel.fromJson(response.data);
    } on DioError catch (e) {
      hideLoader();
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        // var errorMessage = errorData["message"];
        throw Exception(errorData);
      } else {
        hideLoader();
        var errorData = jsonDecode(e.response.toString());
        throw SocketException(errorData);
      }
    }
  }

  Future<GetUserDataModel> programIdentifierCallAPI(String id) async {
    showLoader();
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl:
            'https://api-mobile-app-staging.loyalty-cloud.com/v1/customers-service/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.get("program-identifiers/$id");
      print('afdsfgdsgdfsgfgfgfg: ${response.data}');
      hideLoader();
      return GetUserDataModel.fromJson(response.data);
    } on DioError catch (e) {
      hideLoader();
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        // var errorMessage = errorData["message"];
        throw Exception(errorData);
      } else {
        hideLoader();
        var errorData = jsonDecode(e.response.toString());
        throw SocketException(errorData);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    ld = myAccountDetailsData;
    Shared_Preferences.prefGetString(Shared_Preferences.firstName, '')
        .then((firstName) {
      Shared_Preferences.prefGetString(Shared_Preferences.lastName, '')
          .then((lastName) {
        Shared_Preferences.prefGetString(Shared_Preferences.phoneNumber, '');
        setState(() {
          userName = "${firstName.toString()} ${lastName.toString()}";
        });
      });
      //   programIdentifierCallAPI(id!).then((programIdentifier) {
      //     getUserDataAPI(programIdentifier.id.toString()).then((getData) {
      //       // Shared_Preferences.prefGetString(
      //       //     Shared_Preferences.phoneNumber,
      //       //     getData.phoneNumbers[0]!.id.toString());
      //     });
      //   });
    });
    // pageNameList.add(PageName(
    //     icon: Icon(Icons.ac_unit, size: 20, color: Color(0xFF88b14a)),
    //     pageName: 'PERSONAL DETAILS'));
    // pageNameList.add(PageName(
    //     icon: Icon(Icons.ac_unit, size: 20, color: Color(0xFF88b14a)),
    //     pageName: 'TRANSACTION & ACTIVITIES'));
    // pageNameList.add(PageName(
    //     icon: Icon(Icons.ac_unit, size: 20, color: Color(0xFF88b14a)),
    //     pageName: 'MY VOUCHERS'));
    // pageNameList.add(PageName(
    //     icon: Icon(Icons.ac_unit, size: 20, color: Color(0xFF88b14a)),
    //     pageName: 'MY COLLECTABLES'));
    // pageNameList.add(PageName(
    //     icon: Icon(Icons.ac_unit, size: 20, color: Color(0xFF88b14a)),
    //     pageName: 'INBOX'));
    // pageNameList.add(PageName(
    //     icon: Icon(Icons.ac_unit, size: 20, color: Color(0xFF88b14a)),
    //     pageName: 'MY JOURNEY'));
    // pageNameList.add(PageName(
    //     icon: Icon(Icons.ac_unit, size: 20, color: Color(0xFF88b14a)),
    //     pageName: 'SIGN OUT'));
  }

  double percentageCount() {
    return ((2300 * 100) / 2500);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: selected ? Colors.black38 : Colors.transparent,
        title: Text(
          ld!.value!.titleTextEn.toString(),
          style: TextStyle(
              color: Colors.black,
              fontSize: displayWidth(context) * 0.045,
              fontFamily: 'Kipling_Bold'),
        ),
      ),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          // Container(
          //     color: selected ? Colors.black38 : Colors.transparent,
          //     padding: EdgeInsets.only(
          //         top: displayWidth(context) * 0.08,
          //         right: displayWidth(context) * 0.08,
          //         left: displayWidth(context) * 0.08),
          //     child: Center(
          //       child: Text(
          //         ld!.value!.titleTextEn.toString(),
          //         style: TextStyle(
          //             color: Colors.black,
          //             fontSize: displayWidth(context) * 0.045,
          //             fontFamily: 'Kipling_Bold'),
          //       ),
          //     )),
          Stack(
            children: [
              Center(
                child: Stack(
                  children: [
                    avatar_url == ""
                        ? Container()
                        : Container(
                            width: displayWidth(context),
                            height: displayHeight(context) * 0.2,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(avatar_url.toString()),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: avatar_url != "" ||
                                    avatar_url.toString().isNotEmpty
                                ? BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10.0, sigmaY: 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2)),
                                    ),
                                  )
                                : Container(),
                          ),
                    Container(
                      color: selected ? Colors.black38 : Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.all(displayWidth(context) * 0.05),
                              child: Container(
                                height: displayWidth(context) * 0.25,
                                width: displayWidth(context) * 0.25,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: avatar_url != ""
                                        ? DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(avatar_url))
                                        : DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                avatar_url1.toString()))),
                              ),
                            ),
                          ),
                          Text(
                            userName.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Kipling_Bold',
                                fontSize: displayWidth(context) * 0.05),
                          ),
                          RaisedButton(
                              color: Color(0xFF88b14a),
                              onPressed: () {},
                              child: Text(
                                'Voyager',
                                style: TextStyle(
                                    fontSize: displayWidth(context) * 0.04,
                                    fontFamily: 'Kipling_Regular',
                                    color: Colors.white),
                              )),
                          SizedBox(height: 10),
                          CircularPercentIndicator(
                            radius: displayWidth(context) * 0.3,
                            lineWidth: 5.0,
                            backgroundColor: Color(0xFF88b14a).withOpacity(0.2),
                            circularStrokeCap: CircularStrokeCap.round,
                            percent: 0.5,
                            center: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "500",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Kipling_Regular',
                                          fontSize:
                                              displayWidth(context) * 0.07),
                                    ),
                                    Text(
                                      "Smile point",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Kipling_Regular',
                                          fontSize:
                                              displayWidth(context) * 0.03),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            progressColor: Color(0xFF88b14a),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: displayWidth(context) * 0.03,
                                horizontal: displayWidth(context) * 0.08),
                            child: Text(
                              index == 0
                                  ? ld!.value!.savingDescriptionTextEn
                                      .toString()
                                  : ld!.value!.savingDescriptionTextNl
                                      .toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.03,
                                  fontFamily: 'Kipling_Regular',
                                  color: Colors.grey.shade400),
                            ),
                          ),
                          SizedBox(height: displayWidth(context) * 0.1),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                top: selected
                    ? displayWidth(context) * 0.3
                    : displayWidth(context) - (displayWidth(context) * 0.05),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(bottom: displayWidth(context) * 1.2),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: displayWidth(context) - 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // color: Colors.blue,
                        image: DecorationImage(
                            image: NetworkImage(
                                ld!.value!.loyaltyCardBgImageUrl.toString()),
                            fit: BoxFit.cover)),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: displayWidth(context) * 0.05),
                        Image.network(
                          ld!.value!.loyaltyCardBgImageUrl.toString(),
                          height: displayWidth(context) * 0.25,
                          width: displayWidth(context) * 0.25,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: displayWidth(context) * 0.1),
                          child: Center(
                            child: Text(
                              userName.toString(),
                              style: TextStyle(
                                  fontFamily: 'Kipling_Bold',
                                  color: Colors.black,
                                  fontSize: displayWidth(context) * 0.05),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            '9876543210',
                            style: TextStyle(
                                fontFamily: 'Kipling_Regular',
                                color: Colors.black,
                                fontSize: displayWidth(context) * 0.05),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //       top: displayWidth(context) * 0.07,
                        //       bottom: displayWidth(context) * 0.3),
                        //   child: Image.asset(
                        //     'assets/images/splash_logo.png',
                        //     width: displayWidth(context) * 0.3,
                        //     height: displayWidth(context) * 0.1,
                        //     fit: BoxFit.cover,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: displayWidth(context) * 0),
            child: Card(
              elevation: 5,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              color: Color(0xFF88b14a),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.05,
                    vertical: displayWidth(context) * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next journey: Secret collectable',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Kipling_Bold',
                          fontSize: displayWidth(context) * 0.03),
                    ),
                    SizedBox(height: 5),
                    LinearPercentIndicator(
                      lineHeight: 10.0,
                      percent: (2300 / 2500),
                      padding: EdgeInsets.zero,
                      backgroundColor: Color(0xFFabc97e),
                      progressColor: Colors.white,
                      linearStrokeCap: LinearStrokeCap.butt,
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '200 smile points to the next level',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Kipling_Regular',
                              fontSize: displayWidth(context) * 0.025),
                        ),
                        Text(
                          '2300/2500 smile points',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Kipling_Regular',
                              fontSize: displayWidth(context) * 0.025),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: ld!.value!.tabs!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: displayWidth(context) * 0.05),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (ld!.value!.tabs![index].redirectUrl
                                    .toString() ==
                                'my_profile') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PersonalDetails()));
                            } else if (ld!.value!.tabs![index].redirectUrl
                                    .toString() ==
                                'my_history') {
                            } else if (ld!.value!.tabs![index].redirectUrl
                                    .toString() ==
                                'account_setting') {
                            } else if (ld!.value!.tabs![index].redirectUrl
                                    .toString() ==
                                'voucher') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Voucher()));
                            } else if (ld!.value!.tabs![index].redirectUrl
                                    .toString() ==
                                'badge') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BadgeScreen()));
                            } else if (ld!.value!.tabs![index].redirectUrl
                                    .toString() ==
                                'logout') {
                              logoutAPI();
                            }
                          },
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: displayWidth(context) * 0.02),
                              child: Row(
                                children: [
                                  SizedBox(
                                    child: Icon(
                                        ld!.value!.tabs![index].redirectUrl
                                                    .toString() ==
                                                'my_profile'
                                            ? Icons.person_outline
                                            : ld!.value!.tabs![index]
                                                        .redirectUrl
                                                        .toString() ==
                                                    'my_history'
                                                ? Icons.history_edu_outlined
                                                : ld!.value!.tabs![index]
                                                            .redirectUrl
                                                            .toString() ==
                                                        'account_setting'
                                                    ? Icons.settings
                                                    : ld!.value!.tabs![index]
                                                                .redirectUrl
                                                                .toString() ==
                                                            'voucher'
                                                        ? Icons
                                                            .wallet_giftcard_outlined
                                                        : ld!
                                                                    .value!
                                                                    .tabs![
                                                                        index]
                                                                    .redirectUrl
                                                                    .toString() ==
                                                                'badge'
                                                            ? Icons
                                                                .badge_outlined
                                                            : ld!
                                                                        .value!
                                                                        .tabs![
                                                                            index]
                                                                        .redirectUrl
                                                                        .toString() ==
                                                                    'logout'
                                                                ? Icons.logout
                                                                : null,
                                        size: 20,
                                        color: Color(0xFF88b14a)),
                                  ),
                                  SizedBox(width: displayWidth(context) * 0.02),
                                  Text(
                                    index == 0
                                        ? ld!.value!.tabs![index].textEn
                                            .toString()
                                        : ld!.value!.tabs![index].textNl
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: displayWidth(context) * 0.04,
                                        fontFamily: 'Kipling_Regular',
                                        color: Color(0xFF88b14a)),
                                  )
                                ],
                              )),
                        ),
                        Divider(color: Colors.grey)
                      ],
                    ));
              })
        ],
      ),
    );
  }
}
