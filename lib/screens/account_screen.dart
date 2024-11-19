import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Manage your account!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
