import 'package:flutter/material.dart';
import '../widgets/searchbar.dart';


class CustomAppBar extends StatelessWidget {
  final String title;

 CustomAppBar({
    Key? key,
    required this.title, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Background Image
        Container(
          height: MediaQuery.of(context).size.height * 0.26,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/cover.png'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
        ),

        // AppBar inside the container
        Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.white),
              title: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: 'Deliver now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: '\nEdmonton Road, Colombo 5',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.favorite, color: Colors.white, size: 31),
                  onPressed: () {
                    // Add your favorite button action here
                  },
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 10), // Add vertical spacing
            // SearchBox(), // Include SearchBox if needed
          ],
        ),

        // Large Text
        Positioned(
          top: MediaQuery.of(context).size.height * 0.19, // Adjust the top position as needed
          left: 19, // Adjust the left position as needed
          right: 16, // Adjust the right position as needed
          child: Text(
            title,
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
