import 'package:bytr/providers/trade.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => TradeProvider(),
      child: MaterialApp(
        title: 'Bytr',
        color: Colors.purple.shade400,
        theme: ThemeData(
            primarySwatch: Colors.purple,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    elevation: 8, minimumSize: const Size.square(80)))),
        home: const Home(title: 'Bytr'),
      ));
}
