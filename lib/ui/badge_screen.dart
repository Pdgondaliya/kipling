import 'package:flutter/material.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/main.dart';
import 'package:kipling/ui/activated_badges.dart';
import 'package:kipling/ui/all_badges.dart';
import 'package:kipling/ui/personal_details.dart';
import 'package:kipling/ui/voucher_screen.dart';

class BadgeScreen extends StatefulWidget {
  const BadgeScreen({Key? key}) : super(key: key);

  @override
  _BadgeScreenState createState() => _BadgeScreenState();
}

class _BadgeScreenState extends State<BadgeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PersonalDetails())),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff84847e),
            ),
          ),
          actions: [
            Center(
              child: IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Voucher())),
                icon: Icon(Icons.ac_unit, color: Colors.black),
              ),
            )
          ],
          backgroundColor: Color(0xfffbfbfa),
          centerTitle: true,
          elevation: 0,
          title: Text(
            finalBadgeModel != [] ? 'My Collectables' : 'Badges',
            style:
                TextStyle(color: Color(0xff0f0e0e), fontFamily: 'Kipling_Bold'),
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
              borderSide: BorderSide(
                  color: finalBadgeModel != []
                      ? Color(0xff8ab250)
                      : Color(0xff0279fc),
                  width: 5),
            ),
            indicatorColor: Color(0xff0279fc),
            tabs: [
              Tab(
                text: finalBadgeModel.toString() != '[]'
                    ? 'All Collectables'
                    : 'All badges',
              ),
              Tab(
                text: 'Activated',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [AllBadges(), ActivatedBadges()],
        ),
      ),
    );
  }
}
