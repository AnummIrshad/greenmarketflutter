import 'package:flutter/material.dart';
import './homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import './loginpage.dart';

class OrderSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Success'),
        backgroundColor: Colors.green.shade900, // Set the app bar color to green
      ),
      body: Container(
        // Use a Container to set the background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/deliveryperson.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              SizedBox(height: 530.0),
              Text(
                'Order successful!',
                style: TextStyle(
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Set the text color to white
                ),
                textAlign: TextAlign.center,
              ),
               Text(
                'Thank you for placing your order with us',
                style: TextStyle(
                  fontSize: 18.0,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black, // Set the text color to white
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
             ElevatedButton(
  onPressed: () {
    // You can add logic to navigate back to the home or orders page
    // when this button is pressed.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()), // Replace with your home page widget
    );
  },
  style: ElevatedButton.styleFrom(
    primary: Colors.green, // Set the background color
    onPrimary: Colors.white, // Set the text color
    elevation: 3, // Set the button elevation
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), // Set the border radius
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Adjust the padding as needed
    child: Text(
      'Home',
      style: TextStyle(
        fontSize: 18, // Adjust the font size as needed
      ),
    ),
  ),
),

SizedBox(height: 5), // Add a small gap between buttons
               ElevatedButton(
  onPressed: () {
    // Sign out from Firebase
    FirebaseAuth.instance.signOut();
    // Navigate to the CategoriesPage when the button is pressed
  
  },
  style: ElevatedButton.styleFrom(
    primary: Colors.grey.shade200,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.all(8), // Adjust the padding as needed
    child: Text(
      'Sign Out',
      style: TextStyle(
        fontSize: 16, // Adjust the font size as needed
        color: Colors.green,
      ),
    ),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}