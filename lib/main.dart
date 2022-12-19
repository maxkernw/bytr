import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Bytr',
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    elevation: 8,
                    shape: const CircleBorder(),
                    minimumSize: const Size.square(80)))),
        home: const Home(title: 'Bytr'),
      );
}
