import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../widgets/searchbar.dart';
import '../widgets/navbar.dart';

import './homepage.dart';
import './categorylist.dart';
import '../constants.dart';
import './appbar.dart';
import './categorybody.dart';
import './categories.dart';
import './detailsscreen.dart';
import './vendorspage.dart';

class CategoriesPage extends StatelessWidget {
  // Define a function to handle navigation to the DetailsScreen
  void navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VendorsPage(),
      ),
    );
  }

int _selectedIndex = 0; // Index of the selected tab


  @override
  Widget build(BuildContext context) {
    // Define the list of tab items
    const List<Widget> _tabOptions = <Widget>[
      Text('Account'), // Replace with your icon and label
      Text('Home'),    // Replace with your icon and label
      Text('Search'),  // Replace with your icon and label
      Text('Cart'),    // Replace with your icon and label
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomAppBar(
            title: 'Categories', // Provide the desired title here
          ),
          CategoryList(),

          

          

          // List of categories

          Expanded(
            child: Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: categories.length, // Use the length of your categories list
                  itemBuilder: (context, index) {
                    Category category = categories[index]; // Get the Category object at this index
                    return CategoryBody(category: category, itemIndex: 5, press: () => navigateToDetails(context));
                  },
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavbar(
        selectedIndex: 1, // Replace with the index of the selected tab
        onItemTapped: (int index) {
          // Handle tab selection here
          // You can use setState to update the selected index
          // and implement navigation logic based on the selected tab.
        },
      ),

    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CategoriesPage(),
  ));
}