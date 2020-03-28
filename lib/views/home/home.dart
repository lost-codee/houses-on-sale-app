import 'dart:async';

import 'package:flutter/material.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:real_estate/models/user_model.dart';
import 'package:real_estate/utils/constant.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

double _value = 500.0;

List<String> _filterRooms = ["Any", "1", "2", "3+"];

int _currentFilterRoom = 1;

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

  Widget _settingModalBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, state) {
            var label;
            return FractionallySizedBox(
                heightFactor: 0.65,
                child: Container(
                    padding: EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0)),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Filter ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Text(
                                "your search",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Price ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                                  ),
                                  Text(
                                    "your Range",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 17.0),
                                  ),
                                ],
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: kprimary,
                                  inactiveTrackColor: Colors.grey[400],
                                  trackHeight: 3.5,
                                  thumbColor: kprimary,
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 8.0),
                                  overlayColor: Colors.purple.withAlpha(32),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 14.0),
                                ),
                                child: Slider(
                                  onChanged: (value) => state(() {
                                    _value = value;
                                  }),
                                  label: label,
                                  value: _value,
                                  max: 1000,
                                  min: 70,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Rooms ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: _filterRooms
                                          .asMap()
                                          .entries
                                          .map(
                                            (MapEntry map) => GestureDetector(
                                              onTap: () => state(() {
                                                _currentFilterRoom = map.key;
                                                print(_currentFilterRoom);
                                              }),
                                              child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 25.0),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            _currentFilterRoom !=
                                                                    map.key
                                                                ? Colors
                                                                    .grey[400]
                                                                : kprimary),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: _currentFilterRoom ==
                                                            map.key
                                                        ? kprimary
                                                        : kwhite,
                                                  ),
                                                  child: Text(
                                                    _filterRooms[map.key],
                                                    style: TextStyle(
                                                        color:
                                                            _currentFilterRoom ==
                                                                    map.key
                                                                ? kwhite
                                                                : kdark),
                                                  )),
                                            ),
                                          )
                                          .toList()),
                                ],
                              )
                            ],
                          ),
                        ])));
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
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
                  onPressed: () => _settingModalBottomSheet(context),
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
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/details",
                        arguments: property),
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(-3.0, 3.0),
                              blurRadius: 10.0,
                            )
                          ]),
                      child: Stack(
                        children: <Widget>[
                          FractionallySizedBox(
                            heightFactor: 1.0,
                            widthFactor: 1.0,
                            child: Hero(
                              tag: property.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image(
                                  image: AssetImage(property.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          FractionallySizedBox(
                            heightFactor: 1.0,
                            widthFactor: 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.transparent, Colors.black87],
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 15.0,
                              left: 15.0,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  color: ksecondary,
                                  child: Text(
                                    "FOR ${property.purpose}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ))),
                          Positioned(
                            left: 10.0,
                            bottom: 12.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  property.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    size: 10.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    property.city,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        color: Colors.white,
                                        size: 10.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "${property.area} sq/m",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ]),
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 12.0,
                              right: 25.0,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "\$${property.price}.00",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.2),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: ksecondary,
                                        size: 10.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "${property.review} Reviews",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    )));
  }
}
