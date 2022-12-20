import 'package:flutter/material.dart';

import '../models/user.dart';
import '../widgets/apartment.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = const User(name: '3 Rum 75 m2', adress: "Derpgatan 57", images: [
    "https://marknad.byggvesta.se/byggvesta/files/jpg/file13660.jpg",
    "https://marknad.byggvesta.se/byggvesta/files/jpg/file13659.jpg",
    "https://marknad.byggvesta.se/byggvesta/files/jpg/file13658.jpg",
    "https://marknad.byggvesta.se/byggvesta/files/jpg/file13657.jpg",
    "https://marknad.byggvesta.se/byggvesta/files/jpg/file12581.jpg",
    "https://marknad.byggvesta.se/byggvesta/files/jpg/file14655.jpg",
    "https://marknad.byggvesta.se/byggvesta/files/jpg/file14659.jpg"
  ]);

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade200, Colors.black])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              buildLogo(),
              const SizedBox(height: 16),
              Expanded(child: ApartmentCard(user: user)),
              const SizedBox(height: 16),
              buildButtons()
            ]),
          ),
        ),
      ));

  Widget buildLogo() => Row(
        children: const [
          Icon(
            Icons.local_pizza_rounded,
            color: Colors.white,
            size: 36,
          ),
          SizedBox(width: 4),
          Text(
            'Bytr',
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      );

  Widget buildButtons() =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton(
            onPressed: () {},
            child: const Icon(
              Icons.clear,
              color: Color.fromARGB(153, 244, 67, 54),
              size: 40,
            )),
        ElevatedButton(
            onPressed: () {},
            child: const Icon(
              Icons.star,
              color: Color.fromARGB(157, 255, 235, 59),
              size: 40,
            )),
        ElevatedButton(
            onPressed: () {},
            child: const Icon(
              Icons.favorite,
              color: Color.fromARGB(150, 76, 175, 79),
              size: 40,
            )),
      ]);
}
