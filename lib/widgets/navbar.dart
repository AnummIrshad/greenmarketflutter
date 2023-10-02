import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const BottomNavbar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     const List<Widget> _tabOptions = <Widget>[
      Text('Account'), // Replace with your icon and label
      Text('Home'),    // Replace with your icon and label
      Text('Search'),  // Replace with your icon and label
      Text('Cart'),    // Replace with your icon and label
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green.shade500,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(12),
              child: Icon(Icons.account_circle, size: 45, color: Colors.black),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(12),
              child: Icon(Icons.home, size: 45, color: Colors.black),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(12),
              child: Icon(Icons.search, size: 45, color: Colors.black),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(12),
              child: Icon(Icons.shopping_cart, size: 45, color: Colors.black),
            ),
            label: '',
          ),
        ],
        onTap: onItemTapped,
      ),
    );
  }
}
