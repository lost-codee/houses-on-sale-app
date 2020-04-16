import 'package:flutter/material.dart';
import 'package:real_estate/models/property_features_model.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:real_estate/views/property%20add/page1.dart';
import 'package:real_estate/views/property%20add/page2.dart';
import 'page3.dart';

class AddPropertyView extends StatefulWidget {
  AddPropertyView({Key key}) : super(key: key);

  @override
  _AddPropertyViewState createState() => _AddPropertyViewState();
}

class _AddPropertyViewState extends State<AddPropertyView> {
  Property newProperty = Property(
      isOwner: true,
      feature: Features(
        equipment: [],
      ));
  int page = 1;

  changePage(int p) {
    setState(() {
      page = p;
    });
  }

  updateProperty(p) {
    setState(() {
      newProperty = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Add Property",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                    child: page == 1
                        ? AddPropertyPage1(
                            newProperty: newProperty,
                            changePages: changePage,
                            updateProperty: updateProperty,
                          )
                        : page == 2
                            ? AddPropertyPage2(
                                changePages: changePage,
                                updateProperty: updateProperty,
                                newProperty: newProperty,
                              )
                            : AddPropertyPage3(
                                changePages: changePage,
                                updateProperty: updateProperty,
                                newProperty: newProperty,
                              )),
              ],
            )));
  }
}
