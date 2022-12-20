import 'package:bytr/providers/trade.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            child: Column(
              children: [
                buildLogo(),
                const SizedBox(height: 16),
                Expanded(child: buildCards()),
                const SizedBox(height: 16),
                buildButtons()
              ],
            ),
          ),
        ),
      ));
  Widget buildCards() {
    final provider = Provider.of<TradeProvider>(context);
    final users = provider.users;

    return users.isEmpty
        ? Center(
            child: ElevatedButton(
              child: const Text("Börja om"),
              onPressed: () {
                final provider =
                    Provider.of<TradeProvider>(context, listen: false);
                provider.resetTrades();
              },
            ),
          )
        : Stack(
            children: users
                .map((user) => ApartmentCard(
                      user: user,
                      isFirst: users.last == user,
                    ))
                .toList(),
          );
  }

  Widget buildLogo() => Row(
        children: const [
          Icon(
            Icons.home_filled,
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
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<TradeProvider>(context, listen: false);
              provider.like();
            },
            child: const Text(
              "Intresserad",
              style: TextStyle(color: Colors.white),
            )),
        ElevatedButton(
          onPressed: () {
            final provider = Provider.of<TradeProvider>(context, listen: false);
            provider.dislike();
          },
          child: const Text(
            "Ej Intresserad",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ]);
}
