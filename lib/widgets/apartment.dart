import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../pages/detailed.dart';
import '../providers/trade.provider.dart';

class ApartmentCard extends StatefulWidget {
  final User user;
  final bool isFirst;

  const ApartmentCard({Key? key, required this.user, required this.isFirst})
      : super(key: key);

  @override
  State<ApartmentCard> createState() => _ApartmentCardState();
}

class _ApartmentCardState extends State<ApartmentCard> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<TradeProvider>(context, listen: false);

      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) =>
      SizedBox.expand(child: widget.isFirst ? buildFrontCard() : buildCard());

  Widget buildFrontCard() => GestureDetector(
        child: LayoutBuilder(builder: (context, constraints) {
          final provider = Provider.of<TradeProvider>(context);
          final position = provider.position;
          final ms = provider.isDragging ? 0 : 250;
          final center = constraints.smallest.center(Offset.zero);
          final angle = provider.angle * pi / 180;
          final rotatedMatrix = Matrix4.identity()
            ..translate(center.dx, center.dy)
            ..rotateZ(angle)
            ..translate(-center.dx, -center.dy);
          return AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: ms),
            transform: rotatedMatrix..translate(position.dx, position.dy),
            child: buildCard(),
          );
        }),
        onPanStart: (details) {
          final provider = Provider.of<TradeProvider>(context, listen: false);

          provider.startPosition(details);
        },
        onPanUpdate: (details) {
          final provider = Provider.of<TradeProvider>(context, listen: false);

          provider.updatePosition(details);
        },
        onPanEnd: (details) {
          final provider = Provider.of<TradeProvider>(context, listen: false);

          provider.endPosition();
        },
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedView(user: widget.user),
          ),
        ),
      );
  Widget buildCard() => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Hero(
          tag: widget.user.name,
          child: Material(
            type: MaterialType.transparency,
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
                    children: [const Spacer(flex: 2), buildAdress()],
                  ),
                ),
              ),
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

  buildAdress() => Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.user.apartment.landlord,
                style: const TextStyle(fontSize: 22, color: Colors.white)),
            Text(
              widget.user.address.street,
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
            Text(
              "${widget.user.address.postalcode} ${widget.user.address.city}",
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kvm: ${widget.user.apartment.sqm}",
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  "Rum: ${widget.user.apartment.rooms}",
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Våning: ${widget.user.apartment.floor}",
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  "Hiss: ${widget.user.apartment.elevator ? 'ja' : 'nej'}",
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      );
}
