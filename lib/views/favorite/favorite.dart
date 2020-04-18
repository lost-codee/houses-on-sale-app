import 'package:flutter/material.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:real_estate/services/user_service.dart';
import 'package:real_estate/widgets/Property_showcase.dart';

class Favorite extends StatefulWidget {
  Favorite({Key key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Favorites",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            user.favorite.length > 0
                ? Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: user.favorite.length,
                        itemBuilder: (BuildContext context, int index) {
                          Property property = user.favorite[index];
                          return BuildPropertyShowcase(property);
                        }),
                  )
                : Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "No Favorite Founds",
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.grey[600]),
                      ),
                    ),
                  )
          ],
        ),
      )),
    );
  }
}
