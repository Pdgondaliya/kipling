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
                childAspectRatio: displayHeight(context) * 0.00099,
                crossAxisSpacing: displayWidth(context) * 0.009,
                mainAxisSpacing: displayWidth(context) * 0.0007),
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
                        child: Image.network(finalActivatedBadgeModel![k].url
                            .toString())),
                    SizedBox(height: 10),
                    Text(
                      finalActivatedBadgeModel![k].title.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: displayHeight(context) * 0.025,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Text(
                      finalActivatedBadgeModel![k].point_needed
                          .toString(),
                      style: TextStyle(
                          color: Color(0xff8ab250),
                          fontSize: displayHeight(context) * 0.02,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              );
            })

        /*ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: badgeDetailsData!.length,
          itemBuilder: (BuildContext context, int i) {
            return ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: badgeDetailsData![i].contents!.length,
                itemBuilder: (BuildContext context, int j) {
                  return
                });
          }),*/
        );
  }

  dialog(String image, String badgeName, String desc, String points,
      String condition) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Dialog(
                  child: Container(
                    height: displayHeight(context) * 0.7,
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
                            width: displayWidth(context) * 0.35,
                            height: displayWidth(context) * 0.35,
                            child: Image.network(image)),
                        Text(
                          'You have found',
                          style: TextStyle(
                              fontSize: displayHeight(context) * 0.02,
                              color: Color(0xff8ab250)),
                        ),
                        SizedBox(height: 10),
                        Text(
                          badgeName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: displayHeight(context) * 0.04),
                        ),
                        // SizedBox(height: 10),
                        Expanded(
                            child: Align(
                          alignment: Alignment.center,
                          child: Html(
                            data: """
                              $desc
                              """,
                            // child: Text(desc,
                            //     // 'Welcome to the city of Lights - Bonjour Paris! Paris monument-lined boulevards, museums, classical bistros and boutiques are enhanced by a  new wave of multimedia galleries.',
                            //     textAlign: TextAlign.center,
                            //     style: TextStyle(
                            //         fontSize: displayHeight(context) * 0.02,
                            //         color: Colors.black)),
                          ),
                        )),
                        // SizedBox(height: 10),
                        Expanded(
                            child: Align(
                          alignment: Alignment.center,
                          child: Html(
                            data: """
                              $condition
                              """,
                            // child: Text(desc,
                            //     // 'Welcome to the city of Lights - Bonjour Paris! Paris monument-lined boulevards, museums, classical bistros and boutiques are enhanced by a  new wave of multimedia galleries.',
                            //     textAlign: TextAlign.center,
                            //     style: TextStyle(
                            //         fontSize: displayHeight(context) * 0.02,
                            //         color: Colors.black)),
                          ),
                        )),
                        Text(
                          points,
                          // '000 points',
                          style: TextStyle(
                              color: Color(0xff8ab250),
                              fontWeight: FontWeight.bold,
                              fontSize: displayHeight(context) * 0.04),
                        ),
                        SizedBox(height: 10),
                        RaisedButton(
                          color: Color(0xff2c2d2e),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: Colors.white,
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
