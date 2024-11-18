import 'package:flutter/material.dart';
import 'package:technest/blocks/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: AppColors.tcolor,),
          onPressed: () {
            // Add navigation to Drawer
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for products, brands...',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: AppColors.tcolor),
            onPressed: () {
              // Navigate to Cart
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promotion Banner
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/header.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _categoryButton('All', Icons.grid_view),
                    _categoryButton('iPhone', Icons.phone_iphone),
                    _categoryButton('iPad', Icons.tablet_mac),
                    _categoryButton('Accessories', Icons.headset),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Product Recommendations
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Top Selling',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _productCard(
                'assets/iphone_13.png', 'iPhone 13 Mini', 'MWK 1,000,000', 15),
            _productCard(
                'assets/apple_watch.jpg', 'Apple Watch S8', 'MWK 3,500,000 ', 20),
          ],
        ),
      ),
    );
  }

  Widget _categoryButton(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 18),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.bcolor,
          foregroundColor: AppColors.tcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _productCard(String imagePath, String title, String price, int discount) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  '$discount% OFF',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
