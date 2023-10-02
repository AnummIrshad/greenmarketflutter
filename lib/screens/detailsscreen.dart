import 'package:flutter/material.dart';
import '../components/vegetable.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define the contents of the DetailsScreen here
    return Scaffold(
      backgroundColor: Colors.lightGreen[400],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[400],
       // title: Text('Back'),
      ),
      body: Vegetable(), // Remove the extra comma here
    );
  }
}
