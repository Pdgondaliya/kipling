import 'package:flutter/material.dart';
import 'package:kipling/main.dart';
import 'package:kipling/module/tabbar_model.dart' as t;
import 'package:kipling/ui/badge_screen.dart';
import 'package:kipling/ui/login_screen.dart';
import 'package:kipling/ui/my_account_details.dart';
import 'package:kipling/ui/personal_details.dart';
import 'package:kipling/ui/voucher_details.dart';
import 'package:kipling/ui/voucher_screen.dart';

class BottomNavigation extends StatefulWidget {
  int? index;
  int? pageIndex;
  String? title;
  String? image;
  String? description;
  String? point;
  String? conditions;
  String? validity;
  String? customerId;
  String? templateId;

  BottomNavigation(
      {this.index,
      this.pageIndex,
      this.title,
      this.customerId,
      this.templateId,
      this.image,
      this.description,
      this.point,
      this.conditions,
      this.validity});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  t.TabBarModel? ld;

  @override
  void initState() {
    super.initState();
    ld = tabBarModelData;

    print('Tab Bar Data: $tabBarModelData');
    _selectedIndex = widget.index!;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      Container(), //0
      Container(), //1
      MyAccountDetails(), //2
      Container(), //3
      Container(), //4
      PersonalDetails(index: 2), //5
      BadgeScreen(), //6
      Voucher(), //7
      VoucherDetails(
        title: widget.title,
        customerId: widget.customerId,
        validity: widget.validity,
        description: widget.description,
        image: widget.image,
        conditions: widget.conditions,
        point: widget.point,
        templateId: widget.templateId
      ) //8
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        body: _children[widget.pageIndex!],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            unselectedLabelStyle:
                TextStyle(color: Colors.grey, fontFamily: 'Kipling_Regular'),
            selectedLabelStyle:
                TextStyle(color: Colors.black, fontFamily: 'Kipling_Bold'),
            items: ld!.value!.tabs!.map((e) {
              return BottomNavigationBarItem(
                  icon: Icon(e.icon == 'home'
                      ? Icons.home_outlined
                      : e.icon == 'local_mall'
                          ? Icons.shopping_bag_outlined
                          : e.icon == 'sentiment_satisfied_alt'
                              ? Icons.emoji_emotions_outlined
                              : e.icon == 'redeem'
                                  ? Icons.wallet_giftcard_outlined
                                  : e.icon == 'more_horiz'
                                      ? Icons.more_horiz
                                      : null),
                  label: index == 0 ? e.textEn : e.textNl);
            }).toList() /*[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions_outlined),
              label: 'Account'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_giftcard_outlined),
              label: 'Rewards'),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz), label: 'More'),
        ],*/
            ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
