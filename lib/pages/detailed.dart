import 'package:flutter/material.dart';

import '../models/user.dart';
import '../widgets/address.dart';

class DetailedView extends StatelessWidget {
  final User user;
  const DetailedView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade400, Colors.purple.shade900],
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
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network(user.images[pagePosition]),
                          ),
                          AddressWidget(
                            user: user,
                          )
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
