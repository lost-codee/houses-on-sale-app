import 'package:real_estate/models/property_features_model.dart';

import 'owner_model.dart';

class Property {
  String name;
  String type;
  String city;
  int zipCode;
  String address;
  String imageUrl;
  double area;
  double review;
  int price;
  int rooms;
  String purpose;
  bool isOwner = true;
  Owner owner;
  Features feature;
  Property(
      {this.area,
      this.city,
      this.type,
      this.address,
      this.imageUrl,
      this.name,
      this.price,
      this.review,
      this.purpose,
      this.owner,
      this.isOwner,
      this.rooms,
      this.feature});
}
