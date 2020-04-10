import 'package:flutter/material.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:real_estate/utils/constant.dart';

class AddPropertyPage1 extends StatefulWidget {
  AddPropertyPage1({Key key}) : super(key: key);

  @override
  _AddPropertyPage1State createState() => _AddPropertyPage1State();
}

class _AddPropertyPage1State extends State<AddPropertyPage1> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Property newProperty = Property();
    bool loading;
    String error = " ";
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
                        TextFormField(
                          decoration: TextInputDecoration.copyWith(
                              hintText: 'Street address *'),
                          validator: (val) =>
                              val.length >= 5 ? 'Enter at least 5 char' : null,
                          onChanged: (val) {
                            setState(() {
                              newProperty.address = val;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: TextInputDecoration.copyWith(
                              hintText: 'Units# optional'),
                          validator: (val) =>
                              val.length >= 5 ? 'Enter at least 5 char' : null,
                          onChanged: (val) {
                            setState(() {
                              newProperty.address = val;
                            });
                          },
                        ),
                        TextFormField(
                          decoration:
                              TextInputDecoration.copyWith(hintText: 'City'),
                          validator: (val) =>
                              val.length >= 5 ? 'Enter at least 5 char' : null,
                          onChanged: (val) {
                            setState(() {
                              newProperty.address = val;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: TextInputDecoration.copyWith(
                              hintText: 'Zip Code'),
                          validator: (val) =>
                              val.length >= 5 ? 'Enter at least 5 char' : null,
                          onChanged: (val) {
                            setState(() {
                              newProperty.address = val;
                            });
                          },
                        ),
                        SwitchListTile(
                            value: newProperty.isOwner,
                            title: const Text("owner"),
                            onChanged: (value) {
                              setState(() {
                                newProperty.isOwner = value;
                              });
                            }),
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
}
