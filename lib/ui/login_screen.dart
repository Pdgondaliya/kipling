import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/custom_widget/text_field.dart';
import 'package:kipling/main.dart';
import 'package:kipling/module/create_account_model.dart';
import 'package:kipling/module/login_data.dart';
import 'package:kipling/module/personal_details_data.dart';
import 'package:kipling/ui/create_account.dart';
import 'package:kipling/ui/personal_details.dart';
import 'package:kipling/ui/welcome_screen.dart';

class login_screen extends StatefulWidget {
  const login_screen(
      {required this.ld, this.personalDetailData, this.createAccountModel});

  // final List<Logindata> profileList;
  final Logindata? ld;
  final PersonalDetailData? personalDetailData;
  final CreateAccountModel? createAccountModel;

  @override
  _login_screenState createState() => _login_screenState();
}

var index = 0;
var items = [];

class _login_screenState extends State<login_screen> {
  // final Color color = HexColor.fromHex('#aabbcc');
  // final List<Logindata> pl=widget.;
  late Logindata ld;
  Color bgColor = Colors.white;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String dropdownvalue = 'EN';


  @override
  void initState() {
    print('pppppppppp  --- > ${widget.personalDetailData}');
    print(widget.ld?.name);
    ld = widget.ld!;
    for (var i in ld.value) {
      print(i.languageCode.toString().toUpperCase());
      // items.clear();
      items.add(i.languageCode.toUpperCase());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                bottom: displayHeight(context) * 0.03,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(ld.value[index].bgImageUrl),
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
                                ld.value[0].languageCode) {
                              index = 0;
                            } else if (newValue.toString().toLowerCase() ==
                                ld.value[1].languageCode) {
                              index = 1;
                            } else {
                              index = 0;
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
                    child: CachedNetworkImage(
                      imageUrl: ld.value[index].logoImageUrl,
                      placeholder: (context, url) =>
                          centerProgressBar(radius: 20, dotRadius: 6),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(displayWidth(context) * 0.05, 0,
                        displayWidth(context) * 0.05, 0),
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
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  ld.value[index].emailText,
                                  style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.05,
                                    fontFamily: 'Kipling_Regular',
                                  ),
                                ),
                              ),
                              buildtextfields(
                                  hint: ld.value[index].emailPlaceholderText,
                                  controller: emailController,
                                  context: context),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0,
                                    displayHeight(context) * 0.02,
                                    0,
                                    displayHeight(context) * 0.01),
                                child: Text(
                                  ld.value[index].passwordText,
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ),
                              buildtextfields(
                                  hint: ld.value[index].passwordPlaceholderText,
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PersonalDetails(
                                            ld: widget.personalDetailData,
                                          )));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF2d2c2e),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0)),
                            ),
                            child: Text(
                              ld.value[index].logInButtonText,
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
                                ld.value[index].forgotPasswordText,
                                style: TextStyle(
                                  fontSize: displayWidth(context) * 0.05,
                                  color: Color(0xff91b557),
                                  fontFamily: 'Kipling_Regular',
                                ),
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen())),
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
                                ld.value[index].registerText,
                                style: TextStyle(
                                    fontSize: displayWidth(context) * 0.045,
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
                                            builder: (context) => CreateAccount(
                                                createAccountModel: widget
                                                    .createAccountModel))),
                                    child: Text(
                                      ld.value[index].registerLinkText,
                                      style: TextStyle(
                                          fontSize:
                                              displayWidth(context) * 0.045,
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
        ));
  }
}