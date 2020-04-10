import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_estate/models/property_features_model.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:real_estate/utils/constant.dart';

class AddPropertyPage3 extends StatefulWidget {
  AddPropertyPage3({Key key, this.newProperty}) : super(key: key);

  Property newProperty;

  @override
  _AddPropertyPage3State createState() => _AddPropertyPage3State();
}

class _AddPropertyPage3State extends State<AddPropertyPage3> {
  final _formKey = GlobalKey<FormState>();
  Features newPropertyFeatures = Features();
  bool loading;
  String error = " ";
  String propertyType;
  Equipment equipment;
  List<Equipment> listEquipment = List<Equipment>();
  List<Equipment> dropButtonListEquipment = [
    BedRoom(),
    BathRoom(),
    Kitchen(),
    Parking()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Text(
                "Add Property",
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DropdownButton<String>(
                        hint: Text(propertyType ?? ""),
                        items: <String>[
                          'Apartment',
                          'Multi Family',
                          'TownHouse',
                          'Villa'
                        ].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            propertyType = val;
                          });
                        },
                      ),
                      listEquipment.length > 0
                          ? Column(
                              children: listEquipment
                                  .asMap()
                                  .entries
                                  .map((MapEntry map) => Row(
                                        children: <Widget>[
                                          Icon(listEquipment[map.key].icon),
                                          Flexible(
                                            child: TextFormField(
                                              decoration:
                                                  TextInputDecoration.copyWith(
                                                      hintText:
                                                          listEquipment[map.key]
                                                              .type),
                                              validator: (val) =>
                                                  val.length >= 5
                                                      ? 'Enter at least 5 char'
                                                      : null,
                                              onChanged: (val) {
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          IconButton(
                                              icon: Icon(Icons.cancel),
                                              onPressed: () => setState(() {
                                                    dropButtonListEquipment.add(
                                                        listEquipment[map.key]);
                                                    listEquipment.removeLast();
                                                  }))
                                        ],
                                      ))
                                  .toList(),
                            )
                          : Text(""),
                      Row(
                        children: <Widget>[
                          DropdownButton<Equipment>(
                            hint: Text("Add Rooms"),
                            items:
                                dropButtonListEquipment.map((Equipment value) {
                              return new DropdownMenuItem<Equipment>(
                                value: value,
                                child: new Text(value.type),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                equipment = val;
                              });
                            },
                          ),
                          Flexible(
                              child: RaisedButton(
                            color: kprimary,
                            onPressed: () {
                              setState(() {
                                int index =
                                    dropButtonListEquipment.indexOf(equipment);
                                dropButtonListEquipment.removeAt(index);
                                print(index);
                                listEquipment.add(equipment);
                              });
                            },
                            child: Text("Add"),
                          )),
                        ],
                      ),
                      TextFormField(
                        decoration: TextInputDecoration.copyWith(
                            hintText: "Phone number"),
                        validator: (val) =>
                            val.length >= 5 ? 'Enter at least 5 char' : null,
                        onChanged: (val) {
                          setState(() {});
                        },
                      ),
                      RaisedButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 110.0, vertical: 15.0),
                          color: kprimary,
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              setState(() {
                                error = 'Connexion erreur';
                                loading = false;
                              });
                            }
                          }),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ]),
              )
            ])));
  }
}
