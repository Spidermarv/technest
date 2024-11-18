import 'package:flutter/material.dart';
import 'package:technest/blocks/colors.dart';
import 'package:technest/screens/home.dart';

class TechStoreDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.pcolor, AppColors.bcolor], // Ensure these are defined in colors.dart
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Text(
                'Tech Store Menu',
                style: TextStyle(
                  color: AppColors.tcolor, // Ensure this is defined in colors.dart
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildDrawerItem(context, 'Home', Icons.home,  HomeScreen()),
            _buildDrawerItem(context, 'Products', Icons.devices, const ProductsScreen()),
            _buildDrawerItem(context, 'Cart', Icons.shopping_cart, const CartScreen()),
            _buildDrawerItem(context, 'Orders', Icons.list_alt, const OrdersScreen()),
            _buildDrawerItem(context, 'Profile', Icons.person, const ProfileScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, IconData icon, Widget destination) {
    return ListTile(
      leading: Icon(icon, color: AppColors.tcolor), // Ensure AppColors.tcolor is valid
      title: Text(
        title,
        style: TextStyle(color: AppColors.tcolor),
      ),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
    );
  }
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: const Center(child: Text('Products Page')),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: const Center(child: Text('Cart Page')),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: const Center(child: Text('Orders Page')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Profile Page')),
    );
  }
}
