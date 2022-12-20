import 'package:flutter/material.dart';

import '../models/user.dart';

class DetailedView extends StatelessWidget {
  final User user;
  const DetailedView({Key? key, required this.user}) : super(key: key);

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
                tag: user.name,
                child: Material(
                  type: MaterialType.transparency,
                  child: PageView.builder(
                    itemCount: user.images.length,
                    pageSnapping: true,
                    itemBuilder: (context, pagePosition) => Container(
                      margin: const EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network(user.images[pagePosition]),
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kvm: ${user.apartment.sqm}",
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontSize: 23, color: Colors.white),
                                    ),
                                    Text(
                                      "Rum: ${user.apartment.rooms}",
                                      style: const TextStyle(
                                          fontSize: 23, color: Colors.white),
                                    ),
                                    Text(
                                      "Våning: ${user.apartment.floor}",
                                      style: const TextStyle(
                                          fontSize: 23, color: Colors.white),
                                    ),
                                    Text(
                                      "Hiss: ${user.apartment.elevator ? 'ja' : 'nej'}",
                                      style: const TextStyle(
                                          fontSize: 23, color: Colors.white),
                                    )
                                  ]))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
