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
                    top: displayHeight(context) * 0.02,
                    right: displayWidth(context) * 0.04),
                child: Container(
                  alignment: Alignment.topRight,
                  child: DropdownButton(
                    value: index == 1 ? 'NL' : dropdownvalue,
                    underline: Container(),
                    icon: Icon(Icons.keyboard_arrow_down),
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
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.04,
                    vertical: displayWidth(context) * 0.02),
                child: Text(
                  index == 0 ? ld!.value.titleTextEn : ld!.value.titleTextNl,
                  style: TextStyle(
                      fontSize: displayWidth(context) * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: displayWidth(context) * 0.04,
                  right: displayWidth(context) * 0.04,
                  top: displayWidth(context) * 0.02,
                  bottom: displayWidth(context) * 0.02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(index == 0
                        ? ld!.value.fields.name.titleTextEn
                        : ld!.value.fields.name.titleTextNl),
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
                        keyboard: TextInputType.text)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: displayWidth(context) * 0.02,
                  horizontal: displayWidth(context) * 0.04,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(index == 0
                        ? ld!.value.fields.lastName.titleTextEn
                        : ld!.value.fields.lastName.titleTextNl),
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
                  horizontal: displayWidth(context) * 0.04,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(index == 0
                        ? ld!.value.fields.emailAddress.titleTextEn
                        : ld!.value.fields.emailAddress.titleTextNl),
                    SizedBox(height: 5),
                    buildtextfields(
                        context: context,
                        controller: emailController,
                        hint: index == 0
                            ? ld!.value.fields.emailAddress.placeholderTextEn
                            : ld!.value.fields.emailAddress.placeholderTextNl,
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
                  horizontal: displayWidth(context) * 0.04,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(index == 0
                        ? ld!.value.fields.password.titleTextEn
                        : ld!.value.fields.password.titleTextNl),
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
                  horizontal: displayWidth(context) * 0.04,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(index == 0
                        ? ld!.value.fields.confirmPassword.titleTextEn
                        : ld!.value.fields.confirmPassword.titleTextNl),
                    SizedBox(height: 5),
                    buildtextfields(
                        context: context,
                        isPassword: true,
                        controller: cnfPasswordController,
                        hint: index == 0
                            ? ld!.value.fields.confirmPassword.placeholderTextEn
                            : ld!
                                .value.fields.confirmPassword.placeholderTextNl,
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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.04,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(snUpNews == false ? 'Please select our terms & conditions' : ''),
                    SizedBox(width: 10),
                    Text(
                        index == 0
                            ? ld!.value.fields.optin.titleTextEn
                            : ld!.value.fields.optin.titleTextNl,
                        style: TextStyle(color: Color(0xff010001)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.04,
                  vertical: displayWidth(context) * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: TextStyle(color: Color(0xff010001)))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: displayWidth(context) * 0.04,
                    horizontal: displayWidth(context) * 0.04),
                width: displayWidth(context),
                height: displayWidth(context) * 0.2,
                child: RaisedButton(
                  color: Color(0xff2c2d2e),
                  onPressed: () {
                    if (_fromKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    index == 0
                        ? ld!.value.fields.signUp.titleTextEn
                        : ld!.value.fields.signUp.titleTextNl,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: displayHeight(context) * 0.03,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: displayWidth(context) * 0.04,
                    horizontal: displayWidth(context) * 0.04),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        index == 0
                            ? ld!.value.loginTextEn
                            : ld!.value.titleTextNl,
                        style: TextStyle(color: Colors.black)),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        index == 0
                            ? ld!.value.loginLinkTextEn
                            : ld!.value.loginLinkTextNl,
                        style: TextStyle(color: Color(0xff89b14b)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
