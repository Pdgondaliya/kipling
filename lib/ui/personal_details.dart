import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/custom_widget/internet_dialog.dart';
import 'package:kipling/custom_widget/loader.dart';
import 'package:kipling/custom_widget/text_field.dart';
import 'package:kipling/main.dart';
import 'package:kipling/module/get_user_data.dart';
import 'package:kipling/module/personal_details_data.dart';
import 'package:kipling/module/update_user_details_model.dart';
import 'package:kipling/module/upload_image_model.dart';
import 'package:kipling/ui/badge_screen.dart';
import 'package:kipling/ui/login_screen.dart';
import 'package:dio/dio.dart' as d;
import 'package:kipling/ui/voucher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalDetails extends StatefulWidget {
  // const PersonalDetails({this.ld});

  // final PersonalDetailData? ld;

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController additionController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController companyOptionalController = TextEditingController();

  bool isChecked = false;

  String selectedGender = '';

  String? countryCode;
  String? currentDate;
  String? dob;
  String? id;
  String? avatar_url;

  PersonalDetailData? ld;

  File? imageFile = File('');

  DateTime _chosenDateTime = DateTime.now();

  d.Dio dio = d.Dio();

  var items = [];

  String genderValue = 'Male';
  String countryValue = 'Afghanistan';
  String languageValue = 'Hindi';

  String? birthdate;

  Dio _dio = Dio();

  GetUserDataModel? getUserDataModel;

  Future<GetUserDataModel> getUserDataAPI(String id) async {
    showLoader();
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl:
            'https://api-mobile-app-staging.loyalty-cloud.com/v1/customers-service/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio.get("customers/$id");
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

  Future<UpdateUserDataModel> updateUserDataAPI({
    String? id,
    String? name,
    String? middleName,
    String? lastName,
    String? gender,
    String? birthdate,
    String? countryCode,
    bool? option,
    bool? generalPermission,
    String? languageCode,
    String? currentDate,
    String? email,
    String? mobileNumber,
    String? streetName,
    String? addition,
    String? houseNumber,
    String? postalCode,
    String? state,
    String? city,
    String? avatarUrl,
  }) async {
    showLoader();
    var headerMap = {"token": '92902de1-9b9a-4dd3-817a-21100b21648f'};
    var options = BaseOptions(
        baseUrl:
            'https://api-mobile-app-staging.loyalty-cloud.com/v1/customers-service/',
        headers: headerMap);
    _dio.options = options;
    try {
      Response response = await _dio
          .put("customers/fc83716b-5768-48f4-b80a-25c64b844014", data: {
        "id": "fc83716b-5768-48f4-b80a-25c64b844014",
        "title": "Mr.",
        "initials": "",
        "name": name,
        "middle_name": middleName,
        "last_name": lastName,
        "gender": "",
        "birth_date": birthdate,
        "birth_place": "",
        "country_code": "",
        "language_code": "en",
        "tier": "",
        "optin": false,
        "general_permission": true,
        "balance": {
          "id": "f72739ab-d8d0-4474-b972-5a9639f6757e",
          "customer_id": "fc83716b-5768-48f4-b80a-25c64b844014",
          "points": 0,
          "previous_points": 0,
          "total_positive_points": 0,
          "total_negative_points": 0,
          "total_event_positive_points": 0,
          "total_event_negative_points": 0,
          "total_manual_positive_points": 0,
          "total_manual_negative_points": 0,
          "total_reward_positive_points": 0,
          "total_reward_negative_points": 0,
          "updated_at": currentDate,
          "balance_updates": []
        },
        "emails": [
          {
            "id": "6493e5d9-de3c-4335-8d87-e975aea055b6",
            "type": "",
            "email_address": email,
            "verified": false,
            "primary": true,
            "created_at": currentDate,
            "updated_at": currentDate
          }
        ],
        "phone_numbers": [],
        "addresses": [],
        "subscriptions": [],
        "avatar_url": avatarUrl,
        "external_identifiers": [],
        "tags": [],
        "integer_custom_fields": [],
        "string_custom_fields": [],
        "boolean_custom_fields": [],
        "date_time_custom_fields": [],
        "float_custom_fields": [],
        "created_at": currentDate,
        "updated_at": currentDate,
        "is_deleted": false,
        "deleted_at": null,
        "transaction_count": 0
      });
      hideLoader();
      print('hkjsdfkjhfkjdshfkjhfkd: ${response.data}');
      return UpdateUserDataModel.fromJson(response.data);
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

  Future getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print('id: ${preferences.getString('id')}');

    DateTime today = DateTime.now();

    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String date = formatter.format(today);

    DateFormat time = DateFormat('hh:mm:ss');
    String timeFormat = time.format(today);

    print('Date =============> ${date}T${timeFormat}Z');

    currentDate = '${date}T${timeFormat}Z';
    // id = preferences.getString('id');
    return preferences.getString('id');
  }

  Future<UploadImageModel?> uploadImage() async {
    showLoader();
    try {
      d.Response response;

      d.FormData formData = d.FormData();
      formData!.files.add(
        MapEntry("files", await d.MultipartFile.fromFile(imageFile!.path)),
      );

      response = await dio.post(
          'https://cms-mobile-app-staging.loyalty-cloud.com/upload',
          options: d.Options(headers: {
            "content-type": 'application/json',
            'token': '92902de1-9b9a-4dd3-817a-21100b21648f'
          }),
          data: formData);
      hideLoader();
      print('response --------> ${response.toString()}');
      if (response == null) {
        print('response ---null-----> ${response.statusMessage.toString()}');
        return UploadImageModel.fromJson(response.data);
      } else if (response.statusCode == 200) {
        print(
            'response.statusMessage --------> ${response.statusMessage.toString()}');
      } else {
        print('12345555556 ------>${response.statusMessage.toString()}');
        print('22222222 ------>${response.statusCode.toString()}');
        return throw new Exception(response.data);
      }
      return UploadImageModel.fromJson(response.data[0]);
    } on d.DioError catch (e) {
      hideLoader();
      print('12345555556');
      print(e);
// throw handleError(e);
    }
  }

  @override
  void initState() {
    print('Value List: ${countryList.toString()}');
    ld = personalDetailData;
    getData().then((value1) {
      getUserDataAPI('fc83716b-5768-48f4-b80a-25c64b844014').then((value) {
        if (!mounted) return;
        setState(() {
          firstNameController.text =
              value.name!.toString().isNotEmpty ? value.name.toString() : '';
          middleNameController.text = value.middleName!.toString().isNotEmpty
              ? value.middleName.toString()
              : '';
          lastNameController.text = value.lastName!.toString().isNotEmpty
              ? value.lastName.toString()
              : '';
          birthDayController.text = value.birthDate
                      .toString()
                      .substring(0, 11)
                      .trim()
                      .toString()
                      .isNotEmpty ||
                  value.birthDate
                          .toString()
                          .substring(0, 11)
                          .trim()
                          .toString()
                          .trim() !=
                      'null'
              /*||
                  value.birthDate != null*/
              ? value.birthDate.toString().substring(0, 11)
              : '';
          emailController.text =
              value.emails!.first.emailAddress.toString().isNotEmpty
                  ? value.emails!.first.emailAddress.toString()
                  : '';
          avatar_url = value.avatarUrl.toString().isNotEmpty
              ? value.avatarUrl.toString()
              : '';
          print('Image Avata123: ${value.avatarUrl.toString()}');
          print('Image Avatar234: ${imageFile!.path}');
          print(
              'Image Avatar123: ${ld!.value!.profilePicturePlaceholderUrlEn.toString()}');
          // phoneNumberController.text = value.phoneNumbers.toString() !=
          //         '[]' /* || value.phoneNumbers![0].number.toString().isNotEmpty*/
          //
          //     ? value.phoneNumbers![0].number!.toString()
          //     : '';
          // streetNameController.text =
          //     /*value.addresses![0].addressLine1.toString().isNotEmpty ||*/
          //     value.addresses.toString() != '[]'
          //         ? value.addresses![0].addressLine1.toString()
          //         : '';
          // additionController.text =
          //     /* value.addresses![0].addressLine2.toString().isNotEmpty ||*/
          //     value.addresses.toString() != '[]'
          //         ? value.addresses![0].addressLine2.toString()
          //         : '';
          // houseNumberController.text =
          //     /*value.addresses![0].houseNumber.toString().isNotEmpty ||*/
          //     value.addresses.toString() != '[]'
          //         ? value.addresses![0].houseNumber.toString()
          //         : '';
          // postalCodeController.text =
          //     /*value.addresses![0].postalCode.toString().isNotEmpty ||*/
          //     value.addresses.toString() != '[]'
          //         ? value.addresses![0].postalCode.toString()
          //         : '';
          // regionController.text =
          //     /*value.addresses![0].state.toString().isNotEmpty ||*/
          //     value.addresses.toString() != '[]'
          //         ? value.addresses![0].state.toString()
          //         : '';
          // cityController.text =
          //     /*value.addresses![0].city.toString().isNotEmpty ||*/
          //     value.addresses.toString() != '[]'
          //         ? value.addresses![0].city.toString()
          //         : '';
// print('BirthDate Controller Text = ${birthDayController.text}');
//           DateTime dateOfBirth = DateTime.parse(birthDayController.text);
//
//           DateFormat dobFormat = DateFormat('yyyy-MM-dd');
//           birthdate = dobFormat.format(dateOfBirth) + 'T00:00:00Z';
//           print('bibibibibibib: ${birthdate}');
//           birthdate = value.birthDate.toString();
          birthdate = '${birthDayController.text.toString().trim()}T00:00:00Z';
          print('bbbbbbbb: $birthdate');
        });
      });
    });
  }

  Future<void> _selectDateAndroid(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _chosenDateTime,
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != _chosenDateTime)
      setState(() {
        _chosenDateTime = pickedDate;

        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        birthDayController.text = formatter.format(_chosenDateTime);

        final DateFormat date = DateFormat('yyyy-MM-dd');
        dob = date.format(_chosenDateTime);
        DateFormat time = DateFormat('hh:mm:ss');
        String timeFormat = time.format(_chosenDateTime);

        print('Date =============> ${dob}T${timeFormat}Z');

        birthdate = '${dob}T${timeFormat}Z';
      });
  }

  void _selectDateiOS(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: displayHeight(context) * 0.5,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: displayHeight(context) * 0.425,
                    child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (val) {
                          setState(() {
                            _chosenDateTime = val;

                            final DateFormat formatter =
                                DateFormat('dd-MM-yyyy');
                            birthDayController.text =
                                formatter.format(_chosenDateTime);
                            final DateFormat date = DateFormat('yyyy-MM-dd');
                            dob = date.format(_chosenDateTime);
                            DateFormat time = DateFormat('hh:mm:ss');
                            String timeFormat = time.format(_chosenDateTime);

                            print('Date =============> ${dob}T${timeFormat}Z');

                            birthdate = '${dob}T${timeFormat}Z';
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      print('Image From Gallery: ${imageFile!.path}');
    }
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });

      print('Image From Camera: ${imageFile!.path}');
    }
  }

  _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Leave without saving?',
              style: TextStyle(fontFamily: 'Kipling_Regular')),
          content: Text(
            'If you continue, all the changes you made will be lost.',
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
                'Leave',
                style: TextStyle(fontFamily: 'Kipling_Regular'),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    internetCheck(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _showDialog();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff84847e),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Voucher())),
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          )
        ],
        backgroundColor: Color(0xfffbfbfa),
        centerTitle: true,
        elevation: 0,
        title: Text(
          index == 0
              ? ld!.value!.titleTextEn.toString()
              : ld!.value!.titleTextNl.toString(),
          style:
              TextStyle(color: Color(0xff0f0e0e), fontFamily: 'Kipling_Bold'),
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          return _showDialog();
        },
        child: Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: displayWidth(context),
                      height: displayHeight(context) * 0.2,
                      decoration:
                          avatar_url != "" || avatar_url.toString().isNotEmpty
                              ? BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(avatar_url.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : BoxDecoration(),
                      child: avatar_url != "" ||
                              avatar_url.toString().isNotEmpty
                          ? BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2)),
                              ),
                            )
                          : Container(),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(displayWidth(context) * 0.05),
                        child: Container(
                          height: displayWidth(context) * 0.25,
                          width: displayWidth(context) * 0.25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: imageFile!.path != '' ||
                                      imageFile!.path.isNotEmpty
                                  ? DecorationImage(
                                      image: FileImage(imageFile!))
                                  : /*avatar_url != "" ||
                                          avatar_url.toString() != 'null'
                                      ? */
                                  DecorationImage(
                                      image: NetworkImage(avatar_url != "" ||
                                              avatar_url.toString() != 'null'
                                          ? avatar_url.toString()
                                          : ld!.value!
                                              .profilePicturePlaceholderUrlEn
                                              .toString()))
                              /* : DecorationImage(
                                          image: NetworkImage(ld!.value!
                                                  .profilePicturePlaceholderUrlEn
                                                  .toString()
                                              */ /*index == 0
                                              ? ld!.value!
                                                  .profilePicturePlaceholderUrlEn
                                                  .toString()
                                              : ld!.value!
                                                  .profilePicturePlaceholderUrlNl
                                                  .toString(),*/ /*
                                              ))*/
                              ),
                          child: Center(
                            child: GestureDetector(onTap: () {
                              showCupertinoModalPopup<void>(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoActionSheet(
                                  cancelButton: CupertinoButton(
                                    child: Text('Cancel'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  actions: <CupertinoActionSheetAction>[
                                    CupertinoActionSheetAction(
                                      child: const Text('Take a photo'),
                                      onPressed: () {
                                        _getFromCamera();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    CupertinoActionSheetAction(
                                      child: const Text('Upload a photo'),
                                      onPressed: () {
                                        _getFromGallery();
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // Container(
                //   width: displayWidth(context),
                //   height: displayHeight(context) * 0.2,
                //   color: Colors.black,
                //   child: Center(
                //     child: Container(
                //       height: displayWidth(context) * 0.25,
                //       width: displayWidth(context) * 0.25,
                //       decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           image: avatar_url != "" ||
                //               avatar_url.toString() != 'null'
                //               ? DecorationImage(
                //               image: NetworkImage(
                //                   avatar_url.toString()))
                //               : imageFile!.path != ''
                //               ? DecorationImage(
                //               image: FileImage(imageFile!))
                //               : DecorationImage(
                //               image: NetworkImage(
                //                 index == 0
                //                     ? ld!.value!
                //                     .profilePicturePlaceholderUrlEn
                //                     .toString()
                //                     : ld!.value!
                //                     .profilePicturePlaceholderUrlNl
                //                     .toString(),
                //               ))),
                //       child: GestureDetector(onTap: () {
                //         showCupertinoModalPopup<void>(
                //           context: context,
                //           builder: (BuildContext context) =>
                //               CupertinoActionSheet(
                //                 cancelButton: CupertinoButton(
                //                   child: Text('Cancel'),
                //                   onPressed: () =>
                //                       Navigator.pop(context),
                //                 ),
                //                 actions: <CupertinoActionSheetAction>[
                //                   CupertinoActionSheetAction(
                //                     child: const Text('Take a photo'),
                //                     onPressed: () {
                //                       _getFromCamera();
                //                       Navigator.pop(context);
                //                     },
                //                   ),
                //                   CupertinoActionSheetAction(
                //                     child: const Text('Upload a photo'),
                //                     onPressed: () {
                //                       _getFromGallery();
                //                       Navigator.pop(context);
                //                     },
                //                   )
                //                 ],
                //               ),
                //         );
                //       }),
                //     ),
                //   ),
                // ),
                Column(
                  children: [
                    Container(
                      width: displayWidth(context),
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.08,
                              right: displayWidth(context) * 0.08,
                              bottom: displayHeight(context) * 0.03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: displayHeight(context) * 0.02,
                              ),
                              Text(
                                  index == 0
                                      ? ld!.value!.personalInfoTitleTextEn
                                          .toString()
                                      : ld!.value!.personalInfoTitleTextNl
                                          .toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.06,
                                      fontFamily: 'Kipling_Bold')),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.firstNameTextEn.toString()
                                      : ld!.value!.firstNameTextNl.toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ),
                              buildtextfields(
                                  hint: index == 0
                                      ? ld!.value!.firstNameTextEn.toString()
                                      : ld!.value!.firstNameTextNl.toString(),
                                  controller: firstNameController,
                                  context: context),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.middleNameTextEn.toString()
                                      : ld!.value!.middleNameTextNl.toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ),
                              buildtextfields(
                                  hint: index == 0
                                      ? ld!.value!.middleNameTextEn.toString()
                                      : ld!.value!.middleNameTextNl.toString(),
                                  controller: middleNameController,
                                  context: context),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.lastNameTextEn.toString()
                                      : ld!.value!.lastNameTextNl.toString(),
                                  style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.05,
                                    fontFamily: 'Kipling_Regular',
                                  ),
                                ),
                              ),
                              buildtextfields(
                                  hint: index == 0
                                      ? ld!.value!.lastNameTextEn.toString()
                                      : ld!.value!.lastNameTextNl.toString(),
                                  controller: lastNameController,
                                  context: context),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.genderTextEn.toString()
                                      : ld!.value!.genderTextNl.toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ),
                              Platform.isAndroid
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              displayWidth(context) * 0.02),
                                      alignment: Alignment.center,
                                      height: displayHeight(context) * 0.054,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              width: 1.0)),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        isDense: true,
                                        value: genderValue,
                                        underline: Container(),
                                        items: [
                                          DropdownMenuItem(
                                            child: Text('Male'),
                                            value: 'Male',
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Female"),
                                            value: 'Female',
                                          )
                                        ],
                                        onChanged: (String? value) {
                                          setState(() {
                                            genderValue = value!;
                                          });
                                        },
                                        hint: Container(
                                          //and here
                                          child: Text(
                                            index == 0
                                                ? ld!.value!.genderTextEn
                                                    .toString()
                                                : ld!.value!.genderTextNl
                                                    .toString(),
                                            style: TextStyle(
                                                fontFamily: 'Kipling_Regular',
                                                color: Color(0xff9f9e9f),
                                                fontSize:
                                                    displayWidth(context) *
                                                        0.035),
                                          ),
                                        ),

                                        // Text(
                                        //   ld!.value[index].genderText,
                                        //   style: TextStyle(
                                        //       fontFamily: 'Kipling_Regular',
                                        //       color: Color(0xff9f9e9f),
                                        //       fontSize:
                                        //           displayWidth(context) * 0.035),
                                        // ),
                                      ),
                                    )
                                  : buildtextfields(
                                      enable: false,
                                      onTap: () {
                                        showCupertinoModalPopup(
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(builder:
                                                (BuildContext context,
                                                    StateSetter setState) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffffffff),
                                                        border: Border(
                                                          bottom: BorderSide(
                                                            color: Color(
                                                                0xff999999),
                                                            width: 0.0,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Expanded(
                                                            child:
                                                                CupertinoButton(
                                                              child: Text(''),
                                                              onPressed: () {},
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 5.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Center(
                                                              child: Text(
                                                                'Select Gender',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: displayWidth(
                                                                            context) *
                                                                        0.035),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                CupertinoButton(
                                                              child: Text(
                                                                  'Confirm'),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 5.0,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: displayWidth(
                                                              context) *
                                                          0.2,
                                                      color: Color(0xfff7f7f7),
                                                      child: CupertinoPicker(
                                                        itemExtent:
                                                            displayWidth(
                                                                    context) *
                                                                0.08,
                                                        onSelectedItemChanged:
                                                            (value) {
                                                          setState(() {
                                                            print(
                                                                'Value::  $value');
                                                            setState(() {
                                                              if (value == 0) {
                                                                setState(() {
                                                                  selectedGender ==
                                                                      'Male';
                                                                });
                                                              } else if (value ==
                                                                  1) {
                                                                setState(() {
                                                                  selectedGender ==
                                                                      'Female';
                                                                });
                                                              }
                                                            });
                                                          });
                                                        },
                                                        children: [
                                                          Text(
                                                            'Male',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Text('Female',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            });
                                          },
                                        );
                                      },
                                      hint: index == 0
                                          ? ld!.value!.genderTextEn.toString()
                                          : ld!.value!.genderTextNl.toString(),
                                      controller: genderController,
                                      context: context,
                                      suffix: true,
                                      suffixIcon:
                                          Icon(Icons.arrow_drop_down_sharp)),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.birthdayTextEn.toString()
                                      : ld!.value!.birthdayTextNl.toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ),
                              buildtextfields(
                                  enable: false,
                                  onTap: () => Platform.isAndroid
                                      ? _selectDateAndroid(context)
                                      : _selectDateiOS(context),
                                  hint: index == 0
                                      ? ld!.value!.birthdayTextEn.toString()
                                      : ld!.value!.birthdayTextNl.toString(),
                                  controller: birthDayController,
                                  context: context,
                                  suffix: true,
                                  suffixIcon: Icon(Icons.calendar_today)),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.countryTextEn.toString()
                                      : ld!.value!.countryTextNl.toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ),
                              Platform.isAndroid
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              displayWidth(context) * 0.02),
                                      alignment: Alignment.center,
                                      height: displayHeight(context) * 0.054,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              width: 1.0)),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        isDense: true,
                                        value: countryValue,
                                        underline: Container(),
                                        items: countryList!.map((e) {
                                          return new DropdownMenuItem(
                                            child: new Text(e.name),
                                            value: e.name.toString(),
                                          );
                                        }).toList(),
                                        onChanged: (String? value) {
                                          setState(() {
                                            countryValue = value!;
                                          });
                                        },
                                        hint: Text(
                                          index == 0
                                              ? ld!.value!.countryTextEn
                                                  .toString()
                                              : ld!.value!.countryTextNl
                                                  .toString(),
                                          style: TextStyle(
                                              fontFamily: 'Kipling_Regular',
                                              color: Color(0xff9f9e9f),
                                              fontSize: displayWidth(context) *
                                                  0.035),
                                        ),
                                      ),
                                    )
                                  : buildtextfields(
                                      hint: index == 0
                                          ? ld!.value!.countryTextEn.toString()
                                          : ld!.value!.countryTextNl.toString(),
                                      controller: countryController,
                                      enable: false,
                                      context: context,
                                      suffix: true,
                                      suffixIcon:
                                          Icon(Icons.arrow_drop_down_sharp),
                                      onTap: () {
                                        showCupertinoModalPopup(
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(builder:
                                                (BuildContext context,
                                                    StateSetter setState) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffffffff),
                                                        border: Border(
                                                          bottom: BorderSide(
                                                            color: Color(
                                                                0xff999999),
                                                            width: 0.0,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Expanded(
                                                            child:
                                                                CupertinoButton(
                                                              child: Text(''),
                                                              onPressed: () {},
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 5.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Center(
                                                              child: Text(
                                                                'Select Country',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: displayWidth(
                                                                            context) *
                                                                        0.035),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                CupertinoButton(
                                                              child: Text(
                                                                  'Confirm'),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 5.0,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: displayWidth(
                                                              context) *
                                                          0.5,
                                                      color: Color(0xfff7f7f7),
                                                      child: CupertinoPicker(
                                                          itemExtent:
                                                              displayWidth(
                                                                      context) *
                                                                  0.08,
                                                          onSelectedItemChanged:
                                                              (value) {
                                                            setState(() {
                                                              print(
                                                                  'Value::  $value');
                                                            });
                                                          },
                                                          children: countryList!
                                                              .map((e) {
                                                            return Text(
                                                              e.name,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            );
                                                          }).toList()),
                                                    )
                                                  ],
                                                ),
                                              );
                                            });
                                          },
                                        );
                                      }),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.languageTextEn.toString()
                                      : ld!.value!.languageTextNl.toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ),
                              Platform.isAndroid
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              displayWidth(context) * 0.02),
                                      alignment: Alignment.center,
                                      height: displayHeight(context) * 0.054,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              width: 1.0)),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        isDense: true,
                                        value: languageValue,
                                        underline: Container(),
                                        items: [
                                          DropdownMenuItem(
                                            child: Text('Hindi'),
                                            value: 'Hindi',
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Gujarati"),
                                            value: 'Gujarati',
                                          ),
                                          DropdownMenuItem(
                                            child: Text("English"),
                                            value: 'English',
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Marathi"),
                                            value: 'Marathi',
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Bengali"),
                                            value: 'Bengali',
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Punjabi"),
                                            value: 'Punjabi',
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Spanish"),
                                            value: 'Spanish',
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Haryani"),
                                            value: 'Haryani',
                                          ),
                                          DropdownMenuItem(
                                            child: Text("Telugu"),
                                            value: 'Telugu',
                                          ),
                                        ],
                                        onChanged: (String? value) {
                                          setState(() {
                                            languageValue = value!;
                                          });
                                        },
                                        hint: Text(
                                          index == 0
                                              ? ld!.value!.languageTextEn
                                                  .toString()
                                              : ld!.value!.languageTextNl
                                                  .toString(),
                                          style: TextStyle(
                                              fontFamily: 'Kipling_Regular',
                                              color: Color(0xff9f9e9f),
                                              fontSize: displayWidth(context) *
                                                  0.035),
                                        ),
                                      ),
                                    )
                                  : buildtextfields(
                                      hint: index == 0
                                          ? ld!.value!.languageTextEn.toString()
                                          : ld!.value!.languageTextNl
                                              .toString(),
                                      controller: languageController,
                                      enable: false,
                                      context: context,
                                      suffix: true,
                                      suffixIcon:
                                          Icon(Icons.arrow_drop_down_sharp),
                                      onTap: () {
                                        showCupertinoModalPopup(
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(builder:
                                                (BuildContext context,
                                                    StateSetter setState) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffffffff),
                                                        border: Border(
                                                          bottom: BorderSide(
                                                            color: Color(
                                                                0xff999999),
                                                            width: 0.0,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Expanded(
                                                            child:
                                                                CupertinoButton(
                                                              child: Text(''),
                                                              onPressed: () {},
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 5.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Center(
                                                              child: Text(
                                                                'Select Language',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: displayWidth(
                                                                            context) *
                                                                        0.035),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                CupertinoButton(
                                                              child: Text(
                                                                  'Confirm'),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 5.0,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: displayWidth(
                                                              context) *
                                                          0.5,
                                                      color: Color(0xfff7f7f7),
                                                      child: CupertinoPicker(
                                                        itemExtent:
                                                            displayWidth(
                                                                    context) *
                                                                0.08,
                                                        onSelectedItemChanged:
                                                            (value) {
                                                          setState(() {
                                                            print(
                                                                'Value::  $value');
                                                          });
                                                        },
                                                        children: [
                                                          Text(
                                                            'Hindi',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Text('Gujarati',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                          Text('English',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                          Text('Marathi',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                          Text('Bengali',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                          Text('Punjabi',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            });
                                          },
                                        );
                                      }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: displayWidth(context),
                      child: Card(
                        margin: EdgeInsets.zero,
                        color: Colors.white,
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: displayWidth(context) * 0.08,
                              vertical: displayHeight(context) * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  index == 0
                                      ? ld!.value!.contactInfoTitleTextEn
                                          .toString()
                                      : ld!.value!.contactInfoTitleTextNl
                                          .toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.06,
                                      fontFamily: 'Kipling_Bold')),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.03,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.phoneNumberTextEn.toString()
                                      : ld!.value!.phoneNumberTextNl.toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ),
                              buildtextfields(
                                  hint: index == 0
                                      ? ld!.value!.phoneNumberTextEn.toString()
                                      : ld!.value!.phoneNumberTextNl.toString(),
                                  controller: phoneNumberController,
                                  context: context,
                                  keyboard: TextInputType.number),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.emailAddressTextEn.toString()
                                      : ld!.value!.emailAddressTextNl
                                          .toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ),
                              buildtextfields(
                                  hint: index == 0
                                      ? ld!.value!.emailAddressTextEn.toString()
                                      : ld!.value!.emailAddressTextNl
                                          .toString(),
                                  controller: emailController,
                                  context: context,
                                  keyboard: TextInputType.emailAddress),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.03,
                                    bottom: displayHeight(context) * 0.01),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isChecked = !isChecked;
                                          });
                                        },
                                        child: isChecked == false
                                            ? Icon(
                                                Icons.check_box_outlined,
                                                color: Colors.black,
                                              )
                                            : Icon(
                                                Icons.check_box,
                                                color: Color(0xff89b14b),
                                              ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      flex: 10,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              index == 0
                                                  ? ld!.value!.optinTextEn
                                                      .toString()
                                                  : ld!.value!.optinTextNl
                                                      .toString(),
                                              style: TextStyle(
                                                  color: Color(0xff010001),
                                                  fontSize:
                                                      displayWidth(context) *
                                                          0.05,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                            index == 0
                                                ? ld!.value!.optinDescTextEn
                                                    .toString()
                                                : ld!.value!.optinDescTextNl
                                                    .toString(),
                                            style: TextStyle(
                                                height: 1.50,
                                                color: Color(0xff010001),
                                                fontSize:
                                                    displayWidth(context) *
                                                        0.05),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: displayWidth(context),
                      child: Card(
                        margin: EdgeInsets.zero,
                        color: Colors.white,
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: displayWidth(context) * 0.08,
                              vertical: displayHeight(context) * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  index == 0
                                      ? ld!.value!.addressTitleTextEn.toString()
                                      : ld!.value!.addressTitleTextNl
                                          .toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.06,
                                      fontFamily: 'Kipling_Bold')),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.addressLine1TextEn.toString()
                                      : ld!.value!.addressLine1TextNl
                                          .toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ),
                              buildtextfields(
                                  hint: index == 0
                                      ? ld!.value!.addressLine1TextEn.toString()
                                      : ld!.value!.addressLine1TextNl
                                          .toString(),
                                  controller: streetNameController,
                                  context: context,
                                  keyboard: TextInputType.number),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            index == 0
                                                ? ld!.value!
                                                    .addressHouseNumberTextEn
                                                    .toString()
                                                : ld!.value!
                                                    .addressHouseNumberTextNl
                                                    .toString(),
                                            style: TextStyle(
                                                color: Color(0xff010001),
                                                fontSize:
                                                    displayWidth(context) *
                                                        0.05,
                                                fontFamily: 'Kipling_Regular'),
                                          ),
                                          SizedBox(
                                              height: displayHeight(context) *
                                                  0.01),
                                          buildtextfields(
                                              width:
                                                  displayWidth(context) * 0.4,
                                              hint: index == 0
                                                  ? ld!.value!
                                                      .addressHouseNumberTextEn
                                                      .toString()
                                                  : ld!.value!
                                                      .addressHouseNumberTextNl
                                                      .toString(),
                                              controller: houseNumberController,
                                              context: context,
                                              keyboard: TextInputType.number),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Flexible(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            index == 0
                                                ? ld!.value!
                                                    .addressHouseNumberSuffixTextEn
                                                    .toString()
                                                : ld!.value!
                                                    .addressHouseNumberSuffixTextNl
                                                    .toString(),
                                            style: TextStyle(
                                                color: Color(0xff010001),
                                                fontSize:
                                                    displayWidth(context) *
                                                        0.05,
                                                fontFamily: 'Kipling_Regular'),
                                          ),
                                          SizedBox(
                                              height: displayHeight(context) *
                                                  0.01),
                                          buildtextfields(
                                              // width: displayWidth(context) * 0.4,
                                              hint: index == 0
                                                  ? ld!.value!
                                                      .addressHouseNumberSuffixTextEn
                                                      .toString()
                                                  : ld!.value!
                                                      .addressHouseNumberSuffixTextNl
                                                      .toString(),
                                              controller: additionController,
                                              context: context,
                                              keyboard: TextInputType.number),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.addressCityTextEn.toString()
                                      : ld!.value!.addressCityTextNl.toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ),
                              buildtextfields(
                                  hint: index == 0
                                      ? ld!.value!.addressCityTextEn.toString()
                                      : ld!.value!.addressCityTextNl.toString(),
                                  controller: cityController,
                                  context: context),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.addressStateTextEn.toString()
                                      : ld!.value!.addressStateTextNl
                                          .toString(),
                                  style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.05,
                                    fontFamily: 'Kipling_Regular',
                                  ),
                                ),
                              ),
                              buildtextfields(
                                  hint: index == 0
                                      ? ld!.value!.addressStateTextEn.toString()
                                      : ld!.value!.addressStateTextNl
                                          .toString(),
                                  controller: regionController,
                                  context: context),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.countryTextEn.toString()
                                      : ld!.value!.countryTextNl.toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ),
                              Platform.isAndroid
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              displayWidth(context) * 0.02),
                                      alignment: Alignment.center,
                                      height: displayHeight(context) * 0.054,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              width: 1.0)),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        isDense: true,
                                        value: countryValue,
                                        underline: Container(),
                                        items: countryList!.map((e) {
                                          return new DropdownMenuItem(
                                            child: new Text(e.name),
                                            value: e.name.toString(),
                                          );
                                        }).toList(),
                                        onChanged: (String? value) {
                                          setState(() {
                                            countryValue = value!;
                                          });
                                        },
                                        hint: Text(
                                          index == 0
                                              ? ld!.value!.countryTextEn
                                                  .toString()
                                              : ld!.value!.countryTextNl
                                                  .toString(),
                                          style: TextStyle(
                                              fontFamily: 'Kipling_Regular',
                                              color: Color(0xff9f9e9f),
                                              fontSize: displayWidth(context) *
                                                  0.035),
                                        ),
                                      ),
                                    )
                                  : buildtextfields(
                                      hint: index == 0
                                          ? ld!.value!.countryTextEn.toString()
                                          : ld!.value!.countryTextNl.toString(),
                                      controller: countryController,
                                      context: context,
                                      suffix: true,
                                      suffixIcon:
                                          Icon(Icons.arrow_drop_down_sharp),
                                      enable: false,
                                      onTap: () {
                                        showCupertinoModalPopup(
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(builder:
                                                (BuildContext context,
                                                    StateSetter setState) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffffffff),
                                                        border: Border(
                                                          bottom: BorderSide(
                                                            color: Color(
                                                                0xff999999),
                                                            width: 0.0,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Expanded(
                                                            child:
                                                                CupertinoButton(
                                                              child: Text(''),
                                                              onPressed: () {},
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 5.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Center(
                                                              child: Text(
                                                                'Select Country',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: displayWidth(
                                                                            context) *
                                                                        0.035),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                CupertinoButton(
                                                              child: Text(
                                                                  'Confirm'),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 5.0,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: displayWidth(
                                                              context) *
                                                          0.5,
                                                      color: Color(0xfff7f7f7),
                                                      child: CupertinoPicker(
                                                          itemExtent:
                                                              displayWidth(
                                                                      context) *
                                                                  0.08,
                                                          onSelectedItemChanged:
                                                              (value) {
                                                            setState(() {
                                                              print(
                                                                  'Value::  $value');
                                                            });
                                                          },
                                                          children: countryList!
                                                              .map((e) {
                                                            return Text(
                                                              e.name,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            );
                                                          }).toList()),
                                                    )
                                                  ],
                                                ),
                                              );
                                            });
                                          },
                                        );
                                      }),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.addressPostalCodeTextEn
                                          .toString()
                                      : ld!.value!.addressPostalCodeTextNl
                                          .toString(),
                                  style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.05,
                                    fontFamily: 'Kipling_Regular',
                                  ),
                                ),
                              ),
                              buildtextfields(
                                  hint: index == 0
                                      ? ld!.value!.addressPostalCodeTextEn
                                          .toString()
                                      : ld!.value!.addressPostalCodeTextNl
                                          .toString(),
                                  controller: postalCodeController,
                                  context: context),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  index == 0
                                      ? ld!.value!.addressTypeTextEn.toString()
                                      : ld!.value!.addressTypeTextNl.toString(),
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontFamily: 'Kipling_Regular'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: displayWidth(context) * 0.13),
                                child: buildtextfields(
                                    hint: index == 0
                                        ? ld!.value!.addressTypeTextEn
                                            .toString()
                                        : ld!.value!.addressTypeTextNl
                                            .toString(),
                                    controller: companyOptionalController,
                                    context: context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
            Padding(
              padding: EdgeInsets.only(
                  bottom: displayWidth(context) * 0.03,
                  left: displayWidth(context) * 0.08,
                  right: displayWidth(context) * 0.08),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: displayHeight(context) * 0.07,
                  margin: EdgeInsets.only(top: displayHeight(context) * 0.03),
                  child: ElevatedButton(
                    onPressed: () {
                      print('sdvgds');
                      if (imageFile!.path.isEmpty) {
                        print('fghjhjghjghjg');
                        updateUserDataAPI(
                                email: emailController.text.isNotEmpty
                                    ? emailController.text
                                    : '',
                                name: firstNameController.text.isNotEmpty
                                    ? firstNameController.text
                                    : '',
                                birthdate: birthdate,
                                // countryCode: 'in',
                                currentDate: currentDate,
                                gender: genderController.text.isNotEmpty
                                    ? genderController.text
                                    : genderController.text,
                                generalPermission: true,
                                id: 'fc83716b-5768-48f4-b80a-25c64b844014',
                                // languageCode: 'en',
                                lastName: lastNameController.text.isNotEmpty
                                    ? lastNameController.text
                                    : '',
                                middleName: middleNameController.text.isNotEmpty
                                    ? middleNameController.text
                                    : '',
                                addition: additionController.text.isNotEmpty
                                    ? additionController.text
                                    : '',
                                option: true,
                                city: cityController.text.isNotEmpty
                                    ? cityController.text
                                    : '',
                                houseNumber:
                                    houseNumberController.text.isNotEmpty
                                        ? houseNumberController.text
                                        : '',
                                mobileNumber:
                                    phoneNumberController.text.isNotEmpty
                                        ? phoneNumberController.text
                                        : '',
                                postalCode: postalCodeController.text.isNotEmpty
                                    ? postalCodeController.text
                                    : '',
                                state: regionController.text.isNotEmpty
                                    ? regionController.text
                                    : '',
                                streetName: streetNameController.text.isNotEmpty
                                    ? streetNameController.text
                                    : '',
                                avatarUrl: avatar_url)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BadgeScreen()));
                        });
                      } else {
                        print('hyghvghvyjff');
                        uploadImage().then((value1) {
                          // print('sdhsbhnbnnbdn: ${value1!.url.toString()}');
                          if (value1 != null) {
                            print('dsafghfnbhfbrefbrufbrebfrbfhrfrhfhrfrf');
                            setState(() {});
                            updateUserDataAPI(
                                    email: emailController.text.isNotEmpty
                                        ? emailController.text
                                        : '',
                                    name: firstNameController.text.isNotEmpty
                                        ? firstNameController.text
                                        : '',
                                    birthdate: birthdate,
                                    countryCode: 'in',
                                    currentDate: currentDate,
                                    gender: genderController.text.isNotEmpty
                                        ? genderController.text
                                        : genderController.text,
                                    generalPermission: true,
                                    id: 'fc83716b-5768-48f4-b80a-25c64b844014',
                                    languageCode: 'en',
                                    lastName: lastNameController.text.isNotEmpty
                                        ? lastNameController.text
                                        : '',
                                    middleName:
                                        middleNameController.text.isNotEmpty
                                            ? middleNameController.text
                                            : '',
                                    addition: additionController.text.isNotEmpty
                                        ? additionController.text
                                        : '',
                                    option: true,
                                    city: cityController.text.isNotEmpty
                                        ? cityController.text
                                        : '',
                                    houseNumber:
                                        houseNumberController.text.isNotEmpty
                                            ? houseNumberController.text
                                            : '',
                                    mobileNumber:
                                        phoneNumberController.text.isNotEmpty
                                            ? phoneNumberController.text
                                            : '',
                                    postalCode:
                                        postalCodeController.text.isNotEmpty
                                            ? postalCodeController.text
                                            : '',
                                    state: regionController.text.isNotEmpty
                                        ? regionController.text
                                        : '',
                                    streetName:
                                        streetNameController.text.isNotEmpty
                                            ? streetNameController.text
                                            : '',
                                    avatarUrl:
                                        value1.formats!.medium!.url.toString())
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BadgeScreen()));
                            });
                          }
                        });
                      }
                      // getData().then((value) {
                      //   print('image: $avatar_url');
                      //
                      // });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF88b14a),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                    ),
                    child: Text(
                      index == 0
                          ? ld!.value!.saveButtonTextEn.toString()
                          : ld!.value!.saveButtonTextNl.toString(),
                      style: TextStyle(
                          fontSize: displayWidth(context) * 0.05,
                          color: Color(0xfffcfdfd),
                          fontFamily: 'Kipling_Regular'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
