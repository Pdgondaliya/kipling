import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/module/personal_details_data.dart';
import 'package:kipling/ui/badge_screen.dart';
import 'package:kipling/ui/login_screen.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({this.ld});

  final PersonalDetailData? ld;

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

  PersistentBottomSheetController? _controller;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var items = [];

  @override
  void initState() {
    ld = widget.ld;
    for (var i in ld!.value) {
      print(i.languageCode.toString().toUpperCase());
      // items.clear();
      items.add(i.languageCode.toUpperCase());
    }
  }

  DateTime? _chosenDateTime;

  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) =>
            Container(
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

  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }

  _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Leave without saving?'),
          content:
          Text('If you continue, all the changes you made will be lost.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Leave'),
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
          TextStyle(color: Color(0xff0f0e0e), fontWeight: FontWeight.bold),
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          return _showDialog();
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: displayHeight(context) * 0.1),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: displayHeight(context) * 0.03,
                            vertical: displayHeight(context) * 0.05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: displayHeight(context) * 0.20,
                              child: Center(
                                child: Container(
                                  height: displayWidth(context) * 0.2,
                                  width: displayWidth(context) * 0.2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      showCupertinoModalPopup<void>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CupertinoActionSheet(
                                              cancelButton: CupertinoButton(
                                                child: Text('Cancel'),
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                              ),
                                              actions: <
                                                  CupertinoActionSheetAction>[
                                                CupertinoActionSheetAction(
                                                  child: const Text(
                                                      'Take a photo'),
                                                  onPressed: () {
                                                    _getFromCamera();
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                CupertinoActionSheetAction(
                                                  child: const Text(
                                                      'Upload a photo'),
                                                  onPressed: () {
                                                    _getFromGallery();
                                                    Navigator.pop(context);
                                                  },
                                                )
                                              ],
                                            ),
                                      );
                                    },
                                    child: imageFile == null
                                        ? Image.network(
                                      ld!.value[index]
                                          .profilePicturePlaceholderUrl,
                                      height: displayWidth(context) * 0.5,
                                      width: displayWidth(context) * 0.5,
                                      fit: BoxFit.contain,
                                    )
                                        : Container(
                                      child: Image.file(
                                        imageFile!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(ld!.value[index].personalInfoTitleText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.05,
                                    fontWeight: FontWeight.bold)),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.02,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].firstNameText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            _buildtextfields(
                                hint: ld!.value[index].firstNameText,
                                controller: firstNameController,
                                context: context),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].middleNameText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            _buildtextfields(
                                hint: ld!.value[index].middleNameText,
                                controller: middleNameController,
                                context: context),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].lastNameText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            _buildtextfields(
                                hint: ld!.value[index].lastNameText,
                                controller: lastNameController,
                                context: context),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].genderText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            _buildtextfields(
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
                                                        padding: const EdgeInsets
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
                                                      child: CupertinoButton(
                                                        child: Text('Confirm'),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        padding: const EdgeInsets
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
                                                displayWidth(context) * 0.2,
                                                color: Color(0xfff7f7f7),
                                                child: CupertinoPicker(
                                                  itemExtent:
                                                  displayWidth(context) *
                                                      0.08,
                                                  onSelectedItemChanged: (
                                                      value) {
                                                    setState(() {
                                                      print('Value::  $value');
                                                      setState(() {
                                                        if (value == 0) {
                                                          setState(() {
                                                            selectedGender ==
                                                                'Male';
                                                          });
                                                        } else if (value == 1) {
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
                                                          color: Colors.black),
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
                                suffixIcon: Icon(Icons.arrow_drop_down_sharp)),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].birthdayText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            _buildtextfields(
                                enable: false,
                                onTap: () {
                                  _showDatePicker(context);
                                },
                                hint: ld!.value[index].birthdayText,
                                controller: countryController,
                                context: context,
                                suffix: true,
                                suffixIcon: Icon(Icons.calendar_today)),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].countryText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            _buildtextfields(
                                hint: ld!.value[index].countryText,
                                controller: countryController,
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
                                                        padding: const EdgeInsets
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
                                                      child: CupertinoButton(
                                                        child: Text('Confirm'),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        padding: const EdgeInsets
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
                                                  onSelectedItemChanged: (
                                                      value) {
                                                    setState(() {
                                                      print('Value::  $value');
                                                    });
                                                  },
                                                  children: [
                                                    Text(
                                                      'India',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Text('Bhutan',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black)),
                                                    Text('Pakistan',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black)),
                                                    Text('Poland',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black)),
                                                    Text('New Zealand',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black)),
                                                    Text('Canada',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black)),
                                                    Text('UK',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black)),
                                                    Text('USA',
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
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.01,
                                  bottom: displayHeight(context) * 0.01),
                              child: Text(
                                ld!.value[index].languageText,
                                style: TextStyle(
                                    color: Color(0xff010001),
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            _buildtextfields(
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
                                                        padding: const EdgeInsets
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
                                                      child: CupertinoButton(
                                                        child: Text('Confirm'),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        padding: const EdgeInsets
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
                                                  onSelectedItemChanged: (
                                                      value) {
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
                    SizedBox(height: 10),
                    Container(
                      width: displayWidth(context),
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: displayHeight(context) * 0.03,
                              vertical: displayHeight(context) * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(ld!.value[index].contactInfoTitleText,
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.03,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  ld!.value[index].phoneNumberText,
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              _buildtextfields(
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
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              _buildtextfields(
                                  hint: ld!.value[index].emailAddressText,
                                  controller: emailController,
                                  context: context,
                                  keyboard: TextInputType.number),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.02,
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
                                                color: Color(0xff010001),
                                                fontSize:
                                                displayWidth(context) * 0.04),
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
                        color: Colors.white,
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: displayHeight(context) * 0.03,
                              vertical: displayHeight(context) * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(ld!.value[index].addressTypeText,
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.05,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.03,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  ld!.value[index].addressLine1Text,
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              _buildtextfields(
                                  hint: ld!.value[index].addressLine1Text,
                                  controller: phoneNumberController,
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
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top:
                                                displayHeight(context) * 0.01,
                                                bottom: displayHeight(context) *
                                                    0.01),
                                            child: Text(
                                              ld!.value[index]
                                                  .addressHouseNumberText,
                                              style: TextStyle(
                                                  color: Color(0xff010001),
                                                  fontSize:
                                                  displayWidth(context) *
                                                      0.04,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          _buildtextfields(
                                              width: displayWidth(context) *
                                                  0.4,
                                              hint: ld!.value[index]
                                                  .addressHouseNumberText,
                                              controller: houseNumberController,
                                              context: context,
                                              keyboard: TextInputType.number),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top:
                                                displayHeight(context) * 0.01,
                                                bottom: displayHeight(context) *
                                                    0.01),
                                            child: Text(
                                              ld!.value[index]
                                                  .addressHouseNumberSuffixText,
                                              style: TextStyle(
                                                  color: Color(0xff010001),
                                                  fontSize:
                                                  displayWidth(context) *
                                                      0.04,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          _buildtextfields(
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
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              _buildtextfields(
                                  hint: ld!.value[index].addressCityText,
                                  controller: cityController,
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
                                                            'Select City',
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
                                                          child: Text(
                                                              'Confirm'),
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
                                                    children: [
                                                      Text(
                                                        'Surat',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black),
                                                      ),
                                                      Text('Ahmedabad',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black)),
                                                      Text('Bhavnagar',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black)),
                                                      Text('Rajkot',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black)),
                                                      Text('Amreli',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black)),
                                                      Text('Junagadh',
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
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  ld!.value[index].addressStateText,
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              _buildtextfields(
                                  hint: ld!.value[index].addressStateText,
                                  controller: regionController,
                                  context: context,
                                  suffix: true,
                                  enable: false,
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
                                                            'Select Region',
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
                                                          child: Text(
                                                              'Confirm'),
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
                                                    children: [
                                                      Text(
                                                        'Gujarat',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black),
                                                      ),
                                                      Text('Maharstra',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black)),
                                                      Text('Delhi',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black)),
                                                      Text('Rajasthan',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black)),
                                                      Text('Madhya Pradesh',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black)),
                                                      Text('Chennai',
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
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  ld!.value[index].countryText,
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              _buildtextfields(
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
                                                          child: Text(
                                                              'Confirm'),
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
                                                    children: [
                                                      Text(
                                                        'Austria',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black),
                                                      ),
                                                      Text('Myanmar',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black)),
                                                      Text('Afghanistan',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black)),
                                                      Text('Bhutan',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black)),
                                                      Text('Pakistan',
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black)),
                                                      Text('India',
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
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  ld!.value[index].addressPostalCodeText,
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              _buildtextfields(
                                  hint: ld!.value[index].addressPostalCodeText,
                                  controller: postalCodeController,
                                  context: context),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    bottom: displayHeight(context) * 0.01),
                                child: Text(
                                  ld!.value[index].addressTypeText,
                                  style: TextStyle(
                                      color: Color(0xff010001),
                                      fontSize: displayWidth(context) * 0.04,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              _buildtextfields(
                                  hint: ld!.value[index].addressTypeText,
                                  controller: companyOptionalController,
                                  context: context),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: displayWidth(context) * 0.02,
                  left: displayWidth(context) * 0.02,
                  right: displayWidth(context) * 0.02),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: displayHeight(context) * 0.07,
                  margin: EdgeInsets.only(top: displayHeight(context) * 0.03),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => BadgeScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF88b14a),
                    ),
                    child: Text(
                      ld!.value[index].saveButtonText,
                      style: TextStyle(
                        fontSize: displayWidth(context) * 0.04,
                        color: Color(0xfffcfdfd),
                      ),
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

  Widget _buildtextfields({required String hint,
    required TextEditingController controller,
    required BuildContext context,
    bool? suffix,
    bool enable = true,
    Icon? suffixIcon,
    double? width,
    Function()? onTap,
    TextInputType? keyboard}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: displayHeight(context) * 0.07,
        width: width == null ? double.infinity : width,
        child: TextFormField(
            style: TextStyle(color: Color(0xff010001)),
            keyboardType: keyboard,
            controller: controller,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle:
                const TextStyle(fontSize: 17, color: Color(0xff9f9e9f)),
                border: InputBorder.none,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38, width: 1.0),
                ),
                enabled: enable == true ? true : false,
                suffixIcon: suffix != true ? null : suffixIcon,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38, width: 1.0),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38, width: 1.0),
                ))),
      ),
    );
  }
}
