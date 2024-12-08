import 'package:flutter/material.dart';
import 'package:technest/blocks/colors.dart';
import 'package:technest/screens/signin.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  void _logout(BuildContext context) {
    // Simulate logging out by clearing the login status
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SigninPage()),
              );
            },
            child: const Text('Log Out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.pcolor),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bcolor,
      appBar: AppBar(
        backgroundColor: AppColors.pcolor,
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            color: Colors.white,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: const AssetImage('assets/profile.png'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'johndoe@example.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Menu Items
          Container(
            color: Colors.white,
            child: Column(
              children: [
                _buildMenuItem(
                  title: 'My Orders',
                  icon: Icons.shopping_bag_outlined,
                  onTap: () {},
                ),
                _buildMenuItem(
                  title: 'Wishlist',
                  icon: Icons.favorite_border,
                  onTap: () {},
                ),
                _buildMenuItem(
                  title: 'Manage Addresses',
                  icon: Icons.location_on_outlined,
                  onTap: () {},
                ),
                _buildMenuItem(
                  title: 'Payment Methods',
                  icon: Icons.credit_card,
                  onTap: () {},
                ),
                _buildMenuItem(
                  title: 'Settings',
                  icon: Icons.settings,
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Support and Logout
          Container(
            color: Colors.white,
            child: Column(
              children: [
                _buildMenuItem(
                  title: 'Help Center',
                  icon: Icons.help_outline,
                  onTap: () {},
                ),
                _buildMenuItem(
                  title: 'Privacy Policy',
                  icon: Icons.privacy_tip_outlined,
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                  onTap: () => _logout(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
