import 'package:flutter/material.dart';
import 'package:kipling/MediaQuery/get_mediaquery.dart';
import 'package:kipling/ui/activated_badges.dart';
import 'package:kipling/ui/all_badges.dart';

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
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff84847e),
            ),
          ),
          backgroundColor: Color(0xfffbfbfa),
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Badges',
            style:
            TextStyle(color: Color(0xff0f0e0e), fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Color(0xff9f9e9f),
            unselectedLabelStyle: TextStyle(
                fontSize: displayWidth(context) * 0.05,
                color: Color(0xff9f9e9f),
                ),
            labelStyle: TextStyle(
                fontSize: displayWidth(context) * 0.05,
                color: Colors.black,
                ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Color(0xff0279fc), width: 5),
            ),
            indicatorWeight: 15,
            indicatorColor: Color(0xff0279fc),
            tabs: [
              Tab(
                text: 'All badges',
              ),
              Tab(
                text: 'Activated',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllBadges(),
            ActivatedBadges()
          ],
        ),
      ),
    );
  }
}
