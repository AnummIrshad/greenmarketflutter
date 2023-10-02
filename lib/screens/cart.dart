import 'package:flutter/material.dart';
import '../widgets/subheading.dart';
import './checkout.dart';

void main() {
  runApp(MaterialApp(
    home: MyCart(),
  ));
}

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<CartItem> cartItems = [
    CartItem(name: 'Cabbage', price: 10, weight: '250g', image: 'assets/images/cabbage.png', quantity: 1),
    CartItem(name: 'Tomatoes', price: 15, weight: '500g', image: 'assets/images/tomatoes.png', quantity: 1),
    CartItem(name: 'Onions', price: 20, weight: '200g', image: 'assets/images/onions.png', quantity: 1),
    CartItem(name: 'Carrots', price: 20, weight: '250g', image: 'assets/images/carrots.png', quantity: 1),
    // Add more items as needed
  ];
  double discount = 5;
  double subTotal = 0;

  @override
  void initState() {
    super.initState();
    calculateSubTotal();
  }

  void calculateSubTotal() {
    double totalPrice = cartItems.fold(0, (total, item) => total + (item.price * item.quantity));
    setState(() {
      subTotal = totalPrice - discount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black.withOpacity(0.1) , // Set your desired green color
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              child: SubHeading(
                subtitle: 'My Cart',
              ),
            ),

            
           
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return CartItemWidget(
                    item: item,
                    onDelete: () {
                      // Implement delete item logic here
                      setState(() {
                        cartItems.removeAt(index);
                        calculateSubTotal();
                      });
                    },
                    onIncrement: () {
                      // Implement increment logic here
                      setState(() {
                        item.quantity++;
                        calculateSubTotal();
                      });
                    },
                    onDecrement: () {
                      // Implement decrement logic here
                      setState(() {
                        if (item.quantity > 1) {
                          item.quantity--;
                          calculateSubTotal();
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
      'CART TOTAL',
      style: TextStyle(
        fontSize: 16, // Set your desired font size
        // You can also set other text style properties here, like fontWeight and color.
      ),
    ),
                 Text(
      '\$${subTotal.toStringAsFixed(2)}',
      style: TextStyle(
        fontSize: 16, // Set your desired font size
        // You can also set other text style properties here, like fontWeight and color.
      ),
    ),
                ],
              ),
              SizedBox(height: 10), // Add vertical spacing
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'TAX',
      style: TextStyle(
        fontSize: 16, // Set your desired font size
        // You can also set other text style properties here, like fontWeight and color.
      ),
    ),
    Text(
      '\$${subTotal.toStringAsFixed(2)}',
      style: TextStyle(
        fontSize: 16, // Set your desired font size
        // You can also set other text style properties here, like fontWeight and color.
      ),
    ),
  ],
),
SizedBox(height: 10), // Add vertical spacing

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'PROMO DISCOUNT',
      style: TextStyle(
        fontSize: 16, // Set your desired font size
        // You can also set other text style properties here, like fontWeight and color.
      ),
    ),
    Text(
      '\$${subTotal.toStringAsFixed(2)}',
      style: TextStyle(
        fontSize: 16, // Set your desired font size
        // You can also set other text style properties here, like fontWeight and color.
      ),
    ),
  ],
),
SizedBox(height: 25),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'SUB TOTAL',
      style: TextStyle(
        fontSize: 18,
         fontWeight: FontWeight.bold, // Set your desired font size
        // You can also set other text style properties here, like fontWeight and color.
      ),
    ),
    Text(
      '\$${subTotal.toStringAsFixed(2)}',
      style: TextStyle(
        fontSize: 18,
         fontWeight: FontWeight.bold, // Set your desired font size
        // You can also set other text style properties here, like fontWeight and color.
      ),
    ),
  ],
),
SizedBox(height: 20),
 // Add vertical spacing 

             Container(
  width: 400, // Set your desired width
  height: 50, // Set your desired height
  
  child: ElevatedButton(
    onPressed: () {
  // Implement your checkout logic here
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CheckoutPage(), // Replace with your Checkout.dart widget
    ),
  );
},

    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.green.shade500), 
    // Set your desired button color
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Set border radius as needed
      ),
    ),
  ),
    child: Text(
      'Checkout',
      style: TextStyle(
        fontSize: 18, // Set your desired font size
        color: Colors.white, // Set your desired text color
      ),
    ),
  ),
)

            ],
          ),
        ),
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  final String weight;
  final String image;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.weight,
    required this.image,
    required this.quantity,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  CartItemWidget({required this.item, required this.onDelete, required this.onIncrement, required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
  margin: EdgeInsets.symmetric(vertical: 5.0),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(25.0), // Adjust the radius as needed for the main container
    child: Container(
      color: Colors.white, // White container
      padding: EdgeInsets.all(9.0),
      child: Row(
        children: [
          IconButton(
  icon: Icon(Icons.delete_outline),
  color: Colors.grey, // Replace with your desired icon
  onPressed: onDelete,
),

          
          Container(
            width: 70, // Set your desired width
            height: 70, // Set your desired height
            child: Image.asset(
              item.image,
              fit: BoxFit.cover,
            ),
          ), // Product image
          SizedBox(width: 16), // Add spacing between image and text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 19, // Set your desired font size
                  fontWeight: FontWeight.bold, // Set your desired font weight
                  color: Colors.black, // Set your desired text color
                ),
              ),
              SizedBox(height: 4), // Add vertical spacing
              Row(
                children: [
                  Text('\$${item.price.toStringAsFixed(2)}'),
                  SizedBox(width: 14), // Add spacing between price and weight
                  Text(item.weight),
                ],
              ),
            ],
          ),
          Spacer(), // Adds space to separate the delete button
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.shade200, // Green background color
                ),
                child: IconButton(
                  icon: Icon(Icons.remove),
                  color: Colors.black, // Icon color
                  onPressed: onDecrement,
                ),
               // padding: EdgeInsets.all(4.0), // Adjust padding as needed
                margin: EdgeInsets.all(6.0), // Adjust margin as needed
              ),
              Text(
                item.quantity.toString(),
                style: TextStyle(
                  fontSize: 19, // Set your desired font size
                ),
              ),
              
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.shade200, // Green background color
                ),
                child: IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.black, // Icon color
                  onPressed: onIncrement,
                ),
                //padding: EdgeInsets.all(4.0), // Adjust padding as needed
                margin: EdgeInsets.all(6.0), // Adjust margin as needed
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);


  }
}
