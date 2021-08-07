import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/main.dart';

class ActivatedBadges extends StatefulWidget {
  const ActivatedBadges({Key? key}) : super(key: key);

  @override
  _ActivatedBadgesState createState() => _ActivatedBadgesState();
}

class _ActivatedBadgesState extends State<ActivatedBadges> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('gyfhgghjgtyg: ${badgeDetailsData!.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                left: displayHeight(context) * 0.02,
                right: displayHeight(context) * 0.02,
                top: displayHeight(context) * 0.02),
            itemCount: finalActivatedBadgeModel!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: displayWidth(context) * 0.00295,
                crossAxisSpacing: displayWidth(context) * 0.009,
                mainAxisSpacing: displayWidth(context) * 0.00099),
            itemBuilder: (BuildContext context, int k) {
              return GestureDetector(
                onTap: () => dialog(
                    finalActivatedBadgeModel![k].url.toString(),
                    finalActivatedBadgeModel![k].title.toString(),
                    finalActivatedBadgeModel![k].description.toString(),
                    finalActivatedBadgeModel![k].point_needed.toString(),
                    finalActivatedBadgeModel![k].condition.toString()),
                child: Column(
                  children: [
                    SizedBox(
                        width: displayWidth(context) * 0.30,
                        height: displayWidth(context) * 0.30,
                        child: Image.network(
                            finalActivatedBadgeModel![k].url.toString())),
                    SizedBox(height: displayWidth(context) * 0.005),
                    Text(
                      finalActivatedBadgeModel![k].title.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: displayHeight(context) * 0.02,
                        fontFamily: 'Kipling_Bold',
                      ),
                    ),
                    SizedBox(height: displayWidth(context) * 0.005),
                    Text(
                      finalActivatedBadgeModel![k].point_needed.toString(),
                      style: TextStyle(
                          color: Color(0xff8ab250),
                          fontSize: displayHeight(context) * 0.015,
                          fontFamily: 'Kipling_Regular'),
                    )
                  ],
                ),
              );
            }));
  }

  dialog(String image, String badgeName, String desc, String points,
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
                              size: 20,
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
