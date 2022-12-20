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
          child: Hero(
            tag: "HeroOne",
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.user.images[0]),
                  fit: BoxFit.cover,
                  alignment: const Alignment(-0.3, 0),
                ),
              ),
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
              ),
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondRoute(user: widget.user),
            ),
          ),
        ),
      );

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
  final User user;
  const SecondRoute({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade400, Colors.black],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Hero(
              tag: "HeroOne",
              child: PageView.builder(
                itemCount: user.images.length,
                pageSnapping: true,
                itemBuilder: (context, pagePosition) {
                  return Container(
                      margin: EdgeInsets.all(10),
                      child: Image.network(user.images[pagePosition]));
                },
              ),
            ),
          ),
        ),
      ));
}



// Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Colors.blue.shade200, Colors.black])),
//       child: Scaffold(