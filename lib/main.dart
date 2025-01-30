import 'package:flutter/material.dart';
import 'package:restaurant_app/cart/cart.dart';
import 'started/get_started.dart';
import 'home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => GetStarted(),
        '/home': (context) => Home(),
        '/orders': (context) => EmptyOrdersScreen(),
      },
    );
  }
}
