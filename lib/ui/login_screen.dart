import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/custom_widget/internet_dialog.dart';
import 'package:kipling/custom_widget/loader.dart';
import 'package:kipling/custom_widget/text_field.dart';
import 'package:kipling/helper/shared_prefs.dart';
import 'package:kipling/main.dart';
import 'package:kipling/module/create_account_model.dart';
import 'package:kipling/module/login_check_model.dart';
import 'package:kipling/module/login_data.dart';
import 'package:kipling/module/personal_details_data.dart';
import 'package:kipling/ui/create_account.dart';
import 'package:kipling/ui/forgot_password.dart';
import 'package:kipling/ui/home_page.dart';
import 'package:kipling/ui/my_account_details.dart';
import 'package:kipling/ui/personal_details.dart';
import 'package:kipling/ui/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login_screen extends StatefulWidget {
  // const login_screen(
  //     {required this.ld, this.personalDetailData, this.createAccountModel});

  // final List<Logindata> profileList;
  // final Logindata? ld;
  // final PersonalDetailData? personalDetailData;
  // final CreateAccountModel? createAccountModel;

  @override
  _login_screenState createState() => _login_screenState();
}

var index = 0;
var items = [];
String dropdownvalue = 'EN';

class _login_screenState extends State<login_screen> {
  // final Color color = HexColor.fromHex('#aabbcc');
  // final List<Logindata> pl=widget.;
  late Logindata ld;
  Color bgColor = Colors.white;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? ipAddress;
  String? applicationId;

  getIP() async {
    ipAddress = await Ipify.ipv4();
    print('IPAddress: $ipAddress');

    Shared_Preferences.prefGetString(Shared_Preferences.fusionAuthId, "")
        .then((value) {
      applicationId = value;
      print('Application Id: $applicationId');
    });
  }

  // String dropdownvalue = 'EN';

  Dio _dio = Dio();

  Future<LoginModel> loginAPI(String loginId, String password,
      String applicationId, String ipAddress) async {
    showLoader();
    var headerMap = {
      "Authorization":
          'YmA9D5ju96N_rrBJsGDfKSS3nPuqYxXZp_2qUeYwWinD1eDC4TtriBTS'
    };
    var options = BaseOptions(
        baseUrl: 'https://auth-mobile-app-staging.loyalty-cloud.com/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.post("api/login", data: {
        "loginId": loginId,
        "password": password,
        "applicationId": applicationId,
        "ipAddress": ipAddress
      });

      print('status Code login: ${response.statusCode}');
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: 'Login SuccessFully',
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black);
      } else if (response.statusCode == 423) {
        Fluttertoast.showToast(
            msg: 'Your account is Locked',
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black);
      }
      hideLoader();
      return LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      print('Login Catch error');
      Fluttertoast.showToast(
          msg: 'Your account is Locked',
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black);
      hideLoader();
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        // var errorMessage = errorData["message"];

        throw Exception(errorData);
      } else {
        print('Login else error');
        hideLoader();
        var errorData = jsonDecode(e.response.toString());
        throw SocketException(errorData);
      }
    }
  }

  @override
  void initState() {
    print('pppppppppp  --- > ${personalDetailData}');
    // print(ld?.name);
    getIP();
    ld = logindata!;
    items.clear();
    for (var i in ld.value!) {
      print(i.languageCode.toString().toUpperCase());
      items.add(i.languageCode!.toUpperCase().toString());
      print('Items: ${items.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    internetCheck(context);
    return Scaffold(
        backgroundColor: bgColor,
        body: ld.value![index].logoImageUrl != null ||
                ld.value![index].logoImageUrl != ''
            ? SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: displayHeight(context) * 0.03,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            ld.value![index].bgImageUrl.toString()),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: displayHeight(context) * 0.02,
                              right: displayWidth(context) * 0.04),
                          child: Container(
                            alignment: Alignment.topRight,
                            child: DropdownButton(
                              value: dropdownvalue,
                              underline: Container(),
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: items.map((items) {
                                return DropdownMenuItem(
                                    value: items, child: Text(items));
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownvalue = newValue.toString();
                                  if (newValue.toString().toLowerCase() ==
                                      ld.value![0].languageCode) {
                                    setState(() {
                                      index = 0;
                                    });
                                  } else if (newValue
                                          .toString()
                                          .toLowerCase() ==
                                      ld.value![1].languageCode) {
                                    setState(() {
                                      index = 1;
                                    });
                                  } else {
                                    setState(() {
                                      index = 0;
                                    });
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: displayHeight(context) * 0.070,
                          margin: EdgeInsets.only(
                              top: displayHeight(context) * 0.01,
                              bottom: displayHeight(context) * 0.03),
                          child: Image.network(
                              ld.value![index].logoImageUrl.toString()),
                          // child: CachedNetworkImage(
                          //   imageUrl: ld.value![index].logoImageUrl.toString(),
                          //   placeholder: (context, url) =>
                          //       centerProgressBar(radius: 20, dotRadius: 6),
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(
                              displayWidth(context) * 0.05,
                              0,
                              displayWidth(context) * 0.05,
                              0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                child: Form(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: displayHeight(context) * 0.005,
                                          bottom:
                                              displayHeight(context) * 0.01),
                                      child: Text(
                                        ld.value![index].emailText.toString(),
                                        style: TextStyle(
                                          color: Color(0xff010001),
                                          fontSize:
                                              displayWidth(context) * 0.05,
                                          fontFamily: 'Kipling_Regular',
                                        ),
                                      ),
                                    ),
                                    buildtextfields(
                                        hint: ld
                                            .value![index].emailPlaceholderText
                                            .toString(),
                                        controller: emailController,
                                        context: context),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0,
                                          displayHeight(context) * 0.02,
                                          0,
                                          displayHeight(context) * 0.01),
                                      child: Text(
                                        ld.value![index].passwordText
                                            .toString(),
                                        style: TextStyle(
                                            color: Color(0xff010001),
                                            fontSize:
                                                displayWidth(context) * 0.05,
                                            fontFamily: 'Kipling_Regular'),
                                      ),
                                    ),
                                    buildtextfields(
                                        hint: ld.value![index]
                                            .passwordPlaceholderText
                                            .toString(),
                                        controller: passwordController,
                                        isPassword: true,
                                        context: context)
                                  ],
                                )),
                              ),
                              Container(
                                width: double.infinity,
                                height: displayHeight(context) * 0.07,
                                margin: EdgeInsets.only(
                                    top: displayHeight(context) * 0.03),
                                child: ElevatedButton(
                                  onPressed: () {
                                    loginAPI(
                                            emailController.text,
                                            passwordController.text,
                                            applicationId!,
                                            ipAddress!)
                                        .then((value) async {
                                      print(
                                          'dsfhjbsdhjfndskjfnkj: ${value.user!.id.toString()}');

                                      Shared_Preferences.prefSetString(
                                          Shared_Preferences.keyId,
                                          value.user!.id.toString());
                                      Shared_Preferences.prefSetString(
                                          Shared_Preferences.email,
                                          value.user!.email.toString());

                                      Shared_Preferences.prefSetString(
                                          Shared_Preferences.email,
                                          value.user!.email.toString());

                                      Shared_Preferences.prefSetString(
                                          Shared_Preferences.phoneNumber,
                                          value.user!.mobilePhone.toString());
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyAccountDetails() /*PersonalDetails()*/));
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF2d2c2e),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0.0)),
                                  ),
                                  child: Text(
                                    ld.value![index].logInButtonText.toString(),
                                    style: TextStyle(
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular',
                                      color: Color(0xfffcfdfd),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: displayHeight(context) * 0.04),
                                  child: GestureDetector(
                                    child: Text(
                                      ld.value![index].forgotPasswordText
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: displayWidth(context) * 0.05,
                                        color: Color(0xff91b557),
                                        fontFamily: 'Kipling_Regular',
                                      ),
                                    ),
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgotPassword())),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: displayWidth(context) * 0.025,
                                    right: displayWidth(context) * 0.025),
                                child: Row(children: <Widget>[
                                  Expanded(
                                      child: Divider(
                                    color: Colors.black54,
                                  )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: displayWidth(context) * 0.03,
                                        right: displayWidth(context) * 0.03),
                                    child: Text(
                                      "OR",
                                      style: TextStyle(
                                        fontSize: displayWidth(context) * 0.040,
                                        fontFamily: 'Kipling_Regular',
                                        color: Color(0xffadadac),
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                      child: Divider(
                                    color: Colors.black54,
                                  )),
                                ]),
                              ),
                              SizedBox(
                                height: displayHeight(context) * 0.28,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      ld.value![index].registerText.toString(),
                                      style: TextStyle(
                                          fontSize:
                                              displayWidth(context) * 0.045,
                                          color: Color(0xff0f0e0e),
                                          fontFamily: 'Kipling_Regular'),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: displayWidth(context) * 0.02),
                                      child: GestureDetector(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CreateAccount())),
                                          child: Text(
                                            ld.value![index].registerLinkText
                                                .toString(),
                                            style: TextStyle(
                                                fontSize:
                                                    displayWidth(context) *
                                                        0.045,
                                                color: Color(0xff88b04a),
                                                fontFamily: 'Kipling_Regular'),
                                          )),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: centerProgressBar(radius: 40, dotRadius: 12),
              ));
  }
}
