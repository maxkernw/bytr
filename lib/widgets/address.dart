import 'package:flutter/material.dart';

import '../models/user.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.apartment.landlord,
                style: const TextStyle(fontSize: 22, color: Colors.white)),
            Text(
              user.apartment.address.street,
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
            Text(
              "${user.apartment.address.postalcode} ${user.apartment.address.city}",
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kvm: ${user.apartment.sqm}",
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  "Rum: ${user.apartment.rooms}",
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Våning: ${user.apartment.floor}",
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  "Hiss: ${user.apartment.elevator ? 'ja' : 'nej'}",
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      );
}
