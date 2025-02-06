import 'package:flutter/material.dart';
import 'package:restaurant_app/cart/cart.dart';
import 'package:restaurant_app/favorites/Favorites.dart';
import 'package:restaurant_app/products/productDetails.dart';
import 'package:restaurant_app/started/get_started.dart';
import 'package:restaurant_app/home/home.dart';
import 'package:restaurant_app/cart/AddToCart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/productDetails') {
          final args = settings.arguments as Map<String, String>;

          return MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              title: args['title']!,
              price: args['price']!,
              imagePath: args['imagePath']!,
            ),
          );
        }
        return null; // Default fallback
      },
      routes: {
        '/': (context) => GetStarted(),
        '/home': (context) => Home(),
        '/orders': (context) => EmptyOrdersScreen(),
        '/addcart': (context) => CartPage(),
        '/favorites': (context) => FavoritesPage()
      },
    );
  }
}
