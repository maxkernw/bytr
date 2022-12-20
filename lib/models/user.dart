import 'apartment.dart';

class User {
  final String name;
  final Apartment apartment;
  final List<String> images;
  const User(
      {required this.name, required this.images, required this.apartment});
}
