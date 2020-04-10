import 'package:flutter/material.dart';
import 'package:real_estate/utils/constant.dart';
import 'package:real_estate/views/favorite/favorite.dart';
import 'package:real_estate/views/home/home.dart';
import 'package:real_estate/views/user/add_propery_view.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationWrapper();
  }
}

class NavigationWrapper extends StatefulWidget {
  @override
  _NavigationWrapperState createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  int _index = 0;

  static List<Widget> _widgetOption = <Widget>[
    Home(),
    Favorite(),
    AddPropertyView(),
  ];

  void _getNewIndex(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kprimary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
        ],
        currentIndex: _index,
        onTap: _getNewIndex,
      ),
      body: _widgetOption.elementAt(_index),
    );
  }
}
