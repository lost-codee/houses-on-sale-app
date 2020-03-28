import 'package:flutter/material.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:real_estate/models/user_model.dart';
import 'package:real_estate/utils/constant.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    Property property = ModalRoute.of(context).settings.arguments as Property;
    Color favoriteColor =
        user.favorite.contains(property) ? Colors.redAccent : ksecondary;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Stack(
              children: <Widget>[
                FractionallySizedBox(
                  heightFactor: 0.52,
                  widthFactor: 1.0,
                  child: Hero(
                    tag: property.imageUrl,
                    child: Image.asset(
                      property.imageUrl,
                      colorBlendMode: BlendMode.darken,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: 0.52,
                  widthFactor: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.grey.withOpacity(0.0),
                              Colors.black54,
                            ],
                            stops: [
                              0.0,
                              1.0
                            ])),
                  ),
                ),
                Positioned(
                  top: 30.0,
                  left: 30.0,
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
                Positioned(
                  left: 40.0,
                  bottom: 40.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          color: ksecondary,
                          child: Text(
                            "FOR ${property.purpose}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        property.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 12.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          property.city,
                          style: TextStyle(
                            fontSize: 14.0,
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
                              size: 12.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "${property.area} sq/m",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ]),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 40.0,
                    right: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if (!user.favorite.contains(property)) {
                              user.favorite.add(property);
                              setState(() {
                                favoriteColor = Colors.redAccent;
                              });
                            } else {
                              user.favorite.remove(property);
                              setState(() {
                                favoriteColor = ksecondary;
                              });
                            }
                          },
                          child: Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.favorite,
                                size: 15.0,
                                color: favoriteColor,
                              )),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: ksecondary,
                              size: 12.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "${property.review} Reviews",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: 0.5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22.0),
                        topRight: Radius.circular(22.0)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircleAvatar(
                                    radius: 20.0,
                                    backgroundImage:
                                        AssetImage(property.owner.imageUrl),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      property.owner.name,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Owner",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[400],
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.black87,
                                    ),
                                    child: Icon(Icons.call,
                                        size: 15.0, color: Colors.white)),
                                SizedBox(
                                  width: 10.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("message");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.black87,
                                    ),
                                    child: Icon(
                                      Icons.message,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: property.feature.equipment
                                .asMap()
                                .entries
                                .map(
                                  (MapEntry map) => Column(
                                    children: <Widget>[
                                      Container(
                                          padding: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            color: Colors.grey[200],
                                          ),
                                          child: Icon(
                                            property.feature.equipment[map.key]
                                                .icon,
                                            color: Colors.black87,
                                          )),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "${property.feature.equipment[map.key].number} ${property.feature.equipment[map.key].type}",
                                        style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                )
                                .toList()),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          property.feature.description,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Photo",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 200.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: property.feature.imagesUrls.length,
                            itemBuilder: (BuildContext context, int index) {
                              String imageUrl =
                                  property.feature.imagesUrls[index];
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                margin: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
