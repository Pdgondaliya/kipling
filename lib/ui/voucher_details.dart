import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/custom_widget/internet_dialog.dart';
import 'package:kipling/custom_widget/loader.dart';
import 'package:kipling/helper/shared_prefs.dart';
import 'package:kipling/module/activated_button_model.dart';

class VoucherDetails extends StatefulWidget {
  String? title;
  String? image;
  String? description;
  String? point;
  String? conditions;
  String? validity;
  String? customerId;
  String? templateId;

  VoucherDetails(
      {this.title,
      this.image,
      this.point,
      this.conditions,
      this.description,
      this.validity,
      this.customerId,
      this.templateId});

  @override
  _VoucherDetailsState createState() => _VoucherDetailsState();
}

class _VoucherDetailsState extends State<VoucherDetails> {
  String pointRequired = '';

  ActivatedOfferButtonErrorResponse activatedOfferButtonErrorResponse =
      ActivatedOfferButtonErrorResponse();

  ActivatedOfferButtonResponse activatedOfferButtonResponse =
      ActivatedOfferButtonResponse();

  Dio _dio = Dio();

  getCustomerId() {
    Shared_Preferences.prefGetString(Shared_Preferences.keyId, '').then((id) {
      print('ValueValue: $id');
    });
  }

  Future activateVoucherButtonAPI(
      {String? customerId, String? rewardTemplateId}) async {
    showLoader();
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl: 'https://api-mobile-app-staging.loyalty-cloud.com/v1/',
        headers: headerMap);
    _dio.options = options;

    try {
      Response response = await _dio.post("rewards-service/rewards", data: {
        "customer_id": customerId,
        "reward_template_id": rewardTemplateId,
        "source": "mobile_app"
      });
      print('Status Code: ${response.statusCode}');
      if (response.statusCode == 400) {
        setState(() {
          activatedOfferButtonErrorResponse = response.data;
          print('error msg: $pointRequired');
          pointRequired = activatedOfferButtonErrorResponse.message.toString();
        });
        return ActivatedOfferButtonErrorResponse.fromJson(response.data);
      } else if (response.statusCode == 200) {
        setState(() {
          activatedOfferButtonResponse = response.data;
        });
        return ActivatedOfferButtonResponse.fromJson(response.data);
      }
      hideLoader();
      print('hkjsdfkjhfkjdshfkjhfkd: ${response.data}');
    } on DioError catch (e) {
      hideLoader();
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        // var errorMessage = errorData["message"];
        print('catch Error: ${jsonDecode(e.response.toString())}');
        if (e.response != null) {
          // print('catch Error: ${jsonDecode(e.response['message'].toString())}');
          activatedOfferButtonErrorResponse =
              ActivatedOfferButtonErrorResponse.fromJson(errorData);
          print(
              'catch Error: ${activatedOfferButtonErrorResponse.message.toString()}');
        }
        pointRequired = activatedOfferButtonErrorResponse.message.toString();
        setState(() {});
        /*  setState(() {
          activatedOfferButtonErrorResponse = errorData;
          print('kjfbkjdnfkjdsnfdfkjdsf: $activatedOfferButtonErrorResponse');

          pointRequired = activatedOfferButtonErrorResponse.message.toString();
          print('error msg: $pointRequired');
        });*/

        return activatedOfferButtonErrorResponse.message.toString();
      } else {
        hideLoader();
        var errorData = jsonDecode(e.response.toString());
        print('else error : ${errorData.toString()}');
        throw SocketException(errorData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    internetCheck(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.title.toString(),
          style: TextStyle(fontFamily: 'Kipling_Bold', color: Colors.black),
        ),
        actions: [
          Padding(padding: EdgeInsets.only(right: displayWidth(context) * 0.1))
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: displayWidth(context),
                height: displayWidth(context) * 0.50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: new NetworkImage(widget.image.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: displayWidth(context) * 0.05,
                    horizontal: displayWidth(context) * 0.15),
                child: Container(
                    width: displayWidth(context) - displayWidth(context) * 0.1,
                    height: displayWidth(context) * 0.50 -
                        displayWidth(context) * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(widget.image.toString()),
                            fit: BoxFit.cover)),
                    padding: EdgeInsets.only(
                        top: displayWidth(context) * 0.25,
                        right: displayWidth(context) * 0.019),
                    alignment: Alignment.centerRight,
                    child: Container(
                      color: Color(0xff89b14b),
                      height: displayWidth(context) * 0.07,
                      width: displayWidth(context) * 0.2,
                      child: Center(
                        child: Text(
                          widget.point.toString() + 'p',
                          style: TextStyle(
                              fontFamily: 'Kipling_Regular',
                              fontSize: displayWidth(context) * 0.04,
                              color: Colors.white),
                        ),
                      ),
                    ) /*Image.network(
                    widget.image.toString(),
                    fit: BoxFit.cover,
                  ),*/
                    ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                right: displayWidth(context) * 0.08,
                left: displayWidth(context) * 0.08,
                top: displayWidth(context) * 0.04,
                bottom: displayWidth(context) * 0.01),
            child: Text(
              widget.title.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Kipling_Bold',
                  fontSize: displayWidth(context) * 0.06),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: displayWidth(context) * 0.08,
              left: displayWidth(context) * 0.08,
            ),
            child: Html(
              data: widget.description.toString(),
              style: {
                "body": Style(
                    fontFamily: 'Kipling_Regular',
                    textAlign: TextAlign.center,
                    fontSize: FontSize.large),
              },
            ),
          ),
          pointRequired != ''
              ? Padding(
                  padding: EdgeInsets.only(
                      right: displayWidth(context) * 0.08,
                      left: displayWidth(context) * 0.08,
                      bottom: displayWidth(context) * 0.03),
                  child: Text(
                    pointRequired,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: displayWidth(context) * 0.04,
                        fontFamily: 'Kipling_Regular',
                        color: Color(0xff89b14b)),
                  ))
              : Padding(
                  padding: EdgeInsets.only(
                      right: displayWidth(context) * 0.2,
                      left: displayWidth(context) * 0.2,
                      bottom: displayWidth(context) * 0.03),
                  child: Container(
                    width: double.infinity,
                    height: displayHeight(context) * 0.07,
                    margin: EdgeInsets.only(top: displayHeight(context) * 0.03),
                    child: ElevatedButton(
                      onPressed: () => Platform.isAndroid
                          ? _showAndroidDialog()
                          : _showiOSDialog(),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF2d2c2e),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                      ),
                      child: Text(
                        'Activate with ' + widget.point.toString() + ' points',
                        style: TextStyle(
                          fontSize: displayWidth(context) * 0.04,
                          fontFamily: 'Kipling_Regular',
                          color: Color(0xfffcfdfd),
                        ),
                      ),
                    ),
                  ),
                ),
          Padding(
            padding: EdgeInsets.only(
                left: displayWidth(context) * 0.08,
                right: displayWidth(context) * 0.08,
                bottom: displayWidth(context) * 0.03),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.validity.toString() != ''
                    ? 'Offer until ' + widget.validity.toString()
                    : 'Offer until 31 December 2021',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: displayWidth(context) * 0.04,
                    fontFamily: 'Kipling_Regular',
                    color: Colors.grey.withOpacity(0.5)),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.08),
              child: Divider(
                color: Colors.grey.withOpacity(0.5),
              )),
          Padding(
            padding: EdgeInsets.only(
                top: displayWidth(context) * 0.03,
                right: displayWidth(context) * 0.08,
                left: displayWidth(context) * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CONDITION',
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                      fontFamily: 'Kipling_Regular',
                      fontSize: displayWidth(context) * 0.035),
                ),
                Html(
                  data: widget.conditions.toString(),
                  style: {
                    "body": Style(
                        fontFamily: 'Kipling_Regular',
                        textAlign: TextAlign.start,
                        fontSize: FontSize.medium),
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _showiOSDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Active this voucher',
              style: TextStyle(fontFamily: 'Kipling_Regular')),
          content: Text(
            'Do you want to activate this voucher? \nYour points will be deducted.',
            style: TextStyle(fontFamily: 'Kipling_Regular'),
          ),
          actions: <Widget>[
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
                'Activate',
                style: TextStyle(
                    fontFamily: 'Kipling_Regular', color: Color(0xff89b14b)),
              ),
              onPressed: () {
                activateVoucherButtonAPI(
                    customerId: widget.customerId,
                    rewardTemplateId: widget.templateId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _showAndroidDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Active this voucher',
              style: TextStyle(fontFamily: 'Kipling_Regular')),
          content: Text(
            'Do you want to activate this voucher? \nYour points will be deducted.',
            style: TextStyle(fontFamily: 'Kipling_Regular'),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Kipling_Regular'),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'Activate',
                style: TextStyle(
                    fontFamily: 'Kipling_Regular', color: Color(0xff89b14b)),
              ),
              onPressed: () {
                activateVoucherButtonAPI(
                    customerId: widget.customerId,
                    rewardTemplateId: widget.templateId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
