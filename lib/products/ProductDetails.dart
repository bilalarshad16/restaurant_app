import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;

  const ProductDetailPage({
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Icons in a Row with Space Between
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite_border, size: 30),
                      onPressed: () {
                        // Handle favorite action
                      },
                    ),
                  ],
                ),
              ),

              // Product Image
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child:
                        Image.asset(imagePath, height: 250, fit: BoxFit.cover),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Product Title & Price
              Center(
                child: Column(
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      price,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange[900],
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Product Detail
              Text(
                "Product Detail",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Mixed Veg is something that I often make when hosting dinner at home because it is one sabzi which everyone likes. Made with lots of veggies like cauliflower, beans, carrots this restaurant style mixed recipe is wonderfully spiced and pairs beautifully with homemade naan or tandoori roti",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),

              SizedBox(height: 16),
            ],
          ),
        ),
      ),

      // ✅ Fixed Button at the Bottom
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 15.0, left: 16.0, right: 16.0),
        child: SizedBox(
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
              Navigator.pushNamed(context, '/addcart');
            },
            child: Text(
              "Add to Cart",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
