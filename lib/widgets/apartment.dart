import 'package:flutter/material.dart';

import '../models/user.dart';

class ApartmentCard extends StatefulWidget {
  final User user;

  const ApartmentCard({Key? key, required this.user}) : super(key: key);

  @override
  State<ApartmentCard> createState() => _ApartmentCardState();
}

class _ApartmentCardState extends State<ApartmentCard> {
  @override
  Widget build(BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.user.image),
                      fit: BoxFit.cover,
                      alignment: const Alignment(-0.3, 0))),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.7, 1])),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Spacer(flex: 2),
                      buildName(),
                      const SizedBox(height: 8),
                      buildAdress()
                    ],
                  ),
                ),
              )),
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              )));

  Widget buildName() => Row(children: [
        Text(widget.user.name,
            style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        const SizedBox(width: 16),
      ]);

  buildAdress() => Row(children: [
        Text(
          widget.user.adress,
          style: const TextStyle(fontSize: 32, color: Colors.white),
        )
      ]);
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
