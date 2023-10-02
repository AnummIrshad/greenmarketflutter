import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../constants.dart';
import './vendorspage.dart';





class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState(); 
}

class _CategoryListState extends State<CategoryList>{
  int _selectedIndex = 0; // Index of the selected tab
  List categories= ["Fruits", "Vegetables", "Dairy", "Other"];
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(
    top: 15.0,  // Increase this value to adjust the top padding
   //bottom: 0, // You can keep the bottom padding as it is
  ),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: kDefaultPadding,
              right: index == categories.length - 1 ? kDefaultPadding : 0,
            ),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              color: index == _selectedIndex
                  ? Colors.green.shade900
                  : Colors.green,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              categories[index],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}