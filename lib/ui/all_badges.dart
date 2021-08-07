import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/main.dart';

class AllBadges extends StatefulWidget {
  const AllBadges({Key? key}) : super(key: key);

  @override
  _AllBadgesState createState() => _AllBadgesState();
}

class _AllBadgesState extends State<AllBadges> {
  List<AllBadgesModel> allBadgesModelList = [];

  @override
  void initState() {
    super.initState();
    allBadgesModelList.add(AllBadgesModel(
        image: 'assets/images/image.png',
        subTitle: '000 points',
        title: 'Badge Name'));
    allBadgesModelList.add(AllBadgesModel(
        image: 'assets/images/image.png',
        subTitle: '000 points',
        title: 'Badge Name'));
    allBadgesModelList.add(AllBadgesModel(
        image: 'assets/images/image.png',
        subTitle: '000 points',
        title: 'Badge Name'));
    allBadgesModelList.add(AllBadgesModel(
        image: 'assets/images/image.png',
        subTitle: '000 points',
        title: 'Badge Name'));
    allBadgesModelList.add(AllBadgesModel(
        image: 'assets/images/image.png',
        subTitle: '000 points',
        title: 'Badge Name'));
    allBadgesModelList.add(AllBadgesModel(
        image: 'assets/images/image.png',
        subTitle: '000 points',
        title: 'Badge Name'));
    allBadgesModelList.add(AllBadgesModel(
        image: 'assets/images/image.png',
        subTitle: '000 points',
        title: 'Badge Name'));
    allBadgesModelList.add(AllBadgesModel(
        image: 'assets/images/image.png',
        subTitle: '000 points',
        title: 'Badge Name'));
    allBadgesModelList.add(AllBadgesModel(
        image: 'assets/images/image.png',
        subTitle: '000 points',
        title: 'Badge Name'));
    allBadgesModelList.add(AllBadgesModel(
        image: 'assets/images/image.png',
        subTitle: '000 points',
        title: 'Badge Name'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: finalBadgeModel.toString() != '[]'
          ? GridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                  left: displayHeight(context) * 0.02,
                  right: displayHeight(context) * 0.02,
                  top: displayHeight(context) * 0.02),
              itemCount: finalBadgeModel!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: displayWidth(context) * 0.00295,
                  crossAxisSpacing: displayWidth(context) * 0.009,
                  mainAxisSpacing: displayWidth(context) * 0.00099),
              itemBuilder: (BuildContext context, int k) {
                return GestureDetector(
                  onTap: () => dialog1(
                      finalBadgeModel![k].url.toString(),
                      finalBadgeModel![k].title.toString(),
                      finalBadgeModel![k].description.toString(),
                      finalBadgeModel![k].point_needed.toString(),
                      finalBadgeModel![k].condition.toString()),
                  child: Column(
                    children: [
                      SizedBox(
                          width: displayWidth(context) * 0.30,
                          height: displayWidth(context) * 0.30,
                          child: Image.network(
                              finalBadgeModel![k].url.toString())),
                      SizedBox(height: displayWidth(context) * 0.005),
                      Text(
                        finalBadgeModel![k].title.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: displayHeight(context) * 0.02,
                            fontFamily: 'Kipling_Bold',),
                      ),
                      SizedBox(height: displayWidth(context) * 0.005),
                      Text(
                        finalBadgeModel![k].point_needed.toString(),
                        style: TextStyle(
                            color: Color(0xff8ab250),
                            fontSize: displayHeight(context) * 0.015,
                            fontFamily: 'Kipling_Regular'),
                      )
                    ],
                  ),
                );
              })
          : GridView.builder(
              padding: EdgeInsets.only(
                  left: displayHeight(context) * 0.02,
                  right: displayHeight(context) * 0.02,
                  top: displayHeight(context) * 0.02),
              itemCount: allBadgesModelList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: displayHeight(context) * 0.00099,
                  crossAxisSpacing: displayWidth(context) * 0.009,
                  mainAxisSpacing: displayWidth(context) * 0.0007),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => dialog(),
                  child: Column(
                    children: [
                      SizedBox(
                          width: displayWidth(context) * 0.30,
                          height: displayWidth(context) * 0.30,
                          child: Image.asset(
                              allBadgesModelList[index].image.toString())),
                      SizedBox(height: displayWidth(context) * 0.005),
                      Text(
                        allBadgesModelList[index].title.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: displayHeight(context) * 0.025,
                            fontFamily: 'Kipling_Bold'),
                      ),
                      SizedBox(height: displayWidth(context) * 0.005),
                      Text(
                        allBadgesModelList[index].subTitle.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: displayHeight(context) * 0.02,
                            fontFamily: 'Kipling_Bold'),
                      )
                    ],
                  ),
                );
              }),
    );
  }

  dialog() {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Dialog(
                  child: Container(
                    height: displayHeight(context) * 0.85,
                    padding: EdgeInsets.all(displayHeight(context) * 0.02),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: displayWidth(context) * 0.25,
                            height: displayWidth(context) * 0.25,
                            child: Image.asset('assets/images/image.png')),
                        SizedBox(height: displayWidth(context) * 0.005),
                        Text(
                          'Badge Name',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Kipling_Bold',
                              fontSize: displayHeight(context) * 0.04),
                        ),
                        Expanded(
                            flex: 7,
                            child: Text(
                                'Welcome to the city of Lights - Bonjour Paris! Paris monument-lined boulevards, museums, classical bistros and boutiques are enhanced by a  new wave of multimedia galleries.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Kipling_Regular',
                                    fontSize: displayHeight(context) * 0.02,
                                    color: Colors.black))),
                        SizedBox(height: displayWidth(context) * 0.005),
                        Text(
                          '000 points',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Kipling_Bold',
                              fontSize: displayHeight(context) * 0.04),
                        ),
                        SizedBox(height: displayWidth(context) * 0.005),
                        RaisedButton(
                          color: Color(0xff0279fc),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Kipling_Regular',
                              fontSize: displayHeight(context) * 0.03,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )));
  }

  dialog1(String image, String badgeName, String desc, String points,
      String condition) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Dialog(
              child: Container(
                height: displayHeight(context) * 0.68,
                padding: EdgeInsets.all(displayWidth(context) * 0.02),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: displayWidth(context) * 0.25,
                        height: displayWidth(context) * 0.25,
                        child: Image.network(
                          image,
                          fit: BoxFit.contain,
                        )),
                    Text(
                      'You have found',
                      style: TextStyle(
                          fontSize: displayHeight(context) * 0.02,
                          fontFamily: 'Kipling_Bold',
                          color: Color(0xff8ab250)),
                    ),
                    SizedBox(height: displayWidth(context) * 0.005),
                    Text(
                      badgeName,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Kipling_Bold',
                          fontSize: displayHeight(context) * 0.04),
                    ),
                    // SizedBox(height: 10),
                    // Flexible(
                    //     child: Align(
                    //       alignment: Alignment.center,
                    //       child: Html(
                    //         data: """
                    //       $desc
                    //       """,
                    //         style: {
                    //           "body": Style(
                    //             fontFamily: 'Kipling_Regular'
                    //           ),
                    //         },
                    //       ),
                    //     )),
                    Html(
                      data: """
                              $desc
                              """,
                      style: {
                        "body": Style(
                            fontFamily: 'Kipling_Regular',
                            textAlign: TextAlign.center),
                      },
                    ),
                    Html(
                      data: """
                              $condition
                              """,
                      style: {
                        "body": Style(
                            fontFamily: 'Kipling_Regular',
                            textAlign: TextAlign.center),
                      },
                    ),
                    // Flexible(
                    //     child: Align(
                    //       alignment: Alignment.center,
                    //       child: Html(
                    //         data: """
                    //       $condition
                    //       """,
                    //         style: {
                    //           "body": Style(
                    //               fontFamily: 'Kipling_Regular'
                    //           ),
                    //         },
                    //       ),
                    //     )),
                    SizedBox(height: displayWidth(context) * 0.005),
                    Text(
                      points,
                      // '000 points',
                      style: TextStyle(
                          color: Color(0xff8ab250),
                          fontFamily: 'Kipling_Bold',
                          fontSize: displayHeight(context) * 0.04),
                    ),
                    SizedBox(height: displayWidth(context) * 0.005),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: displayWidth(context) * 0.03),
                      color: Color(0xff2c2d2e),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Kipling_Regular',
                          fontSize: displayHeight(context) * 0.03,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}

class AllBadgesModel {
  String? title;
  String? subTitle;
  String? image;

  AllBadgesModel({this.title, this.image, this.subTitle});
}
