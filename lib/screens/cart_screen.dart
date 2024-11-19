import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Your Cart is Empty', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
