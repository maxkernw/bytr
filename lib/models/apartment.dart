import 'package:bytr/models/address.dart';

class Apartment {
  final String landlord;
  final int rooms;
  final int sqm;
  final bool elevator;
  final int floor;
  final Address address;
  const Apartment(
      {required this.landlord,
      required this.rooms,
      required this.sqm,
      required this.elevator,
      required this.floor,
      required this.address});
}
