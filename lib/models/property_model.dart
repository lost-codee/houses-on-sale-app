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
      this.feature});
}

final List<Property> properties = [
  Property(
    name: "Clinton Villa",
    city: "Los Angeles",
    area: 2456.0,
    price: 3500,
    review: 4.4,
    owner: Owner(imageUrl: "assets/img/p2.jpg", name: "James Miner"),
    purpose: "SALE",
    imageUrl: "assets/img/home_ext_1.jpg",
    feature: featureCopy,
  ),
  Property(
    name: "Hilton House",
    city: "California",
    area: 2100.0,
    price: 3100,
    review: 4.1,
    owner: Owner(imageUrl: "assets/img/p2.jpg", name: "James Miner"),
    purpose: "RENT",
    imageUrl: "assets/img/home_ext_2.jpg",
    feature: featureCopy,
  ),
  Property(
    name: "Ibe House",
    city: "Florida",
    area: 4100.0,
    price: 4500,
    review: 4.5,
    owner: Owner(
      imageUrl: "assets/img/p2.jpg",
      name: "James Miner",
    ),
    purpose: "SALE",
    imageUrl: "assets/img/home_ext_3.jpg",
    feature: featureCopy,
  ),
];
