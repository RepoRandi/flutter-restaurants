import 'package:google_maps_flutter/google_maps_flutter.dart';

class Restaurant {
  final String id;
  final String name;
  final String imageUrl;
  final String address;
  final LatLng location;
  final double rating;
  final List<Menu> menus;
  bool isFavorite;

  Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.location,
    required this.menus,
    this.isFavorite = false,
    required this.rating,
  });
}

class Menu {
  final String name;
  final double price;
  final String imageUrl;

  Menu({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
