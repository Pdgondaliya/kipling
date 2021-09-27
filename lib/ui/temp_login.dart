import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:simple_gravatar/simple_gravatar.dart';

class TempLogin extends StatefulWidget {
  @override
  _TempLoginState createState() => _TempLoginState();
}
final FlutterAppAuth appAuth = FlutterAppAuth();
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

// const String FUSION_AUTH_DOMAIN = '1a5321098cb0.ngrok.io';
// const String FUSION_AUTH_CLIENT_ID = 'b38a65fc-9e3e-45b7-9ee0-54bf243ce029';
// const String FUSION_AUTH_REDIRECT_URI = 'com.example.kipling://login-callback'/*'https://com.example.kipling/connect/fusionauth/callback'*//*'https://grant.outofindex.com/connect/fusionauth/callback'*/;
// const String FUSION_AUTH_ISSUER = 'https://grant.outofindex.com';

// final FlutterAppAuth appAuth = FlutterAppAuth();
// const FlutterSecureStorage secureStorage = FlutterSecureStorage();
//
// const String FUSION_AUTH_DOMAIN = '1a5321098cb0.ngrok.io';
// const String FUSION_AUTH_CLIENT_ID = 'b38a65fc-9e3e-45b7-9ee0-54bf243ce029';
// const String FUSION_AUTH_REDIRECT_URI = 'com.example.kipling://login-callback';
// const String FUSION_AUTH_ISSUER = 'https://$FUSION_AUTH_DOMAIN';

const String FUSION_AUTH_DOMAIN = 'auth-mobile-app-staging.loyalty-cloud.com';
const String FUSION_AUTH_CLIENT_ID = 'b38a65fc-9e3e-45b7-9ee0-54bf243ce029';
const String FUSION_AUTH_REDIRECT_URI =
    'com.example.kipling://login-callback';
const String FUSION_AUTH_ISSUER = 'https://$FUSION_AUTH_DOMAIN';

class _TempLoginState extends State<TempLogin> {

  bool isBusy = false;
  bool isLoggedIn = false;
  String errorMessage ='';
  String name ='';
  String picture ='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              await loginAction();
            },
            child: Container(
              color: Colors.black,
              height: 55,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
            ),
          )
        ],
      ),
    );
  }
  Future<Map<String, Object>> getUserDetails(String accessToken) async {
     String url = 'https://$FUSION_AUTH_DOMAIN/oauth2/userinfo';
    final http.Response response = await http.get(Uri.parse(url),
      headers: <String, String>{'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }
  Future<void> loginAction() async {
    setState(() {
      isBusy = true;
      errorMessage = '';
    });

    try {
      final AuthorizationTokenResponse? result =
      await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          FUSION_AUTH_CLIENT_ID,
          FUSION_AUTH_REDIRECT_URI,
          issuer: 'https://$FUSION_AUTH_DOMAIN',
          scopes: <String>['offline_access'],
        ),
      );
      print('data  ---->  : $result');
      final Map<String, Object> profile =
      await getUserDetails(result!.accessToken.toString());

      debugPrint('response: $profile');
      await secureStorage.write(
          key: 'refresh_token', value: result.refreshToken);
      var gravatar = Gravatar(profile['email'].toString());
      var url = gravatar.imageUrl(
        size: 100,
        defaultImage: GravatarImage.retro,
        rating: GravatarRating.pg,
        fileExtension: true,
      );
      setState(() {
        isBusy = false;
        isLoggedIn = true;
        name = profile['given_name'].toString();
        picture = url;
      });
    } on Exception catch (e, s) {
      debugPrint('login error: $e - stack: $s');
      setState(() {
        isBusy = false;
        isLoggedIn = false;
        errorMessage = e.toString();
      });
    }
  }

  Future<void> logoutAction() async {
    await secureStorage.delete(key: 'refresh_token');
    setState(() {
      isLoggedIn = false;
      isBusy = false;
    });
  }
}
