import 'package:flutter/material.dart';
import 'package:restaurant_app/products/productDetails.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black, size: 30),
              onPressed: () {},
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart,
                    color: Colors.black, size: 30),
                onPressed: () {
                  Navigator.pushNamed(context, '/orders');
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Delicious',
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'food for you',
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange[900],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: const TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white70,
                  tabs: [
                    Tab(text: 'Foods'),
                    Tab(text: 'Drinks'),
                    Tab(text: 'Snacks'),
                    Tab(text: 'Sauces'),
                    Tab(text: 'Rice'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    MenuList(), // Foods Tab
                    MenuList(), // Drinks Tab
                    MenuList(), // Snacks Tab
                    MenuList(), // Sauces Tab
                    MenuList(), // Rice Tab
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.orange[900],
          fixedColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == 1) {
              Navigator.pushNamed(context, '/favorites');
            }
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30.0), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite, size: 30.0), label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30.0), label: 'Account'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 30.0), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 4, // Number of times to show the MenuCard
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: MenuCard(
            title: 'Veggie Tomato Mix',
            price: 'Rs. 650',
            imagePath: 'assets/food2.jpeg', // Local asset image
          ),
        );
      },
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;

  const MenuCard(
      {required this.title, required this.price, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              title: title,
              price: price,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.orange,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Image.asset(imagePath,
                  fit: BoxFit.cover, height: 250, width: double.infinity),
            ),
          ],
        ),
      ),
    );
  }
}
