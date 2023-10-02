import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../widgets/searchbar.dart';
import '../widgets/navbar.dart';
import '../constants.dart';
import './appbar.dart';
import './categorylist.dart';
import './vegetables.dart';
import './vegetablesbody.dart';
import './detailsscreen.dart';






class VendorsPage extends StatelessWidget {
  // Define a function to handle navigation to the DetailsScreen
  void navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(),
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
            title: 'Vegetables', // Provide the desired title here
          ),
          CategoryList(),

          Expanded(
  child: ListView.builder(
    itemCount: vegetables.length,
    itemBuilder: (context, index) {
      Vegetable vegetable = vegetables[index];
      return VegetablesBody(
        vegetable: vegetable,
        itemIndex: index,
        press: () {
          // Navigate to the DetailsScreen when a vegetable item is pressed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(),
            ),
          );
        },
      );
    },
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
    home: VendorsPage(),
  ));
}
