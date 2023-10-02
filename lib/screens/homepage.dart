import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import './vendorspage.dart';
import './categoriespage.dart';
import './loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
     int _selectedIndex = 0; // Index of the selected tab

  // Define the list of tab items
   const List<Widget> _tabOptions = <Widget>[
    Text('Account'), // Replace with your icon and label
    Text('Home'),    // Replace with your icon and label
    Text('Search'),  // Replace with your icon and label
    Text('Cart'),    // Replace with your icon and label
  ];


return Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/homecover.png'), // Replace with your image path
      fit: BoxFit.cover,
    ),
  ),
  child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
    
        elevation: 0.0, // Remove the shadow
        iconTheme: IconThemeData(color: Colors.grey), // Change the color of the back arrow to grey
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black, // Change text color to black
            ),
            children: [
              TextSpan(
                text: 'Hello there!', // Make "Hello" bold
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: '\nAnumm Irshad', // Keep "User3" not bold
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
        actions: [
          CircleAvatar(
            // User's display picture (DP)
            backgroundImage: AssetImage('assets/images/logo.png'), // Replace with the actual image path
          ),
          SizedBox(width: 20), // Add spacing between DP and other elements if needed
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch content horizontally
          children: [
            SizedBox(height: 12), // Add vertical spacing
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Green Market',
                border: InputBorder.none, 
                
                 
                prefixIcon: Icon(Icons.search), // Add search icon here
                enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none, // Remove the border
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none, // Remove the border
    ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(16),
              ),
            ),
            SizedBox(height: 35), // Add vertical spacing
            Center(
              child: Text(
                'Welcome to \nour store',
                style: TextStyle(
                  fontSize: 43,
                  color: Colors.green.shade900,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                   ),
                  textAlign: TextAlign.center, // Center align the text
               ),
            ),
            SizedBox(height: 40),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                            // Navigate to the RegisterPage when the button is pressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => VendorsPage()),
                            );
                    },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      'Browse Vendors',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // Add a small gap between buttons
                ElevatedButton(
                  onPressed: () { 
                    // Navigate to the RegisterPage when the button is pressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CategoriesPage()),
                            );
                           
                    },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      'Browse Categories',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                

              ],
            ),
          ],
        ),
      ),
 bottomNavigationBar: Container(
  decoration: BoxDecoration(
    color: Colors.transparent, // Background color of the navigation bar
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(60), // Adjust the radius as needed
      topRight: Radius.circular(60), // Adjust the radius as needed
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.transparent, // Shadow color
        spreadRadius: 1, // Spread radius
       blurRadius: 3, // Blur radius
       offset: Offset(0, 2), // Shadow offset
      ),
    ],
  ),
  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12), // Adjust padding as needed
  child: BottomNavigationBar(
    type: BottomNavigationBarType.fixed, // Ensure all icons are displayed
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.green.shade500, // Color for selected tab
    unselectedItemColor: Colors.grey,        // Color for unselected tabs
    selectedFontSize: 0,                    // Remove selected tab text
    unselectedFontSize: 0,                  // Remove unselected tab text
    items: [
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.all(12), // Increase padding around the icon
          child: Icon(Icons.account_circle, size: 45, color: Colors.black), // Account icon with increased size
        ),
        label: '',                                   // Empty label
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.all(12), // Increase padding around the icon
          child: Icon(Icons.home, size: 45, color: Colors.black), // Home icon with increased size
        ),
        label: '',                                  // Empty label
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.all(12), // Increase padding around the icon
          child: Icon(Icons.search, size: 45, color: Colors.black), // Search icon with increased size
        ),
        label: '',                                  // Empty label
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: EdgeInsets.all(12), // Increase padding around the icon
          child: Icon(Icons.shopping_cart, size: 45, color: Colors.black), // Cart icon with increased size
        ),
        label: '',                                  // Empty label
      ),
    ],
    onTap: (index) {
      // Handle tab selection here
      // You can use setState to update the selected index
      // and implement navigation logic based on the selected tab.
    },
  ),
), 
//navigation bar ends here
  ),
  






    ); //end of container 
  }
}