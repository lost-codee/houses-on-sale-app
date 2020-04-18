import 'package:flutter/material.dart';
import 'package:real_estate/models/property_features_model.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:real_estate/services/database_service.dart';
import 'package:real_estate/utils/constant.dart';

class AddPropertyPage3 extends StatefulWidget {
  final Function changePages;
  final Function updateProperty;
  Property newProperty;

  AddPropertyPage3({this.newProperty, this.changePages, this.updateProperty});
  @override
  _AddPropertyPage3State createState() => _AddPropertyPage3State();
}

class _AddPropertyPage3State extends State<AddPropertyPage3> {
  final _formKey = GlobalKey<FormState>();
  Features newPropertyFeatures = Features();
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
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DropdownButton<String>(
              isExpanded: true,
              hint: Text(widget.newProperty.type ?? "Choose Home Type"),
              items: <String>['Apartment', 'Multi Family', 'TownHouse', 'Villa']
                  .map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  widget.newProperty.type = val;
                });
              },
            ),
            Column(
              children: listEquipment
                  .asMap()
                  .entries
                  .map((MapEntry map) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              listEquipment[map.key].icon,
                              color: ksecondary,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: TextInputDecoration.copyWith(
                                    hintText: "Number of " +
                                        listEquipment[map.key].type),
                                validator: (val) =>
                                    val.length <= 0 ? 'Field is empty' : null,
                                onChanged: (val) {
                                  listEquipment[map.key]
                                      .setNumber(int.parse(val));
                                },
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: kprimary,
                                ),
                                onPressed: () => setState(() {
                                      dropButtonListEquipment
                                          .add(listEquipment[map.key]);
                                      listEquipment.removeLast();
                                    }))
                          ],
                        ),
                      ))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: DropdownButton<Equipment>(
                    isExpanded: true,
                    hint: Text("Add Rooms"),
                    items: dropButtonListEquipment.map((Equipment value) {
                      return new DropdownMenuItem<Equipment>(
                        value: value,
                        child: new Text(value.type),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        equipment = val;
                        int index = dropButtonListEquipment.indexOf(equipment);
                        dropButtonListEquipment.removeAt(index);
                        listEquipment.add(equipment);
                      });
                    },
                  ),
                ),
              ],
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration:
                  TextInputDecoration.copyWith(hintText: "Phone number"),
              validator: (val) =>
                  val.length == 10 ? 'Enter 10 digits phone number' : null,
              onChanged: (val) {
                widget.newProperty.owner.phoneNumber = int.parse(val);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                    child: Text(
                      'Previous',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400]),
                    ),
                    onPressed: () {
                      widget.updateProperty(widget.newProperty);
                      widget.changePages(2);
                    }),
                RaisedButton(
                    color: kprimary,
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        widget.newProperty.feature.equipment = listEquipment;
                        properties.add(widget.newProperty);
                        widget.updateProperty(widget.newProperty);
                        widget.changePages(3);
                      }
                    }),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            )
          ]),
    );
  }
}
