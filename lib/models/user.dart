import 'address.dart';

class User {
  final String name;
  final Address address;
  final Apartment apartment;
  final List<String> images;
  const User(
      {required this.name,
      required this.address,
      required this.images,
      required this.apartment});
}

class Apartment {
  final String landlord;
  final int rooms;
  final int sqm;
  final bool elevator;
  final int floor;

  const Apartment(
      {required this.landlord,
      required this.rooms,
      required this.sqm,
      required this.elevator,
      required this.floor});
}
