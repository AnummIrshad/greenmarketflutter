import 'package:flutter/material.dart';
import '../constants.dart'; // Import your constants here
import './product.dart'; // Import your product class here

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.itemIndex,
    required this.product,
     
  }) : super(key: key);

  final int itemIndex;
  final Product product;
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
       // vertical: 5,
      ),
      height: 110,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 96,
            decoration: BoxDecoration(
              color: product.color.withOpacity(10),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          // Product image
          Positioned(
           // top: 20,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 100,
              width: 140,
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ), // Product image
            ), // Container
          ), // Positioned

          // Product title and price
          Positioned(
            top: 30,
            left: 0,
            bottom: 40,
            child: SizedBox(
              height: 100,
              width: size.width - 200,
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 32,
                        //fontWeight: FontWeight.bold,
                        fontFamily: "Candara",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}