import 'package:flutter/material.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/main.dart';
import 'package:kipling/module/welcome_model.dart';
import 'package:kipling/ui/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  WelComeScreenModel? ld;
  String dropdownvalue = 'EN';
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print('welcomeData: $welcomeData');
    ld = welcomeData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [

              Container(
                height: displayHeight(context) * 0.2,
                width: displayWidth(context),
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage(
                //             'assets/images/slider_puffin_before_mobile.jpeg'),
                //         fit: BoxFit.cover)),
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
                            dropdownvalue = newValue!;
                          } else if (dropdownvalue == 'NL') {
                            index = 1;
                            print('Index1: $index');

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
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.08),
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
                          image: NetworkImage(ld!.value!.profileImagePlaceholderUrl.toString()),
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: displayHeight(context) * 0.02),
                Text(
                  'jurgen Derycke',
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
                  style: TextStyle(color: Colors.black, fontSize: displayWidth(context) * 0.04, fontFamily: 'Kipling_Regular',),
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
                      bottom: displayWidth(context) * 0.03,),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: displayHeight(context) * 0.07,
                      margin: EdgeInsets.only(top: displayHeight(context) * 0.03),
                      child: ElevatedButton(
                        onPressed: () {},
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
