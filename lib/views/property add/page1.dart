import 'package:flutter/material.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:real_estate/utils/constant.dart';

class AddPropertyPage1 extends StatefulWidget {
  final Function changePages;
  final Function updateProperty;
  Property newProperty;

  AddPropertyPage1({this.newProperty, this.changePages, this.updateProperty});

  @override
  _AddPropertyPage1State createState() => _AddPropertyPage1State();
}

class _AddPropertyPage1State extends State<AddPropertyPage1> {
  final _formKey = GlobalKey<FormState>();
  String error = " ";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: TextInputDecoration.copyWith(
                labelText: 'Street address *',
              ),
              onChanged: (val) {
                setState(() {
                  widget.newProperty.address = val;
                });
              },
            ),
            TextFormField(
              decoration:
                  TextInputDecoration.copyWith(labelText: 'Units# optional'),
              onChanged: (val) {
                setState(() {
                  widget.newProperty.address += " " + val;
                });
              },
            ),
            //TODO :This will become a dropbox with cities
            TextFormField(
              decoration: TextInputDecoration.copyWith(labelText: 'City'),
              onChanged: (val) {
                setState(() {
                  widget.newProperty.city = val;
                });
              },
            ),
            TextFormField(
              decoration: TextInputDecoration.copyWith(labelText: 'Zip Code'),
              onChanged: (val) {
                setState(() {
                  widget.newProperty.zipCode = int.parse(val);
                });
              },
            ),
            SwitchListTile(
                value: widget.newProperty.isOwner,
                title: const Text("owner"),
                activeColor: kprimary,
                onChanged: (value) {
                  setState(() {
                    widget.newProperty.isOwner = value;
                  });
                }),
            RaisedButton(
                padding:
                    EdgeInsets.symmetric(horizontal: 120.0, vertical: 15.0),
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
                    widget.updateProperty(widget.newProperty);
                    widget.changePages(2);
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
    );
  }
}
