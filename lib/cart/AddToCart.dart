import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem("Veggie Tomato Mix", 650, "assets/food2.jpeg", 1),
    CartItem("Fish with Mix Orange", 650, "assets/food2.jpeg", 1),
    CartItem("Veggie Tomato Mix", 650, "assets/food2.jpeg", 1),
  ];

  // Method to update quantity
  void updateQuantity(int index, int change) {
    setState(() {
      cartItems[index].quantity += change;
      if (cartItems[index].quantity < 1) {
        cartItems[index].quantity = 1; // Prevent negative or zero quantity
      }
    });
  }

  // Method to remove item
  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Top Bar with Back Button & Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "Cart",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 40),
                ],
              ),

              SizedBox(height: 10),

              // ✅ Swipe Hint
              Center(
                child: Column(
                  children: [
                    Icon(Icons.swipe, color: Colors.grey, size: 20),
                    Text(
                      "Swipe on an item to delete",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // ✅ Cart Items
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(cartItems[index].title),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        removeItem(index);
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.orange[900],
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      child: cartItem(index),
                    );
                  },
                ),
              ),

              SizedBox(height: 10),

              // ✅ "Complete Order" Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Handle order completion
                  },
                  child: Text(
                    "Complete Order",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Cart Item Widget with Quantity Controls
  Widget cartItem(int index) {
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
            child: Image.asset(cartItems[index].imagePath,
                height: 50, width: 50, fit: BoxFit.cover),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartItems[index].title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Rs.${cartItems[index].price * cartItems[index].quantity}",
                    style: TextStyle(fontSize: 14, color: Colors.orange[900])),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle, color: Colors.orange[900]),
                onPressed: () => updateQuantity(index, -1),
              ),
              Text(
                "${cartItems[index].quantity}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.add_circle, color: Colors.orange[900]),
                onPressed: () => updateQuantity(index, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ✅ Model Class for Cart Item
class CartItem {
  String title;
  int price;
  String imagePath;
  int quantity;

  CartItem(this.title, this.price, this.imagePath, this.quantity);
}
