import 'package:flutter/material.dart';
import '../screens/cart.dart';

class Vegetable extends StatefulWidget {
  @override
  _VegetableState createState() => _VegetableState();
}

class _VegetableState extends State<Vegetable> {
  int itemCount = 1; // Initial item count

  void incrementItemCount() {
    setState(() {
      itemCount++;
    });
  }

  void decrementItemCount() {
    if (itemCount > 1) {
      setState(() {
        itemCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height - 450,
            decoration: BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 0),
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.45,
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/cabbage.png',
                          height: size.height * 0.50,
                          width: size.width * 0.90,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container for product details
          Container(
            width: double.infinity,
            height: 400,
            padding: EdgeInsets.all(35),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cabbage',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'LKR 270', // Replace with your actual price
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                  ],
                ),
                Text(
                  '500 g',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Fresh and wholesome cabbage, handpicked for you. Our premium quality cabbage is grown with care, free from harmful pesticides and chemicals, ensuring you enjoy the finest flavor and nutrition in every bite .',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 30),
                // Plus and Minus buttons with counter
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Handle favorite button press here
                          // Navigate to another page
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                // Replace `YourSecondPage()` with the actual widget you want to navigate to
                                return MyCart();
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 140), // Add some space between the favorite icon and the counters
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: decrementItemCount,
                      ),
                      SizedBox(width: 10), // Add some space between the minus icon and the counter
                      Text(
                        itemCount.toString(),
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10), // Add some space between the counter and the plus icon
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: incrementItemCount,
                      ),
                    ],
                  ),
                ),

                // Add more product details here
              ],
            ), //end of product texts
          ),
        ],
      ),
    );
  }
}
