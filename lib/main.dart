import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'search_result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DDI Checker',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: StartScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == '/searchResult') {
          final List<String> drugs = settings.arguments as List<String>;
          return MaterialPageRoute(
            builder: (context) {
              return SearchResultScreen(drugs: drugs);
            },
          );
        }
        // Default route
        return MaterialPageRoute(builder: (context) => StartScreen());
      },
    );
  }
}
