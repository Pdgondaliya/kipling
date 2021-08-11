import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/module/create_account_model.dart';
import 'package:kipling/custom_widget/text_field.dart';
import 'package:kipling/module/fusion_auth_register_model.dart';
import 'package:kipling/module/register_user_model.dart';
import 'package:kipling/ui/login_screen.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({this.createAccountModel});

  CreateAccountModel? createAccountModel;

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  // String dropdownvalue = 'EN';

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cnfPasswordController = TextEditingController();

  String firstNameError = '';
  String lastNameError = '';
  String MiddleNameError = '';
  String dobError = '';
  String emailError = '';
  String passwordError = '';
  String cnfPasswordError = '';

  bool snUpNews = true;
  bool privacyPolicy = true;
  bool isLoader = false;

  String languageCode = 'en';
  String finalDate = '';

  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CreateAccountModel? ld;

  Dio _dio = Dio();

  Future<RegisterUserModel> createAccountAPI(
      {String? name,
      String? mName,
      String? lName,
      String? dob,
      String? languageCode,
      String? emailAddress,
      bool? emailPrimary,
      bool? isOption,
      bool? isGeneral,
      String? identifier}) async {
    isLoader = true;
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl: 'https://api-mobile-app-staging.loyalty-cloud.com/v1/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.post(
        "customers-service/customers?name=$name&middle_name=$mName&last_name=$lName&birth_date=$dob&language_code=$languageCode&email_address=$emailAddress&primary=$emailPrimary&optin=$isOption&general_permission=$isGeneral&type=AUTH&identifier=$identifier&status=Active",
        // data: {
        //   "name": name,
        //   "middle_name": mName,
        //   "last_name": lName,
        //   "birth_date": dob, //"1988-01-21T00:00:00Z"
        //   "language_code": languageCode,
        //   "emails": [
        //     {"email_address": emailAddress, "primary": emailPrimary}
        //   ],
        //   "optin": isOption,
        //   "general_permission": isGeneral,
        //   "program_identifiers": [
        //     {"type": "Auth", "identifier": identifier, "status": "Active"}
        //   ]
        // },
      );
      isLoader = false;
      // Fluttertoast.showToast(
      //     msg: 'Registered Successfully',
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.black);
      Fluttertoast.showToast(
          msg: 'Account Created Successfully',
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black);
      Navigator.pop(context);
      return RegisterUserModel.fromJson(response.data);
    } on DioError catch (e) {
      isLoader = false;
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["message"];
        throw Exception(errorMessage);
      } else {
        isLoader = false;
        throw SocketException("");
      }
    }
  }

  Future<FusionAuthRegisterModel> fusionAuthRegister(
      String emailAddress, String password) async {
    var headerMap = {
      "Authorization":
          'YmA9D5ju96N_rrBJsGDfKSS3nPuqYxXZp_2qUeYwWinD1eDC4TtriBTS'
    };
    var options = BaseOptions(
        baseUrl: 'https://auth-mobile-app-staging.loyalty-cloud.com/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response =
          await _dio.get("api/user?email=sfan0727@m-wise.nl&password=1qaz@WSX");
      // Fluttertoast.showToast(
      //     msg: 'Account Created Successfully',
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.black);
      // Navigator.pop(context);
      return FusionAuthRegisterModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        // var errorMessage = errorData["message"];
        throw Exception(errorData);
      } else {
        var errorData = jsonDecode(e.response.toString());
        throw SocketException(errorData);
      }
    }
  }

  @override
  void initState() {
    ld = widget.createAccountModel;
  }

  DateTime currentDate = DateTime.now();

  Future<void> _selectDateAndroid(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;

        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        dateController.text = formatter.format(currentDate);

        final DateFormat df = DateFormat('yyyy-MM-dd');
        String d = df.format(currentDate);

        DateFormat tf = new DateFormat("HH:mm:ss");
        String s = tf.format(currentDate);

        print('dateResult: ${d + 'T' + s + 'Z'}');
        finalDate = d + 'T' + s + 'Z';
      });
  }

  void _selectDateiOS(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: displayHeight(context) * 0.5,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: displayHeight(context) * 0.425,
                    child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (val) {
                          setState(() {
                            currentDate = val;

                            final DateFormat formatter =
                                DateFormat('dd-MM-yyyy');
                            dateController.text = formatter.format(currentDate);
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Form(
            key: _fromKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: displayHeight(context) * 0.04,
                      right: displayWidth(context) * 0.03),
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
                          dropdownvalue = newValue!;
                          setState(() {
                            if (dropdownvalue == 'EN') {
                              setState(() {
                                index = 0;
                                languageCode = 'en';
                              });
                            } else if (dropdownvalue == 'NL') {
                              setState(() {
                                index = 1;
                                languageCode = 'nl';
                              });
                            }
                          });
                        });
                        // setState(() {
                        //   dropdownvalue = newValue.toString();
                        //   if (newValue.toString().toLowerCase() ==
                        //       ld.value[0].languageCode) {
                        //     index = 0;
                        //   } else if (newValue.toString().toLowerCase() ==
                        //       ld.value[1].languageCode) {
                        //     index = 1;
                        //   } else {
                        //     index = 0;
                        //   }
                        // });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: displayWidth(context) * 0.08),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            // horizontal: displayWidth(context) * 0.04,
                            //   vertical: displayWidth(context) * 0.01
                            ),
                        child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              index == 0
                                  ? ld!.value.titleTextEn
                                  : ld!.value.titleTextNl,
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.09,
                                  fontFamily: 'Kipling_Bold',
                                  color: Colors.black),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          // left: displayWidth(context) * 0.04,
                          // right: displayWidth(context) * 0.04,
                          top: displayWidth(context) * 0.05,
                          bottom: displayWidth(context) * 0.01,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              index == 0
                                  ? ld!.value.fields.name.titleTextEn
                                  : ld!.value.fields.name.titleTextNl,
                              style: TextStyle(
                                  color: Color(0xff010001),
                                  fontSize: displayWidth(context) * 0.05,
                                  fontFamily: 'Kipling_Regular'),
                            ),
                            SizedBox(height: 5),
                            buildtextfields(
                                context: context,
                                controller: fNameController,
                                hint: index == 0
                                    ? ld!.value.fields.name.placeholderTextEn
                                    : ld!.value.fields.name.placeholderTextNl,
                                onChanged: (value) {
                                  if (value != '') {
                                    setState(() {
                                      firstNameError = '';
                                    });
                                  }
                                },
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Please enter First name';
                                //   }
                                //   return null;
                                // },
                                keyboard: TextInputType.text),
                            firstNameError == ''
                                ? Container()
                                : Container(
                                    child: Text(firstNameError,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: 'Kipling_Regular')),
                                  )
                          ],
                        ),
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
                                  ? ld!.value.fields.lastName.titleTextEn
                                  : ld!.value.fields.lastName.titleTextNl,
                              style: TextStyle(
                                  color: Color(0xff010001),
                                  fontSize: displayWidth(context) * 0.05,
                                  fontFamily: 'Kipling_Regular'),
                            ),
                            SizedBox(height: 5),
                            buildtextfields(
                                context: context,
                                controller: lNameController,
                                hint: index == 0
                                    ? ld!
                                        .value.fields.lastName.placeholderTextEn
                                    : ld!.value.fields.lastName
                                        .placeholderTextNl,
                                onChanged: (value) {
                                  if (value != '') {
                                    setState(() {
                                      lastNameError = '';
                                    });
                                  }
                                },
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Please enter Last name';
                                //   }
                                //   return null;
                                // },
                                keyboard: TextInputType.text),
                            lastNameError == ''
                                ? Container()
                                : Container(
                                    child: Text(lastNameError,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: 'Kipling_Regular')),
                                  )
                          ],
                        ),
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
                                  ? ld!.value.fields.middleName.titleTextEn
                                  : ld!.value.fields.middleName.titleTextNl,
                              style: TextStyle(
                                  color: Color(0xff010001),
                                  fontSize: displayWidth(context) * 0.05,
                                  fontFamily: 'Kipling_Regular'),
                            ),
                            SizedBox(height: 5),
                            buildtextfields(
                                context: context,
                                controller: mNameController,
                                hint: index == 0
                                    ? ld!.value.fields.middleName
                                        .placeholderTextEn
                                    : ld!.value.fields.middleName
                                        .placeholderTextNl,
                                keyboard: TextInputType.text)
                          ],
                        ),
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
                                  ? ld!.value.fields.birthDate.titleTextEn
                                  : ld!.value.fields.birthDate.titleTextNl,
                              style: TextStyle(
                                  color: Color(0xff010001),
                                  fontSize: displayWidth(context) * 0.05,
                                  fontFamily: 'Kipling_Regular'),
                            ),
                            SizedBox(height: 5),
                            GestureDetector(
                                onTap: () => Platform.isAndroid
                                    ? _selectDateAndroid(context)
                                    : _selectDateiOS(context),
                                child: buildtextfields(
                                    enable: false,
                                    context: context,
                                    controller: dateController,
                                    hint: index == 0
                                        ? ld!.value.fields.birthDate
                                            .placeholderTextEn
                                        : ld!.value.fields.birthDate
                                            .placeholderTextNl,
                                    onChanged: (value) {
                                      if (value != '') {
                                        setState(() {
                                          dobError = '';
                                        });
                                      }
                                    },
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return 'Please select Birth date';
                                    //   }
                                    //   return null;
                                    // },
                                    keyboard: TextInputType.text)),
                            dobError == ''
                                ? Container()
                                : Container(
                                    child: Text(dobError,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: 'Kipling_Regular')),
                                  )
                          ],
                        ),
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
                                  ? ld!.value.fields.emailAddress.titleTextEn
                                  : ld!.value.fields.emailAddress.titleTextNl,
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
                                    ? ld!.value.fields.emailAddress
                                        .placeholderTextEn
                                    : ld!.value.fields.emailAddress
                                        .placeholderTextNl,
                                onChanged: (value) {
                                  if (value != '') {
                                    setState(() {
                                      emailError = '';
                                    });
                                  }
                                },
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Please enter Email address';
                                //   }
                                //   return null;
                                // },
                                keyboard: TextInputType.emailAddress),
                            emailError == ''
                                ? Container()
                                : Container(
                                    child: Text(emailError,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: 'Kipling_Regular')),
                                  )
                          ],
                        ),
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
                                  ? ld!.value.fields.password.titleTextEn
                                  : ld!.value.fields.password.titleTextNl,
                              style: TextStyle(
                                  color: Color(0xff010001),
                                  fontSize: displayWidth(context) * 0.05,
                                  fontFamily: 'Kipling_Regular'),
                            ),
                            SizedBox(height: 5),
                            buildtextfields(
                                context: context,
                                isPassword: true,
                                controller: passwordController,
                                hint: index == 0
                                    ? ld!
                                        .value.fields.password.placeholderTextEn
                                    : ld!.value.fields.password
                                        .placeholderTextNl,
                                onChanged: (value) {
                                  if (value != '') {
                                    setState(() {
                                      passwordError = '';
                                    });
                                  }
                                },
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Please enter Password';
                                //   }
                                //   return null;
                                // },
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
                                  ? ld!.value.fields.confirmPassword.titleTextEn
                                  : ld!
                                      .value.fields.confirmPassword.titleTextNl,
                              style: TextStyle(
                                  color: Color(0xff010001),
                                  fontSize: displayWidth(context) * 0.05,
                                  fontFamily: 'Kipling_Regular'),
                            ),
                            SizedBox(height: 5),
                            buildtextfields(
                                context: context,
                                isPassword: true,
                                controller: cnfPasswordController,
                                hint: index == 0
                                    ? ld!.value.fields.confirmPassword
                                        .placeholderTextEn
                                    : ld!.value.fields.confirmPassword
                                        .placeholderTextNl,
                                onChanged: (value) {
                                  if (value != '') {
                                    setState(() {
                                      cnfPasswordError = '';
                                    });
                                  }
                                },
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Please enter confirm password';
                                //   } else if (cnfPasswordController.text !=
                                //       passwordController.text) {
                                //     return 'Password and Confirm Password must be same';
                                //   }
                                //   return null;
                                // },
                                keyboard: TextInputType.text),
                            cnfPasswordError == ''
                                ? Container()
                                : Container(
                                    child: Text(cnfPasswordError,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontFamily: 'Kipling_Regular')),
                                  )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: displayWidth(context) * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            // horizontal: displayWidth(context) * 0.04,
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  snUpNews = !snUpNews;
                                });
                              },
                              child: snUpNews == false
                                  ? Icon(
                                      Icons.check_box_outlined,
                                      color: Colors.black,
                                    )
                                  : Icon(
                                      Icons.check_box,
                                      color: Color(0xff89b14b),
                                    ),
                            ),
                            SizedBox(width: 10),
                            Text(
                                index == 0
                                    ? ld!.value.fields.optin.titleTextEn
                                    : ld!.value.fields.optin.titleTextNl,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.05,
                                    fontFamily: 'Kipling_Regular')),
                          ],
                        ),
                      ),
                      // snUpNews == false
                      //     ? Padding(
                      //         padding: EdgeInsets.symmetric(
                      //             // horizontal: displayWidth(context) * 0.04,
                      //             ),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Icon(
                      //               Icons.check_box_outlined,
                      //               color: Colors.transparent,
                      //             ),
                      //             SizedBox(width: 10),
                      //             Text(
                      //               'Please select our terms & conditions',
                      //               style: TextStyle(
                      //                   color: Colors.red,
                      //                   fontFamily: 'Kipling_Regular'),
                      //             ),
                      //           ],
                      //         ),
                      //       )
                      //     : Container(),
                      Padding(
                        padding: EdgeInsets.only(
                            // horizontal: displayWidth(context) * 0.04,
                            top: displayWidth(context) * 0.04,
                            bottom: displayWidth(context) * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
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
                            SizedBox(width: 10),
                            Text(
                              index == 0
                                  ? ld!.value.fields.generalPermission
                                      .titleTextEn
                                  : ld!.value.fields.generalPermission
                                      .titleTextNl,
                              style: TextStyle(
                                  color: Color(0xff010001),
                                  fontSize: displayWidth(context) * 0.05,
                                  fontFamily: 'Kipling_Regular'),
                            ),
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
                                      color: Colors.red,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ],
                            )
                          : Container(),
                      Container(
                        width: double.infinity,
                        height: displayHeight(context) * 0.07,
                        margin:
                            EdgeInsets.only(top: displayHeight(context) * 0.03),
                        child: ElevatedButton(
                          onPressed: () async {
                            // if (_fromKey.currentState!.validate()) {
                            //   createAccountAPI(
                            //           dob: finalDate,
                            //           emailAddress: emailController.text,
                            //           emailPrimary: true,
                            //           isGeneral: privacyPolicy,
                            //           isOption: snUpNews,
                            //           languageCode: languageCode,
                            //           lName: lNameController.text,
                            //           mName: mNameController.text,
                            //           name: fNameController.text)
                            //       .then((value) {
                            //     fusionAuthRegister(emailController.text,
                            //         passwordController.text);
                            //   });
                            // }

                            if (fNameController.text == '') {
                              setState(() {
                                firstNameError = 'Please enter first name';
                              });
                            }
                            /*else if (fNameController.text != '') {
                              setState(() {
                                firstNameError = '';
                              });
                            }*/
                            else if (lNameController.text == '') {
                              setState(() {
                                lastNameError = 'Please enter last name';
                              });
                            }
                            /*else if (lNameController.text != '') {
                              setState(() {
                                lastNameError = '';
                              });
                            }*/
                            else if (dateController.text == '') {
                              setState(() {
                                dobError = 'Please select birth date';
                              });
                            }
                            /*else if (dateController.text != '') {
                              setState(() {
                                dobError = '';
                              });
                            }*/
                            else if (emailController.text == '') {
                              setState(() {
                                emailError = 'Please enter email address';
                              });
                            }
                            /*else if (emailController.text != '') {
                              setState(() {
                                emailError = '';
                              });
                            }*/
                            else if (passwordController.text == '') {
                              setState(() {
                                passwordError = 'Please enter password';
                              });
                            }
                            /*else if (passwordController.text != '') {
                              setState(() {
                                passwordError = '';
                              });
                            }*/
                            else if (cnfPasswordController.text == '') {
                              setState(() {
                                cnfPasswordError =
                                    'Please enter confirm password';
                              });
                            } else if (passwordController.text !=
                                cnfPasswordController.text) {
                              setState(() {
                                cnfPasswordError =
                                    'Password and Confirm Password must be same';
                              });
                            }
                            /*else if (cnfPasswordController.text != '') {
                              setState(() {
                                cnfPasswordError = '';
                              });
                            }*/
                            else {
                              // if (_fromKey.currentState!.validate()) {
                              fusionAuthRegister(emailController.text,
                                      passwordController.text)
                                  .then((value) {
                                print('id: ${value.user!.id.toString()}');
                                createAccountAPI(
                                    dob: finalDate,
                                    emailAddress: emailController.text,
                                    emailPrimary: true,
                                    isGeneral: privacyPolicy,
                                    isOption: snUpNews,
                                    languageCode: languageCode,
                                    lName: lNameController.text,
                                    mName: mNameController.text,
                                    name: fNameController.text,
                                    identifier: value.user!.id.toString());
                              });
                              // createAccountAPI(
                              //         dob: finalDate,
                              //         emailAddress: emailController.text,
                              //         emailPrimary: true,
                              //         isGeneral: privacyPolicy,
                              //         isOption: snUpNews,
                              //         languageCode: languageCode,
                              //         lName: lNameController.text,
                              //         mName: mNameController.text,
                              //         name: fNameController.text)
                              //     .then((value) {
                              //   fusionAuthRegister(emailController.text,
                              //       passwordController.text);
                              // });
                              // }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF2d2c2e),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0)),
                          ),
                          child: Text(
                            index == 0
                                ? ld!.value.fields.signUp.titleTextEn
                                : ld!.value.fields.signUp.titleTextNl,
                            style: TextStyle(
                                fontSize: displayWidth(context) * 0.05,
                                color: Color(0xfffcfdfd),
                                fontFamily: 'Kipling_Regular'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: displayWidth(context) * 0.05,
                          // horizontal: displayWidth(context) * 0.04
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              index == 0
                                  ? ld!.value.loginTextEn
                                  : ld!.value.titleTextNl,
                              style: TextStyle(
                                  color: Color(0xff010001),
                                  fontSize: displayWidth(context) * 0.05,
                                  fontFamily: 'Kipling_Regular'),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Text(
                                index == 0
                                    ? ld!.value.loginLinkTextEn
                                    : ld!.value.loginLinkTextNl,
                                style: TextStyle(
                                    color: Color(0xff89b14b),
                                    fontSize: displayWidth(context) * 0.05,
                                    fontFamily: 'Kipling_Bold'),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
