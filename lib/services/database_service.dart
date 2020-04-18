import 'package:real_estate/models/owner_model.dart';
import 'package:real_estate/models/property_features_model.dart';
import 'package:real_estate/models/property_model.dart';

class DatabaseService {}

Features featureCopy = Features(
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    equipment: [
      BedRoom(number: 4),
      BathRoom(number: 4),
      Kitchen(number: 4),
      Parking(number: 4),
    ],
    imagesUrls: [
      "assets/img/home_int_1.jpg",
      "assets/img/home_int_2.jpg",
      "assets/img/home_int_3.jpg"
    ]);

final List<Property> properties = [
  Property(
    name: "Clinton Villa",
    city: "Los Angeles",
    area: 2456.0,
    price: 3500,
    review: 4.4,
    rooms: 5,
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
    rooms: 2,
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
    rooms: 1,
    owner: Owner(
      imageUrl: "assets/img/p2.jpg",
      name: "James Miner",
    ),
    purpose: "SALE",
    imageUrl: "assets/img/home_ext_3.jpg",
    feature: featureCopy,
  ),
];
