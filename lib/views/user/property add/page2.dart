import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/models/property_features_model.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:real_estate/utils/constant.dart';

class AddPropertyPage2 extends StatefulWidget {
  AddPropertyPage2({Key key, this.newProperty}) : super(key: key);

  Property newProperty;

  @override
  _AddPropertyPage2State createState() => _AddPropertyPage2State();
}

class _AddPropertyPage2State extends State<AddPropertyPage2> {
  final _formKey = GlobalKey<FormState>();
  Features newPropertyFeatures = Features();
  bool loading;
  String error = " ";
  List<File> _images = [];
  File _image;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      try {
        _images.add(selected);
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: TextInputDecoration.copyWith(
                      hintText: 'Area Surface in m²*'),
                  validator: (val) =>
                      val.length >= 5 ? 'Enter at least 5 char' : null,
                  onChanged: (val) {
                    setState(() {
                      widget.newProperty.price = int.parse(val);
                    });
                  },
                ),
                TextFormField(
                  decoration:
                      TextInputDecoration.copyWith(hintText: 'Set Your Price*'),
                  validator: (val) =>
                      val.length >= 5 ? 'Enter at least 5 char' : null,
                  onChanged: (val) {
                    setState(() {
                      widget.newProperty.price = int.parse(val);
                    });
                  },
                ),
                Text("Photos"),
                Text("Click on a photo to add a caption or delete photo"),
                _images.length == 0
                    ? Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[400])),
                        child: Column(
                          children: <Widget>[
                            Text('No image selected.'),
                            FlatButton(
                              color: kprimary,
                              onPressed: () async =>
                                  _pickImage(ImageSource.gallery),
                              child: Text(
                                "Add New Photos",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        height: 150.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _images.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Container(
                                padding: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey[400])),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text('No image selected.'),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    FlatButton(
                                      color: kprimary,
                                      onPressed: () async =>
                                          _pickImage(ImageSource.gallery),
                                      child: Text(
                                        "Add New Photos",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return Stack(
                              children: <Widget>[
                                Image.file(_images[index - 1],
                                    width: 150.0, height: 150.0),
                                Container(
                                  width: 150.0,
                                  height: 50.0,
                                  color: Colors.black45,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    index == 1
                                        ? Text(
                                            "Main Photo",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          )
                                        : Text(""),
                                    SizedBox(
                                      width: 30.0,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.white70,
                                      ),
                                      onPressed: () => setState(() {
                                        _images.removeAt(index - 1);
                                      }),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                      ),
                RaisedButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 110.0, vertical: 15.0),
                    color: kprimary,
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
        ),
      ),
    );
  }
}
