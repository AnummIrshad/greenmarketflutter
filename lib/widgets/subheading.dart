import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  final String subtitle; // Change this to a String

  SubHeading({
    Key? key,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/cover.png'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
        ),

        // AppBar
        Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.white),
              title: Row(
                // Add your title content here if needed
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.favorite), // Add search icon here
                  onPressed: () {
                    // Handle search button press
                  },
                ),
              ],
            ),
            SizedBox(height: 10), // Add vertical spacing
            // SearchBox(), // Include SearchBox if needed
          ],
        ),

        // Large Text
        Positioned(
          top: MediaQuery.of(context).size.height * 0.13, // Adjust the top position as needed
          left: 19, // Adjust the left position as needed
          right: 16, // Adjust the right position as needed
          child: Text(
            subtitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 42, // Adjust the font size as needed
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
