import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/module/all_voucher_details_model.dart';
import 'package:kipling/module/particular_voucher_details.dart';
import 'package:kipling/module/voucher_model.dart';

class OfferJustForYouVoucherScreen extends StatefulWidget {
  @override
  _OfferJustForYouVoucherScreenState createState() =>
      _OfferJustForYouVoucherScreenState();
}

class _OfferJustForYouVoucherScreenState
    extends State<OfferJustForYouVoucherScreen> {
  Dio _dio = Dio();

  List<CustomVoucherModel> customVoucherModelList = [];

  Future<AllVoucherDetailsModel> voucherRewardCommonAPI(String id) async {
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl: 'https://api-mobile-app-staging.loyalty-cloud.com/v1/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.get(
        "rewards-service/reward-templates/published?page=1&itemsPerPage=10&customerId=$id",
      );
      return AllVoucherDetailsModel.fromJson(response.data);
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
    voucherRewardCommonAPI('a4038a6b-bbf0-4c9e-9a97-6d7bc085e1c3')
        .then((value) {
      for (int i = 0; i < value.items!.length; i++) {
        print('Value: ${value.items![i].id}');
        particularVoucherDetailsAPI(value.items![i]!.id.toString())
            .then((value1) {
          print('jajjajajajajajaja');
          setState(() {
            customVoucherModelList.add(CustomVoucherModel(
                image: value1.images![0].formats!.small!.url.toString(),
                title: value.items![i].name.toString(),
                subTitle: value.items![i].validityEndDate.toString(),
                point: value.items![i].pointsNeeded.toString()));
            print('customList: ${customVoucherModelList!.length}');
            print('sdgsdf ${customVoucherModelList![0].image}');
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          ),
                          Text(
                            customVoucherModelList[index].title.toString() != 'null'
                                ? customVoucherModelList[index].title.toString()
                                : '',
                            style: TextStyle(
                                fontFamily: 'Kipling_Bold',
                                fontSize: displayWidth(context) * 0.05,
                                color: Colors.black),
                          ),
                          Text(
                            customVoucherModelList[index].subTitle!.trim().toString() != 'null'
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
                  )));
  }
}
