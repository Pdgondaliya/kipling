import 'package:flutter/material.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/custom_widget/internet_dialog.dart';
import 'package:kipling/main.dart';
import 'package:kipling/module/forgot_password_confirmation_model.dart';
import 'package:kipling/ui/login_screen.dart';

class ForgotPasswordConfirmation extends StatefulWidget {
  String? email;

  ForgotPasswordConfirmation({this.email});

  @override
  _ForgotPasswordConfirmationState createState() =>
      _ForgotPasswordConfirmationState();
}

class _ForgotPasswordConfirmationState
    extends State<ForgotPasswordConfirmation> {
  // String dropdownvalue = 'EN';
  ForgotPasswordConfirmationModel? ld;

  @override
  void initState() {
    super.initState();
    ld = forgotPasswordConfirmationData;
  }

  @override
  Widget build(BuildContext context) {
    internetCheck(context);
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
                      vertical: displayWidth(context) * 0.09),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.greenAccent),
                      SizedBox(width: displayWidth(context) * 0.02),
                      Text(
                        widget.email.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: displayWidth(context) * 0.04,
                          fontFamily: 'Kipling_Regular',
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: displayHeight(context) * 0.07,
                  margin: EdgeInsets.only(top: displayHeight(context) * 0.01),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => login_screen())),
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
              ])),
    );
  }
}
