import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DeliveryPage(),
  ));
}

class DeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Tracker'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIconText(
              iconBackgroundColor: Colors.blue, // Set background color here
              text: 'Delivery Address:',
            ),
            SizedBox(height: 8),
            Text('123 Main Street'),
            Text('Apt 4B'),
            Text('City, State 12345'),
            SizedBox(height: 16),
            _buildIconText(
              iconBackgroundColor: Colors.orange, // Set background color here
              text: 'Delivery Instructions:',
            ),
            SizedBox(height: 8),
            Text('Please leave the package at the doorstep.'),
            SizedBox(height: 16),
            _buildIconText(
              iconBackgroundColor: Colors.red, // Set background color here
              text: 'Delivery Time:',
            ),
            SizedBox(height: 8),
            Text('Estimated delivery time: 30 minutes'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement order tracking logic
              },
              child: Text('Track Order'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$20.00',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement place order logic
                },
                child: Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconText({
    required Color iconBackgroundColor,
    required String text,
  }) {
    return Row(
      children: [
        Container(
          width: 24, // Adjust the width as needed
          height: 24, // Adjust the height as needed
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, color: Colors.white), // Replace with your icon
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
