import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Your wishlist is currently empty!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
