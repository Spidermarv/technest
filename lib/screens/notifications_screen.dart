import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'You have no new notifications!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}