import 'address.dart';

class User {
  final String name;
  final Address address;
  final List<String> images;
  const User({required this.name, required this.address, required this.images});
}
