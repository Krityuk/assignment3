import 'package:flutter/material.dart';
import 'package:flutterassignmentkrityuk/provider.dart';
import 'package:provider/provider.dart';

import 'landingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Products>(
      create: (context) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),
        debugShowCheckedModeBanner: false,
        home: const LandingPage(),
      ),
    );
  }
}
