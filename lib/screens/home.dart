import 'dart:math'; // To generate random values
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:technest/blocks/colors.dart';
import 'package:technest/blocks/NavItem.dart';
import 'cart_screen.dart';
import 'wishlist_screen.dart';
import 'product_details_screen.dart';
import 'search_screen.dart';
import 'notifications_screen.dart';
import 'account_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeCategoryIndex = 0;
  int _activeNavIndex = 0;

  final List<String> categories = ["All", "iPhone", "iPad", "Accessories"];
  final List<IconData> categoryIcons = [
    Icons.grid_view,
    Icons.phone_iphone,
    Icons.tablet_mac,
    Icons.headset
  ];

  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: AppColors.pcolor.withOpacity(0.9),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: AppColors.tcolor),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {
                isTyping = value.isNotEmpty;
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              hintText: 'Search for products, brands...',
              prefixIcon: isTyping
                  ? null
                  : Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: AppColors.bcolor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: AppColors.tcolor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.pcolor,
              ),
              child: Text('Welcome!'), // Replace with a logo or user info
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Wishlist'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WishlistScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.tcolor.withOpacity(0.3),
                      offset: Offset(4, 10),
                      blurRadius: 10,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/header.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    return _categoryButton(
                        categories[index], categoryIcons[index], index);
                  }),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Top Selling',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Use a dynamic list of product cards here
            GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: 10, // You can display 10 random products
              itemBuilder: (context, index) {
                return generateRandomProductCard();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColors.pcolor.withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(-1, 15),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(bottomNavItems.length, (index) {
              final riveIcon = bottomNavItems[index].rive;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _activeNavIndex = index;
                  });

                  // Navigate to respective screens
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationsScreen()),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchScreen()),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                      break;
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WishlistScreen()),
                      );
                      break;
                    case 4:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountScreen()),
                      );
                      break;
                  }
                },
                child: SizedBox(
                  height: 40,
                  width: 36,
                  child: RiveAnimation.asset(
                    riveIcon.src,
                    artboard: riveIcon.artboard,
                    stateMachines: [riveIcon.stateMachineName],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _categoryButton(String title, IconData icon, int index) {
    final isActive = index == _activeCategoryIndex;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            _activeCategoryIndex = index;
          });
        },
        icon: Icon(icon, size: 18),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor:
          isActive ? AppColors.pcolor.withOpacity(0.8) : AppColors.bcolor,
          foregroundColor: isActive ? Colors.white : AppColors.tcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  // Helper function to generate random product cards
  Widget generateRandomProductCard() {
    final random = Random();

    // List of example image paths
    List<String> imagePaths = [
      'assets/laptop.jpg',
      'assets/gaming.jpg',
      'assets/headphones.jpg',
      'assets/swatch.jpg',
      'assets/phone.jpg',
      'assets/vr.jpg'
    ];

    // List of example product titles
    List<String> titles = [
      'Macbook Pro M2',
      'Xbox Gaming Controller',
      'Headphones',
      'Smartwatch',
      'Iphone 13 mini',
      'Vr Headsets'
    ];

    // Generate random price
    double randomPrice = double.parse((random.nextDouble() * 100 + 50).toStringAsFixed(2));

    // Generate random discount between 0 and 50%
    int randomDiscount = random.nextInt(51);

    // Generate random rating between 0.0 and 5.0
    double randomRating = (random.nextDouble() * 5).toDouble();

    // List of example color options
    List<Color> colorOptions = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple
    ];

    // Randomly select a color from the list
    int colorCount = random.nextInt(4) + 1; // Select between 1 and 4 color options
    List<Color> randomColors = List.generate(colorCount, (index) => colorOptions[random.nextInt(colorOptions.length)]);

    // Randomly select image path and title
    String randomImagePath = imagePaths[random.nextInt(imagePaths.length)];
    String randomTitle = titles[random.nextInt(titles.length)];

    return _productCard(
        randomImagePath,       // Random image path
        randomTitle,           // Random title
        '\$$randomPrice',      // Random price (with dollar sign)
        randomDiscount,        // Random discount percentage
        randomRating,          // Random rating
        randomColors           // Random color options
    );
  }

  Widget _productCard(
      String imagePath, String title, String price, int discount, double rating, List<Color> colorOptions) {
    return GestureDetector(
      onTap: () {
        // Your navigation logic
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                // Product Image
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Discount Badge
                if (discount > 0)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(-2, 9),
                            blurRadius: 10,
                          ),
                        ],
                        color: AppColors.pcolor, // Just an example color for the discount badge
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '-$discount%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            // Product Information
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    // Price with discount (if any)
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.tcolor, // Example color for price
                      ),
                    ),
                    SizedBox(height: 8),
                    // Rating (stars)
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 18,
                        );
                      }),
                    ),
                    SizedBox(height: 8),
                    // Color Options
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: colorOptions.map((color) {
                        return Container(
                          margin: EdgeInsets.only(right: 6),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
