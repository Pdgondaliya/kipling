import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/custom_widget/text_field.dart';
import 'package:kipling/main.dart';
import 'package:kipling/module/fusion_auth_register_model.dart';
import 'package:kipling/module/personal_details_data.dart';
import 'package:kipling/ui/badge_screen.dart';
import 'package:kipling/ui/login_screen.dart';
import 'package:dio/dio.dart' as d;

class PersonalDetails extends StatefulWidget {
  // const PersonalDetails({this.ld});

  // final PersonalDetailData? ld;

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

String selectedGender = '';

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

  PersonalDetailData? ld;

  File? imageFile = File('');

  DateTime _chosenDateTime = DateTime.now();

  d.Dio dio = d.Dio();

  var items = [];

  String genderValue = 'Male';
  String countryValue = 'Afghanistan';
  String languageValue = 'Hindi';

  Future<String?> uploadImage(int id) async {
    try {
      d.Response response;

      d.FormData formData = new d.FormData.fromMap({'id': id});
      formData.files.add(
        MapEntry("avatar_url", await d.MultipartFile.fromFile(imageFile!.path)),
      );

      response = await dio.post(
          'https://cms-mobile-app-staging.loyalty-cloud.com/upload?avatar_url=${imageFile!.path}&id=$id',
          options: d.Options(headers: {"content-type": 'application/json'}),
          data: formData);
      print('response --------> ${response.toString()}');
      if (response == null) {
        print('response ---null-----> ${response.statusMessage.toString()}');
        return null;
      } else if (response.statusCode == 200) {
        print(
            'response.statusMessage --------> ${response.statusMessage.toString()}');
        print("Response is---> ${response.data}");
        if (response.data['status'] == false) {
          print(" In status falseResponse is---> ${response.data}");
// return LoginResponse.fromJson(response.data);
        } else {
          print(
              'response. true response data --------> ${response.data.toString()}');
// SharedPreferences prefs=await SharedPreferences.getInstance();
// prefs.setString('UserId',response.data['data']['user_id'].toString() );
          return response.data['data']['user_id'].toString();
        }
      } else {
        print('12345555556 ------>${response.statusMessage.toString()}');
        print('22222222 ------>${response.statusCode.toString()}');
        throw new Exception(response.data);
      }
    } on d.DioError catch (e) {
      print('12345555556');
      print(e);
// throw handleError(e);
    }
  }

  @override
  void initState() {
    print('Value List: ${countryList.toString()}');
    ld = personalDetailData;
    for (var i in ld!.value) {
      print(i.languageCode.toString().toUpperCase());
      // items.clear();
      items.add(i.languageCode.toUpperCase());
    }
  }

  Future<void> _selectDateAndroid(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _chosenDateTime,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != _chosenDateTime)
      setState(() {
        _chosenDateTime = pickedDate;

        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        birthDayController.text = formatter.format(_chosenDateTime);
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
        backgroundColor: Color(0xfffbfbfa),
        centerTitle: true,
        elevation: 0,
        title: Text(
          ld!.value[index].titleText,
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
                            Container(
                              width: displayWidth(context),
                              height: displayHeight(context) * 0.2,
                              child: Center(
                                child: Container(
                                  height: displayWidth(context) * 0.25,
                                  width: displayWidth(context) * 0.25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: imageFile!.path != ''
                                          ? DecorationImage(
                                              image: FileImage(imageFile!))
                                          : DecorationImage(
                                              image: NetworkImage(
                                              ld!.value[index]
                                                  .profilePicturePlaceholderUrl,
                                            ))),
                                  child: GestureDetector(onTap: () {
                                    showCupertinoModalPopup<void>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CupertinoActionSheet(
                                        cancelButton: CupertinoButton(
                                          child: Text('Cancel'),
                                          onPressed: () =>
                                              Navigator.pop(context),
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
                            SizedBox(
                              height: displayHeight(context) * 0.02,
                            ),
                            Text(ld!.value[index].personalInfoTitleText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.06,
                                    fontFamily: 'Kipling_Bold')),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.02,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].firstNameText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.05,
                                    fontFamily: 'Kipling_Regular'),
                              ),
                            ),
                            buildtextfields(
                                hint: ld!.value[index].firstNameText,
                                controller: firstNameController,
                                context: context),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.02,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].middleNameText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.05,
                                    fontFamily: 'Kipling_Regular'),
                              ),
                            ),
                            buildtextfields(
                                hint: ld!.value[index].middleNameText,
                                controller: middleNameController,
                                context: context),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.02,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].lastNameText,
                                style: TextStyle(
                                  color: Color(0xff010001),
                                  fontSize: displayWidth(context) * 0.05,
                                  fontFamily: 'Kipling_Regular',
                                ),
                              ),
                            ),
                            buildtextfields(
                                hint: ld!.value[index].lastNameText,
                                controller: lastNameController,
                                context: context),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.02,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].genderText,
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
                                            color: Colors.grey.withOpacity(0.5),
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
                                      hint: Container(                     //and here
                                        child: Text(
                                          ld!.value[index].genderText,
                                          style: TextStyle(fontFamily: 'Kipling_Regular',
                                              color: Color(0xff9f9e9f),
                                              fontSize:
                                              displayWidth(context) * 0.035),
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
                                                      color: Color(0xffffffff),
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color:
                                                              Color(0xff999999),
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
                                                              horizontal: 16.0,
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
                                                                  fontSize:
                                                                      displayWidth(
                                                                              context) *
                                                                          0.035),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              CupertinoButton(
                                                            child:
                                                                Text('Confirm'),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 16.0,
                                                              vertical: 5.0,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height:
                                                        displayWidth(context) *
                                                            0.2,
                                                    color: Color(0xfff7f7f7),
                                                    child: CupertinoPicker(
                                                      itemExtent: displayWidth(
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
                                                              color:
                                                                  Colors.black),
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
                                    hint: ld!.value[index].genderText,
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
                                ld!.value[index].birthdayText,
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
                                hint: ld!.value[index].birthdayText,
                                controller: birthDayController,
                                context: context,
                                suffix: true,
                                suffixIcon: Icon(Icons.calendar_today)),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.02,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].countryText,
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
                                            color: Colors.grey.withOpacity(0.5),
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
                                        ld!.value[index].countryText,
                                        style: TextStyle(
                                            fontFamily: 'Kipling_Regular',
                                            color: Color(0xff9f9e9f),
                                            fontSize:
                                                displayWidth(context) * 0.035),
                                      ),
                                    ),
                                  )
                                :
                            buildtextfields(
                                    hint: ld!.value[index].countryText,
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
                                                      color: Color(0xffffffff),
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color:
                                                              Color(0xff999999),
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
                                                              horizontal: 16.0,
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
                                                                  fontSize:
                                                                      displayWidth(
                                                                              context) *
                                                                          0.035),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              CupertinoButton(
                                                            child:
                                                                Text('Confirm'),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 16.0,
                                                              vertical: 5.0,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height:
                                                        displayWidth(context) *
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
                                ld!.value[index].languageText,
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
                                      color: Colors.grey.withOpacity(0.5),
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
                                  ),DropdownMenuItem(
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
                                  ld!.value[index].languageText,
                                  style: TextStyle(
                                      fontFamily: 'Kipling_Regular',
                                      color: Color(0xff9f9e9f),
                                      fontSize:
                                      displayWidth(context) * 0.035),
                                ),
                              ),
                            )
                                :
                            buildtextfields(
                                hint: ld!.value[index].languageText,
                                controller: languageController,
                                enable: false,
                                context: context,
                                suffix: true,
                                suffixIcon: Icon(Icons.arrow_drop_down_sharp),
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
                                                  color: Color(0xffffffff),
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Color(0xff999999),
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
                                                      child: CupertinoButton(
                                                        child: Text(''),
                                                        onPressed: () {},
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 5.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Center(
                                                        child: Text(
                                                          'Select Language',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  displayWidth(
                                                                          context) *
                                                                      0.035),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: CupertinoButton(
                                                        child: Text('Confirm'),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 5.0,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height:
                                                    displayWidth(context) * 0.5,
                                                color: Color(0xfff7f7f7),
                                                child: CupertinoPicker(
                                                  itemExtent:
                                                      displayWidth(context) *
                                                          0.08,
                                                  onSelectedItemChanged:
                                                      (value) {
                                                    setState(() {
                                                      print('Value::  $value');
                                                    });
                                                  },
                                                  children: [
                                                    Text(
                                                      'Hindi',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Text('Gujarati',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black)),
                                                    Text('English',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black)),
                                                    Text('Marathi',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black)),
                                                    Text('Bengali',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black)),
                                                    Text('Punjabi',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black)),
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
                            Text(ld!.value[index].contactInfoTitleText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.06,
                                    fontFamily: 'Kipling_Bold')),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.03,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].phoneNumberText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.05,
                                    fontFamily: 'Kipling_Regular'),
                              ),
                            ),
                            buildtextfields(
                                hint: ld!.value[index].phoneNumberText,
                                controller: phoneNumberController,
                                context: context,
                                keyboard: TextInputType.number),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.02,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].emailAddressText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.05,
                                    fontFamily: 'Kipling_Regular'),
                              ),
                            ),
                            buildtextfields(
                                hint: ld!.value[index].emailAddressText,
                                controller: emailController,
                                context: context,
                                keyboard: TextInputType.number),
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
                                        Text(ld!.value[index].optinText,
                                            style: TextStyle(
                                                color: Color(0xff010001),
                                                fontSize:
                                                    displayWidth(context) *
                                                        0.05,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                          ld!.value[index].optinDescText,
                                          style: TextStyle(
                                              height: 1.50,
                                              color: Color(0xff010001),
                                              fontSize:
                                                  displayWidth(context) * 0.05),
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
                            Text(ld!.value[index].addressTitleText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.06,
                                    fontFamily: 'Kipling_Bold')),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.02,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].addressLine1Text,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.05,
                                    fontFamily: 'Kipling_Regular'),
                              ),
                            ),
                            buildtextfields(
                                hint: ld!.value[index].addressLine1Text,
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
                                          ld!.value[index]
                                              .addressHouseNumberText,
                                          style: TextStyle(
                                              color: Color(0xff010001),
                                              fontSize:
                                                  displayWidth(context) * 0.05,
                                              fontFamily: 'Kipling_Regular'),
                                        ),
                                        SizedBox(
                                            height:
                                                displayHeight(context) * 0.01),
                                        buildtextfields(
                                            width: displayWidth(context) * 0.4,
                                            hint: ld!.value[index]
                                                .addressHouseNumberText,
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
                                          ld!.value[index]
                                              .addressHouseNumberSuffixText,
                                          style: TextStyle(
                                              color: Color(0xff010001),
                                              fontSize:
                                                  displayWidth(context) * 0.05,
                                              fontFamily: 'Kipling_Regular'),
                                        ),
                                        SizedBox(
                                            height:
                                                displayHeight(context) * 0.01),
                                        buildtextfields(
                                            // width: displayWidth(context) * 0.4,
                                            hint: ld!.value[index]
                                                .addressHouseNumberSuffixText,
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
                                ld!.value[index].addressCityText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.05,
                                    fontFamily: 'Kipling_Regular'),
                              ),
                            ),
                            buildtextfields(
                                hint: ld!.value[index].addressCityText,
                                controller: cityController,
                                context: context),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.02,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].addressStateText,
                                style: TextStyle(
                                  color: Color(0xff010001),
                                  fontSize: displayWidth(context) * 0.05,
                                  fontFamily: 'Kipling_Regular',
                                ),
                              ),
                            ),
                            buildtextfields(
                                hint: ld!.value[index].addressStateText,
                                controller: regionController,
                                context: context),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.02,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].countryText,
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
                                      color: Colors.grey.withOpacity(0.5),
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
                                  ld!.value[index].countryText,
                                  style: TextStyle(
                                      fontFamily: 'Kipling_Regular',
                                      color: Color(0xff9f9e9f),
                                      fontSize:
                                      displayWidth(context) * 0.035),
                                ),
                              ),
                            )
                                :
                            buildtextfields(
                                hint: ld!.value[index].countryText,
                                controller: countryController,
                                context: context,
                                suffix: true,
                                suffixIcon: Icon(Icons.arrow_drop_down_sharp),
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
                                                  color: Color(0xffffffff),
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Color(0xff999999),
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
                                                      child: CupertinoButton(
                                                        child: Text(''),
                                                        onPressed: () {},
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 5.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Center(
                                                        child: Text(
                                                          'Select Country',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  displayWidth(
                                                                          context) *
                                                                      0.035),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: CupertinoButton(
                                                        child: Text('Confirm'),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 5.0,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height:
                                                    displayWidth(context) * 0.5,
                                                color: Color(0xfff7f7f7),
                                                child: CupertinoPicker(
                                                    itemExtent:
                                                        displayWidth(context) *
                                                            0.08,
                                                    onSelectedItemChanged:
                                                        (value) {
                                                      setState(() {
                                                        print(
                                                            'Value::  $value');
                                                      });
                                                    },
                                                    children:
                                                        countryList!.map((e) {
                                                      return Text(
                                                        e.name,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
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
                                ld!.value[index].addressPostalCodeText,
                                style: TextStyle(
                                  color: Color(0xff010001),
                                  fontSize: displayWidth(context) * 0.05,
                                  fontFamily: 'Kipling_Regular',
                                ),
                              ),
                            ),
                            buildtextfields(
                                hint: ld!.value[index].addressPostalCodeText,
                                controller: postalCodeController,
                                context: context),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.02,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].addressTypeText,
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
                                  hint: ld!.value[index].addressTypeText,
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
            ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BadgeScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF88b14a),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                    ),
                    child: Text(
                      ld!.value[index].saveButtonText,
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
