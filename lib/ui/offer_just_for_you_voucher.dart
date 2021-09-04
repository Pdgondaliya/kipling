import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kipling/Loader/color_loader_3.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/custom_widget/internet_dialog.dart';
import 'package:kipling/custom_widget/loader.dart';
import 'package:kipling/helper/shared_prefs.dart';
import 'package:kipling/module/all_voucher_details_model.dart';
import 'package:kipling/module/get_user_data.dart';
import 'package:kipling/module/particular_voucher_details.dart';
import 'package:kipling/module/voucher_model.dart';
import 'package:kipling/ui/voucher_details.dart';

class OfferJustForYouVoucherScreen extends StatefulWidget {
  @override
  _OfferJustForYouVoucherScreenState createState() =>
      _OfferJustForYouVoucherScreenState();
}

class _OfferJustForYouVoucherScreenState
    extends State<OfferJustForYouVoucherScreen> {
  Dio _dio = Dio();

  String? customerId;
  String? selectedTemplateId;

  List<CustomVoucherModel> customVoucherModelList = [];

  Future<GetUserDataModel> programIdentifierCallAPI(String id) async {
    // showLoader();
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl:
            'https://api-mobile-app-staging.loyalty-cloud.com/v1/customers-service/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.get("program-identifiers/$id");
      print('afdsfgdsgdfsgfgfgfg: ${response.data}');
      hideLoader();
      return GetUserDataModel.fromJson(response.data);
    } on DioError catch (e) {
      hideLoader();
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        // var errorMessage = errorData["message"];
        throw Exception(errorData);
      } else {
        hideLoader();
        var errorData = jsonDecode(e.response.toString());
        throw SocketException(errorData);
      }
    }
  }

  getCustomerId() {
    Shared_Preferences.prefGetString(Shared_Preferences.keyId, '').then((id) {
      print('ValueValue: $id');
      programIdentifierCallAPI(id!).then((ProgramIdentifier) {
        setState(() {
          customerId = ProgramIdentifier.balance!.customerId.toString();
          print('CustomerId: $customerId');
        });
        voucherRewardCommonAPI(ProgramIdentifier.balance!.customerId.toString())
            .then((voucherAPI) {
          for (int i = 0; i < voucherAPI.items!.length; i++) {
            print('Value: ${voucherAPI.items![i].id}');
            particularVoucherDetailsAPI(voucherAPI.items![i]!.id.toString())
                .then((pvDetails) {
              print('jajjajajajajajaja');
              setState(() {
                customVoucherModelList.add(CustomVoucherModel(
                    customerId: customerId,
                    rewardTemplateId: voucherAPI.items![i].id.toString(),
                    image: pvDetails.images![0].formats!.small!.url.toString(),
                    title: voucherAPI.items![i].name.toString(),
                    subTitle: voucherAPI.items![i].validityEndDate.toString(),
                    point: voucherAPI.items![i].pointsNeeded.toString(),
                    conditions: pvDetails.conditions.toString(),
                    description: pvDetails.description.toString()));
                print('customList: ${customVoucherModelList!.length}');
                print('sdgsdf ${customVoucherModelList![0].image}');
              });
            });
          }
        });
      });
    });
  }

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
    getCustomerId();
    /*  voucherRewardCommonAPI('9d6e27c8-eb6c-4571-9876-6b57c958872e')
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
                point: value.items![i].pointsNeeded.toString(),
                conditions: value1.conditions.toString(),
                description: value1.description.toString()));
            print('customList: ${customVoucherModelList!.length}');
            print('sdgsdf ${customVoucherModelList![0].image}');
          });
        });
      }
    });*/
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
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VoucherDetails(

                                      title: customVoucherModelList[index]
                                          .title
                                          .toString(),
                                      image: customVoucherModelList[index]
                                          .image
                                          .toString(),
                                      point: customVoucherModelList[index]
                                          .point
                                          .toString(),
                                      conditions: customVoucherModelList[index]
                                          .conditions
                                          .toString(),
                                      description: customVoucherModelList[index]
                                          .description
                                          .toString(),
                                      validity: customVoucherModelList[index]
                                                  .subTitle!
                                                  .trim()
                                                  .toString() !=
                                              'null'
                                          ? customVoucherModelList[index]
                                              .subTitle
                                              .toString()
                                          : '',
                                    ))),
                        child: Column(
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
                              customVoucherModelList[index].title.toString() !=
                                      'null'
                                  ? customVoucherModelList[index]
                                      .title
                                      .toString()
                                  : '',
                              style: TextStyle(
                                  fontFamily: 'Kipling_Bold',
                                  fontSize: displayWidth(context) * 0.05,
                                  color: Colors.black),
                            ),
                            Text(
                              customVoucherModelList[index]
                                          .subTitle!
                                          .trim()
                                          .toString() !=
                                      'null'
                                  ? customVoucherModelList[index]
                                      .subTitle
                                      .toString()
                                  : 'Offer until 7 Aug 2021',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: displayWidth(context) * 0.04,
                                  fontFamily: 'Kipling_Regular'),
                            )
                          ],
                        ),
                      );
                    })
                : Center(
                    child: ColorLoader3(
                      radius: 40,
                      dotRadius: 12,
                    ),
                  )));
  }
}
