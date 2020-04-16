import 'package:flutter/material.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:real_estate/models/user_model.dart';
import 'package:real_estate/utils/constant.dart';
import 'package:real_estate/utils/debouncer.dart';
import 'package:real_estate/widgets/Property_showcase.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Property> filteredProperties = List();

  bool search = false;

  PersistentBottomSheetController _controller;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      filteredProperties = properties;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.grey[400],
                      size: 16.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(user.city, style: kStyle2),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Hello ${user.name}",
                      style: TextStyle(
                        fontSize: 27.0,
                        color: Color(0xff262627),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.6,
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      child: ClipRRect(
                        child: Image.asset(
                          user.imageUrl,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff459ee8), width: 1.5)),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xff459ee8),
                      ),
                    ),
                    onChanged: (string) {
                      _debouncer.run(() {
                        setState(() {
                          filteredProperties = properties
                              .where((u) => (u.city
                                      .toLowerCase()
                                      .contains(string.toLowerCase()) ||
                                  u.name
                                      .toLowerCase()
                                      .contains(string.toLowerCase())))
                              .toList();
                        });
                      });
                    },
                  ),
                ),
                IconButton(
                  onPressed: () => null, //_settingModalBottomSheet(context),
                  icon: Icon(
                    Icons.filter_list,
                    color: Color(0xff459ee8),
                  ),
                ),
              ],
            ),
          ),
          filteredProperties.length != properties.length
              ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${filteredProperties.length} Results Found",
                          style: TextStyle(
                              color: kdark,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )
              : Container(),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: filteredProperties.length,
                itemBuilder: (BuildContext context, int index) {
                  Property property = filteredProperties[index];
                  return BuildPropertyShowcase(property);
                }),
          ),
        ],
      ),
    )));
  }
}
