import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future? internetCheck(BuildContext context) {
  try {
    InternetAddress.lookup('google.com').then((result) {
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      } else {
        _showDialog(context); // show dialog
      }
    }).catchError((error) {
      // _showDialog(context); // show dialog
    });
  } on SocketException catch (_) {
    _showDialog(context);
    print('not connected'); // show dialog
  }
}

void _showDialog(BuildContext context) {
  // dialog implementation
  showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            title: Text('Internet is connect!!'),
            actions: [
              FlatButton(
                  onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                  child: Text('Okay'))
            ],
          ));
}
