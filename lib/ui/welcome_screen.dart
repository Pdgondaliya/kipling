import 'package:flutter/material.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/custom_widget/bottom_navigation.dart';
import 'package:kipling/custom_widget/internet_dialog.dart';
import 'package:kipling/helper/shared_prefs.dart';
import 'package:kipling/main.dart';
import 'package:kipling/module/welcome_model.dart';
import 'package:kipling/ui/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  WelComeScreenModel? ld;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String? firstName;
  String? lastName;

  @override
  void initState() {
    super.initState();
    print('welcomeData: $welcomeData');
    ld = welcomeData;
    getUserName();
  }

  getUserName() {
    Shared_Preferences.prefGetString(Shared_Preferences.firstName, '')
        .then((firstname) {
      setState(() {
        firstName = firstname;
      });
      print('Firstname: $firstName');
    });
    Shared_Preferences.prefGetString(Shared_Preferences.lastName, '')
        .then((lastname) {
      setState(() {
        lastName = lastname;
      });
      print('Lastname: $lastName');
    });
  }

  @override
  Widget build(BuildContext context) {
    internetCheck(context);
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                height: displayHeight(context) * 0.25,
                width: displayWidth(context),
              ),
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
                        setState(() {
                          dropdownvalue = newValue!;
                          if (dropdownvalue == 'EN') {
                            index = 0;
                            print('Index0: $index');
                            dropdownvalue = newValue;
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
            ],
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.08),
            child: Column(
              children: [
                Text(
                  index == 0
                      ? ld!.value!.titleTextEn.toString()
                      : ld!.value!.titleTextNl.toString(),
                  style: TextStyle(
                      fontFamily: 'Kipling_Bold',
                      color: Color(0xFF88b14a),
                      fontSize: displayWidth(context) * 0.06),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: displayHeight(context) * 0.02),
                Container(
                  height: displayWidth(context) * 0.25,
                  width: displayWidth(context) * 0.25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              ld!.value!.profileImagePlaceholderUrl.toString()),
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: displayHeight(context) * 0.02),
                Text(
                  '$firstName $lastName',
                  style: TextStyle(
                      fontFamily: 'Kipling_Bold',
                      color: Colors.black,
                      fontSize: displayWidth(context) * 0.06),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: displayHeight(context) * 0.02),
                Text(
                  index == 0
                      ? ld!.value!.descriptionTextEn.toString()
                      : ld!.value!.descriptionTextNl.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: displayWidth(context) * 0.05,
                    fontFamily: 'Kipling_Regular',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: displayHeight(context) * 0.025),
                Text(
                  index == 0
                      ? ld!.value!.rewardTextEn.toString()
                      : ld!.value!.rewardTextNl.toString(),
                  style: TextStyle(
                      fontFamily: 'Kipling_Bold',
                      color: Color(0xFF88b14a),
                      fontSize: displayWidth(context) * 0.06),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: displayWidth(context) * 0.03,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: displayHeight(context) * 0.07,
                      margin:
                          EdgeInsets.only(top: displayHeight(context) * 0.03),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavigation(
                                      index: 2, ) /*login_screen()*/));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)),
                        ),
                        child: Text(
                          index == 0
                              ? ld!.value!.ctaButtonTextEn.toString()
                              : ld!.value!.ctaButtonTextNl.toString(),
                          style: TextStyle(
                              fontSize: displayWidth(context) * 0.05,
                              color: Colors.white,
                              fontFamily: 'Kipling_Regular'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
