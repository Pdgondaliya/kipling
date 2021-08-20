import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/custom_widget/internet_dialog.dart';
import 'package:kipling/main.dart';
import 'package:kipling/module/voucher_model.dart';
import 'package:kipling/module/voucher_reward_model.dart';
import 'package:kipling/ui/active_voucher_screen.dart';
import 'package:kipling/ui/login_screen.dart';
import 'package:kipling/ui/offer_just_for_you_voucher.dart';

class Voucher extends StatefulWidget {
  @override
  _VoucherState createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  VoucherModel? ld;

  Dio _dio = Dio();

  Future<VoucherRewardModel> voucherRewardAPI(String rewardTemplateID) async {
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl: 'https://cms-mobile-app-staging.loyalty-cloud.com/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.get(
          "voucher-contents?voucher_language.code=en&state=Activated&reward_template_id_in=$rewardTemplateID");
      return VoucherRewardModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        var errorData = jsonDecode(e.response.toString());
        var errorMessage = errorData["message"];
        throw Exception(errorMessage);
      } else {
        throw SocketException("");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    ld = voucherData;
  }

  @override
  Widget build(BuildContext context) {
    internetCheck(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              index == 0
                  ? ld!.value!.titleTextEn.toString()
                  : ld!.value!.titleTextNl.toString(),
              style: TextStyle(
                  color: Color(0xff0f0e0e), fontFamily: 'Kipling_Bold'),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Color(0xff9f9e9f),
              unselectedLabelStyle: TextStyle(
                  fontSize: displayWidth(context) * 0.05,
                  color: Color(0xff9f9e9f),
                  fontFamily: 'Kipling_Regular'),
              labelStyle: TextStyle(
                  fontSize: displayWidth(context) * 0.05,
                  color: Colors.black,
                  fontFamily: 'Kipling_Regular'),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Color(0xff8ab250), width: 5),
              ),
              tabs: [
                Tab(
                  child: Text(index == 0
                      ? ld!.value!.offerVouchersTextEn.toString()
                      : ld!.value!.offerVouchersTextNl.toString()),
                ),
                Tab(
                  child: Text(index == 0
                      ? ld!.value!.activatedVouchersTextEn.toString()
                      : ld!.value!.activatedVouchersTextNl.toString()),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [OfferJustForYouVoucherScreen(), ActiveVoucherScreen()],
          ),
        ));
  }
}
