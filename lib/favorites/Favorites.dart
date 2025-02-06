import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // Sample favorite dishes
  List<FavoriteItem> favoriteItems = [
    FavoriteItem("Grilled Chicken", 850, "assets/food2.jpeg"),
    FavoriteItem("Pasta Alfredo", 750, "assets/food2.jpeg"),
    FavoriteItem("Cheese Burger", 550, "assets/food2.jpeg"),
  ];

  // Method to remove an item from favorites
  void removeFromFavorites(int index) {
    setState(() {
      favoriteItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text(
          "Favorites",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: favoriteItems.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                    SizedBox(height: 10),
                    Text(
                      "No favorites yet!",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: favoriteItems.length,
                itemBuilder: (context, index) {
                  return favoriteCard(index);
                },
              ),
      ),
    );
  }

  // ✅ Favorite Item Card
  Widget favoriteCard(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              favoriteItems[index].imagePath,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favoriteItems[index].title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Rs.${favoriteItems[index].price}",
                  style: TextStyle(fontSize: 14, color: Colors.orange[900]),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () => removeFromFavorites(index),
          ),
        ],
      ),
    );
  }
}

// ✅ Model Class for Favorite Item
class FavoriteItem {
  String title;
  int price;
  String imagePath;

  FavoriteItem(this.title, this.price, this.imagePath);
}
