import 'package:flutter/material.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/module/create_account_model.dart';
import 'package:kipling/custom_widget/text_field.dart';
import 'package:kipling/ui/login_screen.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({this.createAccountModel});

  CreateAccountModel? createAccountModel;

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  late CreateAccountModel createAccountModel;
  String dropdownvalue = 'EN';
  var items = [];

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cnfPasswordController = TextEditingController();

  bool snUpNews = true;
  bool privacyPolicy = true;

  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CreateAccountModel? ld;

  @override
  void initState() {
    ld = widget.createAccountModel;
    // print(widget.createAccountModel?.name);
    // createAccountModel = widget.createAccountModel!;
    // for (var i in createAccountModel) {
    //   print(i.languageCode.toString().toUpperCase());
    //   // items.clear();
    //   items.add(i.languageCode.toUpperCase());
    // }
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
                              index = 0;
                            } else if (dropdownvalue == 'NL') {
                              index = 1;
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
                Padding( padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.08), child: Column(
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter First name';
                                }
                                return null;
                              },
                              keyboard: TextInputType.text),
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
                                  ? ld!.value.fields.lastName.placeholderTextEn
                                  : ld!.value.fields.lastName.placeholderTextNl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Last name';
                                }
                                return null;
                              },
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
                                  ? ld!
                                  .value.fields.emailAddress.placeholderTextEn
                                  : ld!.value.fields.emailAddress
                                  .placeholderTextNl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Email address';
                                }
                                return null;
                              },
                              keyboard: TextInputType.emailAddress)
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
                                  ? ld!.value.fields.password.placeholderTextEn
                                  : ld!.value.fields.password.placeholderTextNl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Password';
                                }
                                return null;
                              },
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
                                ? ld!.value.fields.confirmPassword.titleTextEn
                                : ld!.value.fields.confirmPassword.titleTextNl,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter confirm password';
                                } else if (cnfPasswordController.text !=
                                    passwordController.text) {
                                  return 'Password and Confirm Password must be same';
                                }
                                return null;
                              },
                              keyboard: TextInputType.text)
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
                    snUpNews == false
                        ? Padding(
                      padding: EdgeInsets.symmetric(
                        // horizontal: displayWidth(context) * 0.04,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_box_outlined,
                            color: Colors.transparent,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Please select our terms & conditions',
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Kipling_Regular'),
                          ),
                        ],
                      ),
                    )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        // horizontal: displayWidth(context) * 0.04,
                        vertical: displayWidth(context) * 0.04,
                      ),
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
                                ? ld!.value.fields.generalPermission.titleTextEn
                                : ld!.value.fields.generalPermission.titleTextNl,
                            style: TextStyle(
                                color: Color(0xff010001),
                                fontSize: displayWidth(context) * 0.05,
                                fontFamily: 'Kipling_Regular'),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: displayHeight(context) * 0.07,
                      margin: EdgeInsets.only(top: displayHeight(context) * 0.03),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_fromKey.currentState!.validate()) {
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF2d2c2e),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)
                          ),
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
                ),),

              ],
            )),
      ),
    );
  }
}