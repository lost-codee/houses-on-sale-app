import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Features {
  String description;
  List<String> imagesUrls;
  List<Equipment> equipment;
  Features({this.description, this.equipment, this.imagesUrls});
}

class BedRoom extends Equipment {
  int number;
  BedRoom({this.number})
      : super(
          icon: FontAwesomeIcons.bed,
          type: "BedRoom",
        );
}

class Kitchen extends Equipment {
  int number;
  Kitchen({this.number})
      : super(
          icon: Icons.weekend,
          type: "Kitchen",
        );
}

class BathRoom extends Equipment {
  int number;
  BathRoom({this.number})
      : super(
          icon: FontAwesomeIcons.bath,
          type: "BathRoom",
        );
}

class Parking extends Equipment {
  int number;
  Parking({this.number})
      : super(
          icon: FontAwesomeIcons.parking,
          type: "Parking",
        );
}

class Equipment {
  String type;
  int number;
  IconData icon;
  Equipment({this.number, this.icon, this.type});

  void setNumber(int number) {
    this.number = number;
  }
}
