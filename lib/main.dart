import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kipling/Loader/color_loader_3.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/module/badge_model.dart' as b;
import 'package:kipling/module/country_model.dart' as c;
import 'package:kipling/module/create_account_model.dart' as ca;
import 'package:kipling/module/forgot_password_confirmation_model.dart';
import 'package:kipling/module/forgot_password_model.dart';
import 'package:kipling/module/login_data.dart';
import 'package:kipling/module/personal_details_data.dart';
import 'package:kipling/module/splash_data.dart';
import 'package:http/http.dart' as http;
import 'package:kipling/module/welcome_model.dart';
import 'package:kipling/ui/login_screen.dart';
import 'Database/db_data.dart';
import 'Database/db_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kipling',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<b.BadgeData>? badgeData;
Future<c.CountryPickerModel>? futureCountryPickerDataAlbum;
late Future<PersonalDetailData> futurePersonDataAlbum;
Future<WelComeScreenModel>? futureWelComeScreenAlbum;
Future<ForgotPasswordModel>? futureForgotPasswordAlbum;
Future<ForgotPasswordConfirmationModel>? futureForgotPassworConfirmationAlbum;
late Future<Splashdata> futureAlbum;
late Future<ca.CreateAccountModel> futureCretaeAccountAlbum;

List<b.BadgeData>? badgeDetailsData;
List<c.Value>? countryList;
List<WelComeScreenModel>? welComeScreenList;
List<ForgotPasswordModel>? forgotPasswordList;
List<ForgotPasswordConfirmationModel>? forgotPasswordConfirmationList;

PersonalDetailData? personalDetailData;
WelComeScreenModel? welcomeData;
ForgotPasswordModel? forgotPasswordData;
ForgotPasswordConfirmationModel? forgotPasswordConfirmationData;

List<b.Content>? contents;
List<Todo> personalDataList = [];
List<PersonalDetailData> personalList = [];
List<b.FinalBadgeModel> finalActivatedBadgeModel = [];
List<b.FinalBadgeModel> finalBadgeModel = [];
List<WelComeScreenModel> welcomeModel = [];
List<ForgotPasswordModel> forgotPasswordModel = [];
List<ForgotPasswordConfirmationModel> forgotPasswordConfirmationModel = [];
Logindata? logindata;
c.CountryPickerModel? countryPickerData;
ca.CreateAccountModel? createAccountData;
List<Todo> taskList = [];
List<Logindata> profileList = [];
List<ca.CreateAccountModel> createAccountList = [];

class _MyHomePageState extends State<MyHomePage> {
  late Timer _timer;

  // List<b.BadgeData>? badgeData1;
  @override
  void initState() {
    super.initState();
    fetchapi();
    futureAlbum = fetchAlbum();
    futurePersonDataAlbum = fetchPersonData();
    futureCretaeAccountAlbum = fetchCreateAccountData();
    futureCountryPickerDataAlbum = fetchCountryListData();
    futureForgotPasswordAlbum = fetchForgotPasswordData();
    futureForgotPassworConfirmationAlbum = fetchForgotPasswordConfirmationData();
    futureWelComeScreenAlbum = fetchWelComeData();
    badgeData = fetchBadgeData();
    print("initState");
  }

  fetchapi() async {
    var allScreenData = await http.get(
      Uri.parse('https://cms-mobile-app-staging.loyalty-cloud.com/pages'),
      headers: {"token": "92902de1-9b9a-4dd3-817a-21100b21648f"},
    );
    final responseJsonAll = jsonDecode(allScreenData.body);
    int check = await DatabaseHelper.instance.tableIsEmpty() as int;
    bool checktable =
        await DatabaseHelper.instance.databaseExists("kipling.db");
    if (check <= 0) {
      var insert = await DatabaseHelper.instance
          .insert(Todo(jsonString: allScreenData.body, id: 1));
      print("insert");
      updatedata();
    } else {
      var update = await DatabaseHelper.instance
          .update(Todo(jsonString: allScreenData.body, id: 1));
      print("udpate");

      updatedata();
    }
  }

//api calling
  Future<Splashdata> fetchAlbum() async {
    var response = await http.get(
      Uri.parse(
          'https://cms-mobile-app-staging.loyalty-cloud.com/pages?name=splash'),
      headers: {"token": "92902de1-9b9a-4dd3-817a-21100b21648f"},
    );

    final responseJson = jsonDecode(response.body);
    print("Splash:responseJson");
    print(responseJson);
    if (response.statusCode == 200) {
      _timer = Timer.periodic(Duration(seconds: 5), (timer) {
        print("Login Data --->" + logindata.toString());
        print("Personal Data --->" + personalDetailData.toString());
        if (logindata != null &&
            personalDetailData != null /*&&
            createAccountData != null*/) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => login_screen(
                        // ld: logindata,
                        // personalDetailData: personalDetailData,
                        // createAccountModel: createAccountData,
                      )));
          _timer.cancel();
        }
      });
      return Splashdata.fromJson(responseJson[0]);
    } else {
      throw Exception('Failed to load album');
    }
  }

  //createAccount API
  Future<ca.CreateAccountModel> fetchCreateAccountData() async {
    var response = await http.get(
      Uri.parse(
          'https://cms-mobile-app-staging.loyalty-cloud.com/pages?name=sign_up'),
      headers: {"token": "92902de1-9b9a-4dd3-817a-21100b21648f"},
    );

    final responseJson = jsonDecode(response.body);
    print("createAccount:responseJson");
    print(responseJson);
    if (response.statusCode == 200) {
      setState(() {
        createAccountData = ca.CreateAccountModel.fromJson(responseJson[0]);
      });

      return ca.CreateAccountModel.fromJson(responseJson[0]);
    } else {
      throw Exception('Failed to load album');
    }
  }

  //ForgotPassword API
  Future<ForgotPasswordModel> fetchForgotPasswordData() async {
    var response = await http.get(
      Uri.parse(
          'https://cms-mobile-app-staging.loyalty-cloud.com/pages?name=forgot_password'),
      headers: {"token": "92902de1-9b9a-4dd3-817a-21100b21648f"},
    );

    final responseJson = jsonDecode(response.body);
    print("forgotPassword:responseJson");
    print(responseJson);
    if (response.statusCode == 200) {
      setState(() {
        forgotPasswordData = ForgotPasswordModel.fromJson(responseJson[0]);
      });

      return ForgotPasswordModel.fromJson(responseJson[0]);
    } else {
      throw Exception('Failed to load album');
    }
  }

  //ForgotPasswordConfirmation API
  Future<ForgotPasswordConfirmationModel> fetchForgotPasswordConfirmationData() async {
    var response = await http.get(
      Uri.parse(
          'https://cms-mobile-app-staging.loyalty-cloud.com/pages?name=forgot_password_confirmation'),
      headers: {"token": "92902de1-9b9a-4dd3-817a-21100b21648f"},
    );

    final responseJson = jsonDecode(response.body);
    print("forgotPasswordConfirmation:responseJson");
    print(responseJson);
    if (response.statusCode == 200) {
      setState(() {
        forgotPasswordConfirmationData = ForgotPasswordConfirmationModel.fromJson(responseJson[0]);
      });

      return ForgotPasswordConfirmationModel.fromJson(responseJson[0]);
    } else {
      throw Exception('Failed to load album');
    }
  }


  //Welcome API
  Future<WelComeScreenModel> fetchWelComeData() async {
    var response = await http.get(
      Uri.parse(
          'https://cms-mobile-app-staging.loyalty-cloud.com/pages?name=welcome'),
      headers: {"token": "92902de1-9b9a-4dd3-817a-21100b21648f"},
    );

    final responseJson = jsonDecode(response.body);
    print("welcomeScreen:responseJson");
    print(responseJson);
    if (response.statusCode == 200) {
      setState(() {
        welcomeData = WelComeScreenModel.fromJson(responseJson[0]);
      });


      return WelComeScreenModel.fromJson(responseJson[0]);
    } else {
      throw Exception('Failed to load album');
    }
  }

  //personalData API
  Future<PersonalDetailData> fetchPersonData() async {
    var response = await http.get(
      Uri.parse(
          'https://cms-mobile-app-staging.loyalty-cloud.com/pages?name=my_details'),
      headers: {"token": "92902de1-9b9a-4dd3-817a-21100b21648f"},
    );

    final responseJson = jsonDecode(response.body);
    print("personaldetail:responseJson");
    print(responseJson);
    if (response.statusCode == 200) {
      setState(() {
        personalDetailData = PersonalDetailData.fromJson(responseJson[0]);
      });

      // personalDataList.add(Todo(id: element['id'], jsonString: element['jsonString']));

      return PersonalDetailData.fromJson(responseJson[0]);
    } else {
      throw Exception('Failed to load album');
    }
  }

  //countryList API
  Future<c.CountryPickerModel> fetchCountryListData() async {
    var response = await http.get(
      Uri.parse(
          'https://cms-mobile-app-staging.loyalty-cloud.com/pages?name=iso_country_codes'),
      headers: {"token": "92902de1-9b9a-4dd3-817a-21100b21648f"},
    );

    final responseJson = jsonDecode(response.body);
    print("CountryPickerModel:responseJson");
    print(responseJson);
    if (response.statusCode == 200) {
      setState(() {
        countryPickerData = c.CountryPickerModel.fromJson(responseJson[0]);
        countryList = countryPickerData!.value;
      });

      // personalDataList.add(Todo(id: element['id'], jsonString: element['jsonString']));

      return c.CountryPickerModel.fromJson(responseJson[0]);
    } else {
      throw Exception('Failed to load album');
    }
  }

  //Badge Screen data API
  Future<b.BadgeData> fetchBadgeData() async {
    var response = await http.get(
      Uri.parse(
          'https://cms-mobile-app-staging.loyalty-cloud.com/voucher-settings?voucher_template.type=2&voucher_template.active=true'),
      headers: {"token": "92902de1-9b9a-4dd3-817a-21100b21648f"},
    );

    final responseJson =
        json.decode(response.body) /*jsonDecode(response.body)*/;
    print("badgeData:responseJson");
    print(responseJson);
    print('Status Code: ${response.statusCode}');
    if (response.statusCode == 200) {
      print('ififififififi');
      setState(() {
        print('badgeDAtaVaraDat: ${response.body}');
        badgeDetailsData = List<b.BadgeData>.from(
            responseJson.map((x) => b.BadgeData.fromJson(x)));
        for (int i = 0; i < badgeDetailsData!.length; i++) {
          contents = badgeDetailsData![i].contents;
          for (int j = 0; j < badgeDetailsData![i].contents!.length; j++) {
            if (badgeDetailsData![i].contents![j].state == 'Activated') {
              print('shdfbhjbdfjbdsjfjsdbfhjdsbfjbdsfjbdfjbdfj');
              finalActivatedBadgeModel!.add(b.FinalBadgeModel(
                  point_needed: badgeDetailsData![i]
                      .voucherTemplate!
                      .pointsNeeded
                      .toString(),
                  title: badgeDetailsData![i].contents![j].title.toString(),
                  description:
                      badgeDetailsData![i].contents![j].description.toString(),
                  condition:
                      badgeDetailsData![i].contents![j].conditions.toString(),
                  url: badgeDetailsData![i]
                      .contents![j]
                      .images![0]
                      .url
                      .toString()));
            }
            finalBadgeModel.add(b.FinalBadgeModel(
                point_needed: badgeDetailsData![i]
                    .voucherTemplate!
                    .pointsNeeded
                    .toString(),
                title: badgeDetailsData![i].contents![j].title.toString(),
                description:
                    badgeDetailsData![i].contents![j].description.toString(),
                condition:
                    badgeDetailsData![i].contents![j].conditions.toString(),
                url: badgeDetailsData![i]
                    .contents![j]
                    .images![0]
                    .url
                    .toString()));
          }
        }
        print('badgeDAtadfrgrgVaraDat: ${badgeDetailsData![0].id}');
      });

      return b.BadgeData.fromJson(responseJson[0]);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Stack(
        children: [
          Image.asset(
            'assets/images/splash_background.jpg',
            fit: BoxFit.cover,
            width: displayWidth(context),
            height: displayHeight(context),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: displayHeight(context) * 0.05,
            ),
            child: Center(
              child: Image.asset(
                'assets/images/logo_white.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      )
      //
      //     FutureBuilder<Splashdata>(
      //   future: futureAlbum,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return _buildPosts(snapshot.data!.value.bgImageUrl,
      //           snapshot.data!.value.logoImageUrl);
      //     } else if (snapshot.hasError) {
      //       return SnackBar(
      //         margin: EdgeInsets.only(bottom: displayHeight(context) * 0.02),
      //         duration: Duration(seconds: 2),
      //         content: const Text('Something went wrong'),
      //       );
      //     }
      //     // By default, show a loading spinner.
      //     // return centerProgressBar(radius: 40, dotRadius: 12);
      //     return Center(
      //       child: Container(
      //         margin: EdgeInsets.symmetric(
      //           horizontal: displayHeight(context) * 0.05,
      //         ),
      //         child: Image.asset(
      //           'assets/images/splash_logo.png',
      //           color: Colors.black,
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }

  void updatedata() {
    print("updatedata");
    DatabaseHelper.instance.queryAllRows().then((value) {
      setState(() {
        value.forEach((element) {
          taskList
              .add(Todo(id: element['id'], jsonString: element["jsonString"]));
          personalDataList
              .add(Todo(id: element['id'], jsonString: element['jsonString']));
          print("adding");
          print(taskList[0].jsonString);
          print('adding=======');
          var map = jsonEncode(taskList[0].jsonString);
          var map1 = jsonEncode(personalDataList[0].jsonString);
          print("map");
          print("$map");
          print("map1");
          print("$map1");
          final responseJson = jsonDecode(taskList[0].jsonString);
          print("$responseJson");
          for (var i = 0; i <= 3; i++) {
            print("Json:$i");
            if (responseJson[i]['name'] == 'login') {
              print("${responseJson[i]['value']}");
              logindata = Logindata.fromJson(responseJson[i]);
              print("Login:${logindata!.name}");
            }
          }
          final responseJson1 = jsonDecode(personalDataList[0].jsonString);
          print("$responseJson1");
          for (var i = 0; i <= 3; i++) {
            print("Json1:$i");
            if (responseJson1[i]['name'] == 'my_details') {
              print("${responseJson1[i]['value']}");
              personalList.add(PersonalDetailData.fromJson(responseJson1[i]));
              personalDetailData =
                  PersonalDetailData.fromJson(responseJson1[i]);
              print("personalDetailData: ${personalDetailData!.name}");
            }
          }
        });
      });
    }).catchError((error) {
      print(error);
    });
  }
}

//api calling
Widget _buildPosts(String bg_url, String center_url) {
  return Container(
      child: Stack(
    children: <Widget>[
      Positioned.fill(
          child: CachedNetworkImage(
        imageUrl: bg_url,
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, progress) {
          return Center(
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: displayHeight(context) * 0.05),
                child: Image.asset('assets/images/splash_logo.png',
                    color: Colors.black)),
          );
        },
        // placeholder: (context, url) =>
        //     centerProgressBar(radius: 40, dotRadius: 12),
      )),
      Center(
        child: Padding(
            padding: const EdgeInsets.all(60),
            child: Image.network(center_url)),
      )
    ],
  ));
}

// Calling loader
Widget centerProgressBar({required double radius, required double dotRadius}) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ColorLoader3(
        dotRadius: dotRadius,
        radius: radius,
      )
    ],
  ));
}
