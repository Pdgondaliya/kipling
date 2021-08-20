import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/custom_widget/internet_dialog.dart';
import 'package:kipling/module/particular_voucher_details.dart';
import 'package:kipling/module/voucher_model.dart';
import 'package:kipling/module/voucher_reward_model.dart';

class ActiveVoucherScreen extends StatefulWidget {
  @override
  _ActiveVoucherScreenState createState() => _ActiveVoucherScreenState();
}

class _ActiveVoucherScreenState extends State<ActiveVoucherScreen> {
  Dio _dio = Dio();

  List<CustomVoucherModel> customVoucherModelList = [];

  Future<VoucherRewardModel> activeVoucherAPI(String customerID) async {
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl:
            'https://api-mobile-app-staging.loyalty-cloud.com/v1/rewards-service/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.post("search/rewards", data: {
        "items_per_page": 20,
        "page": 1,
        "customer_id": "2e02fa86-f47e-4d24-8f2d-1833cfa9ad3c",
        "filter": {
          "conditions": [
            {"field_name": "type", "operator": "!=", "value": "BADGE"}
          ]
        }
      });
      return VoucherRewardModel.fromJson(response.data);
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

  Future<ParticularVoucherDetails> particularVoucherDetailsAPI(
      String templateId) async {
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl: 'https://cms-mobile-app-staging.loyalty-cloud.com/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.get(
        "voucher-contents?voucher_language.code=en&state=Activated&reward_template_id_in=$templateId",
      );
      return ParticularVoucherDetails.fromJson(response.data[0]);
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
    super.initState();
    activeVoucherAPI('2e02fa86-f47e-4d24-8f2d-1833cfa9ad3c').then((value) {
      print('Prntiptimkmf: ${value.items}');
      for (int i = 0; i < value.items!.length; i++) {
        particularVoucherDetailsAPI(value.items![i].rewardTemplateId.toString())
            .then((value1) {
          setState(() {
            customVoucherModelList.add(CustomVoucherModel(
                image: value1.images![0].formats!.small!.url.toString(),
                title: value.items![i].rewardTemplate!.name.toString(),
                subTitle:
                    value.items![i].rewardTemplate!.validityEndDate.toString(),
                point:
                    value.items![i].rewardTemplate!.pointsNeeded.toString()));
          });
        });
        print(
            'cisdhjfkjsdnfkjdsnfuidfkjlkdsmkds: ${customVoucherModelList.length}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    internetCheck(context);
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(
              top: displayWidth(context) * 0.05,
              right: displayWidth(context) * 0.08,
              left: displayWidth(context) * 0.08),
          child: customVoucherModelList.toString() != '[]'
              ? ListView.builder(
                  itemCount: customVoucherModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          height: displayWidth(context) * 0.6,
                          width: displayWidth(context),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      customVoucherModelList[index]
                                          .image
                                          .toString()),
                                  fit: BoxFit.cover)),
                          padding: EdgeInsets.only(
                              top: displayWidth(context) * 0.35),
                          alignment: Alignment.centerRight,
                          child: Container(
                            color: Color(0xff89b14b),
                            height: displayWidth(context) * 0.07,
                            width: displayWidth(context) * 0.2,
                            child: Center(
                              child: Text(
                                customVoucherModelList[index].point.toString() +
                                    'p',
                                style: TextStyle(
                                    fontFamily: 'Kipling_Regular',
                                    fontSize: displayWidth(context) * 0.04,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          customVoucherModelList[index].title != null
                              ? customVoucherModelList[index].title.toString()
                              : '',
                          style: TextStyle(
                              fontFamily: 'Kipling_Bold',
                              fontSize: displayWidth(context) * 0.05,
                              color: Colors.black),
                        ),
                        Text(customVoucherModelList[index].subTitle!.trim().toString() != 'null'
                            ?customVoucherModelList[index].subTitle.toString() : '',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: displayWidth(context) * 0.04,
                              fontFamily: 'Kipling_Regular'),
                        )
                      ],
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
