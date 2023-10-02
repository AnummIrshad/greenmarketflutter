import 'package:flutter/material.dart';
import '../constants.dart';
import './categories.dart';
import './categoriespage.dart';


class CategoryBody extends StatelessWidget {
  const CategoryBody({
    Key? key,
    required this.itemIndex,
    required this.category,
    required this.press,
  }) : super(key: key);

  final int itemIndex;
  final Category category;
  final Function() press; // Specify that press is a function with no arguments

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 10),
      child: InkWell(
        onTap: () {
          press(); // Call the press function when InkWell is tapped
        },
        child: Row(
   children: [
  // image container
  Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      color: category.color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    ),
    child: Align(
      alignment: Alignment.center,
      child: Image(
        image: AssetImage(category.image),
        fit: BoxFit.cover,
      ),
    ),
  ),

  // text container
  Expanded(
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, top: 24),
              child: Text(
                category.title,
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                ),
              ),
            ),
           
          ],
        ),
      ),
    ),
  ),
  // Additional widgets for the Row can be added here
],


        ),
      ),
    );
  }
}