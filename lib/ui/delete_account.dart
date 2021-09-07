import 'dart:convert';
import 'dart:io';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/custom_widget/loader.dart';
import 'package:kipling/custom_widget/text_field.dart';
import 'package:kipling/helper/shared_prefs.dart';
import 'package:kipling/main.dart';
import 'package:kipling/module/delete_account_fusion_auth_model.dart';
import 'package:kipling/module/delete_data_page_model.dart';
import 'package:kipling/module/get_user_data.dart';
import 'package:kipling/module/login_check_model.dart';
import 'package:kipling/ui/login_screen.dart';

class DeleteAccount extends StatefulWidget {
  @override
  _DeleteAccountState createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  DeleteDataPageResponse? ld;
  String passwordError = '';
  bool privacyPolicy = true;

  Dio _dio = Dio();

  TextEditingController passwordController = TextEditingController();

  String? ipAddress;
  String? applicationId;

  getIP() async {
    ipAddress = await Ipify.ipv4();
    setState(() {});
    print('IPAddress: $ipAddress');

    Shared_Preferences.prefGetString(Shared_Preferences.fusionAuthId, "")
        .then((value) {
      setState(() {
        applicationId = value;
      });
      print('Application Id: $applicationId');
    });
  }

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
      if (response.statusCode == 200 || response.statusCode == 202) {
        Shared_Preferences.prefGetString(Shared_Preferences.keyId, '')
            .then((programIdentifierId) {
          print('ProgramIdentifier Id: ${programIdentifierId.toString()}');
          programIdentifierCallAPI(programIdentifierId!).then((customerId) {
            print(
                'customerId: ${customerId.programIdentifiers![0].identifier.toString()}');
            print('customerId1: ${customerId.id.toString()}');
            deleteFusionAuthAccountAPI(
                    customerId.programIdentifiers![0].identifier.toString())
                .then((deleted) {
              deleteAccountAPI(customerId.id.toString());
            });
          });
        });
        // Fluttertoast.showToast(
        //     msg: 'Login SuccessFully',
        //     gravity: ToastGravity.BOTTOM,
        //     backgroundColor: Colors.black);
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
          msg: 'You entered wrong password',
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

  Future<int> deleteFusionAuthAccountAPI(String programIdentifierId) async {
    showLoader();
    var headerMap = {
      "Authorization":
          'YmA9D5ju96N_rrBJsGDfKSS3nPuqYxXZp_2qUeYwWinD1eDC4TtriBTS'
    };
    var options = BaseOptions(
        baseUrl: 'https://auth-mobile-app-staging.loyalty-cloud.com/api/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.delete("user/$programIdentifierId");

      print('fusionUth Response delete: ${response.data}');
      // Fluttertoast.showToast(
      //     msg: 'Account Created Successfully',
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.black);
      // Navigator.pop(context);
      hideLoader();
      // return DeleteFusionAuthAccountModel.fromJson(response.data);
      return response.statusCode!;
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

  Future<DeleteFusionAuthAccountModel> deleteAccountAPI(
      String customerId) async {
    showLoader();
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl:
            'https://api-mobile-app-staging.loyalty-cloud.com/v1/customers-service/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.delete("customers/$customerId");
      hideLoader();

      print('Response delete: ${response.data}');
      if (response.statusCode == 200) {
        Shared_Preferences.clearAllPref();
        Shared_Preferences.clearPref(Shared_Preferences.keyId);
        Shared_Preferences.clearPref(Shared_Preferences.email);
        Shared_Preferences.clearPref(Shared_Preferences.fusionAuthId);
        Fluttertoast.showToast(
            msg: 'Account deleted Successfully',
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => login_screen()));
      }
      return DeleteFusionAuthAccountModel.fromJson(response.data);
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
    // showLoader();
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

  getIds() {
    Shared_Preferences.prefGetString(Shared_Preferences.email, '')
        .then((email) {
      print('delete MVC Email: $email');
      loginAPI(email!, passwordController.text, applicationId!, ipAddress!);
    });
  }

  iOSConfirmationDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Delete your account?',
                style: TextStyle(fontFamily: 'Kipling_Regular')),
            content: Text(
                'Do you want to delete your account? All of the data will be permanently deleted.',
                style: TextStyle(fontFamily: 'Kipling_Regular')),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Kipling_Regular'),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                child: Text(
                  'Delete',
                  style: TextStyle(
                      fontFamily: 'Kipling_Regular', color: Colors.blue),
                ),
                onPressed: () {
                  getIds();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  androidConfirmationDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete your account?',
                style: TextStyle(fontFamily: 'Kipling_Regular')),
            content: Text(
                'Do you want to delete your account? All of the data will be permanently deleted.',
                style: TextStyle(fontFamily: 'Kipling_Regular')),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'Kipling_Regular'),
                  )),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    getIds();
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        color: Colors.blue, fontFamily: 'Kipling_Regular'),
                  ))
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    ld = deleteAccountData;
    getIP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: displayWidth(context) * 0.03),
            child: Center(
              child: Container(
                alignment: Alignment.topRight,
                child: DropdownButton(
                  value: index == 1 ? 'NL' : dropdownvalue,
                  underline: Container(),
                  icon: Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 20,
                  ),
                  items: <String>['EN', 'NL']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      setState(() {
                        dropdownvalue = newValue!;
                        if (dropdownvalue == 'EN') {
                          index = 0;
                          print('Index0: $index');
                          dropdownvalue = newValue!;
                        } else if (dropdownvalue == 'NL') {
                          index = 1;
                          print('Index1: $index');
                        }
                      });
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.08),
        children: [
          SizedBox(
            height: displayWidth(context) * 0.05,
          ),
          Text(
            index == 0
                ? ld!.value!.titleTextEn.toString()
                : ld!.value!.titleTextNl.toString(),
            style: TextStyle(
                fontSize: displayWidth(context) * 0.06,
                fontFamily: 'Kipling_Bold',
                color: Colors.black),
          ),
          Html(
            data: index == 0
                ? ld!.value!.descriptionTextEn.toString()
                : ld!.value!.descriptionTextNl.toString(),
            style: {
              "body": Style(
                  fontFamily: 'Kipling_Regular',
                  textAlign: TextAlign.start,
                  fontSize: FontSize.larger),
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: displayWidth(context) * 0.02,
              // horizontal: displayWidth(context) * 0.04,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  index == 0
                      ? ld!.value!.fields!.password!.titleTextEn.toString()
                      : ld!.value!.fields!.password!.titleTextEn.toString(),
                  style: TextStyle(
                      color: Color(0xff010001),
                      fontSize: displayWidth(context) * 0.04,
                      fontFamily: 'Kipling_Regular'),
                ),
                SizedBox(height: 5),
                buildtextfields(
                    context: context,
                    isPassword: true,
                    controller: passwordController,
                    borderColor: passwordError != ''
                        ? Colors.red
                        : Colors.grey.withOpacity(0.5),
                    hint: index == 0
                        ? ld!.value!.fields!.password!.placeholderTextEn
                            .toString()
                        : ld!.value!.fields!.password!.placeholderTextNl
                            .toString(),
                    onChanged: (value) {
                      if (value != '') {
                        setState(() {
                          passwordError = '';
                        });
                      }
                    },
                    keyboard: TextInputType.text),
                passwordError == ''
                    ? Container()
                    : Container(
                        child: Text(passwordError,
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Kipling_Regular')),
                      )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                // horizontal: displayWidth(context) * 0.04,
                top: displayWidth(context) * 0.04,
                bottom: displayWidth(context) * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        privacyPolicy = !privacyPolicy;
                      });
                    },
                    child: privacyPolicy == false
                        ? Icon(
                            Icons.check_box_outlined,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.check_box,
                            color: Color(0xff89b14b),
                          ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    index == 0
                        ? ld!.value!.fields!.generalPermission!.titleTextEn
                            .toString()
                        : ld!.value!.fields!.generalPermission!.titleTextNl
                            .toString(),
                    style: TextStyle(
                        color: Color(0xff010001),
                        fontSize: displayWidth(context) * 0.04,
                        fontFamily: 'Kipling_Regular'),
                  ),
                )
              ],
            ),
          ),
          privacyPolicy == false
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_box_outlined,
                      color: Colors.transparent,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Please select our Privacy Policy',
                      style: TextStyle(
                          color: Colors.red, fontFamily: 'Kipling_Regular'),
                    ),
                  ],
                )
              : Container(),
          Container(
            width: double.infinity,
            height: displayHeight(context) * 0.07,
            margin: EdgeInsets.only(top: displayHeight(context) * 0.03),
            child: ElevatedButton(
              onPressed: () async {
                if (passwordController.text == '') {
                  setState(() {
                    passwordError = 'Please enter password';
                  });
                } else {
                  Platform.isAndroid
                      ? androidConfirmationDialog()
                      : iOSConfirmationDialog();
                }
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF2d2c2e),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
              ),
              child: Text(
                index == 0
                    ? ld!.value!.ctaButtonTextEn.toString()
                    : ld!.value!.ctaButtonTextNl.toString(),
                style: TextStyle(
                    fontSize: displayWidth(context) * 0.05,
                    color: Color(0xfffcfdfd),
                    fontFamily: 'Kipling_Regular'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
