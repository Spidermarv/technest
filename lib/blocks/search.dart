import 'package:flutter/material.dart';
import 'package:technest/screens/screen.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Search Bar Tutorial'),
      ),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: Center(
              child: Text('Search results will be displayed here!'),
            ),
          ),
        ],
      ),
    );
  }
}
