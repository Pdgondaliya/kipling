import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/custom_widget/text_field.dart';
import 'package:kipling/main.dart';
import 'package:kipling/module/forgot_password_model.dart';
import 'package:kipling/ui/forgot_password_confirmation.dart';
import 'package:kipling/ui/login_screen.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // String dropdownvalue = 'EN';
  ForgotPasswordModel? ld;

  TextEditingController emailController = TextEditingController();

  String emailError = '';
  int? statusCode;

  @override
  void initState() {
    super.initState();
    ld = forgotPasswordData;
  }

  Dio _dio = Dio();

  Future<int> emailSendAPI({String? email}) async {
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl: 'https://auth-mobile-app-staging.loyalty-cloud.com/api/user/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.post(
        "forgot-password",
        data: {"loginId": email},
      );
      setState(() {
        statusCode = response.statusCode;
      });

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
      body: Container(
          padding: EdgeInsets.only(
              right: displayWidth(context) * 0.08,
              left: displayWidth(context) * 0.08,
              top: displayWidth(context) * 0.4),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  index == 0
                      ? ld!.value!.titleTextEn.toString()
                      : ld!.value!.titleTextNl.toString(),
                  style: TextStyle(
                      fontFamily: 'Kipling_Bold',
                      color: Colors.black,
                      fontSize: displayWidth(context) * 0.08),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: displayWidth(context) * 0.05),
                Text(
                  index == 0
                      ? ld!.value!.descriptionTextEn.toString()
                      : ld!.value!.descriptionTextNl.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: displayWidth(context) * 0.05,
                    fontFamily: 'Kipling_Regular',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: displayWidth(context) * 0.04,
                    // horizontal: displayWidth(context) * 0.04,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        index == 0
                            ? ld!.value!.fields!.emailAddress!.titleTextEn
                            .toString()
                            : ld!.value!.fields!.emailAddress!.titleTextNl
                            .toString(),
                        style: TextStyle(
                            color: Color(0xff010001),
                            fontSize: displayWidth(context) * 0.05,
                            fontFamily: 'Kipling_Regular'),
                      ),
                      SizedBox(height: 5),
                      buildtextfields(
                          context: context,
                          controller: emailController,
                          hint: index == 0
                              ? ld!.value!.fields!.emailAddress!.placeholderTextEn
                              .toString()
                              : ld!.value!.fields!.emailAddress!.placeholderTextNl
                              .toString(),
                          onChanged: (value) {
                            if (value != '') {
                              setState(() {
                                emailError = '';
                              });
                            }
                          },
                          keyboard: TextInputType.emailAddress),
                      emailError == ''
                          ? Container()
                          : Container(
                        child: Text(emailError,
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Kipling_Regular')),
                      ),
                      Container(
                        width: double.infinity,
                        height: displayHeight(context) * 0.07,
                        margin:
                        EdgeInsets.only(top: displayHeight(context) * 0.03),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (emailController.text == '') {
                              setState(() {
                                emailError = 'Please enter email address';
                              });
                            } else if (emailController.text.contains('@') &&
                                emailController.text.contains('.')) {
                              emailSendAPI(email: emailController.text)
                                  .then((value) {
                                print('Value: $value');
                                if (value == 200) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordConfirmation(
                                                email: emailController.text,
                                              )));
                                } else if (value == 400) {

                                }
                              });
                            } else {
                              setState(() {
                                emailError = 'Please enter a valid email address';
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF2d2c2e),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0)),
                          ),
                          child: Text(
                            index == 0
                                ? ld!.value!.fields!.cta!.titleTextEn.toString()
                                : ld!.value!.fields!.cta!.titleTextNl.toString(),
                            style: TextStyle(
                                fontSize: displayWidth(context) * 0.05,
                                color: Color(0xfffcfdfd),
                                fontFamily: 'Kipling_Regular'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
          ),
    );
  }
}
