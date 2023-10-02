import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import '../screens/ordersuccess.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // Default map type
  MapType _currentMapType = MapType.normal;

  // Sample driver details and delivery address (replace with real data)
  String driverName = 'John Doe';
  String driverPhone = '123-456-7890';
  String deliveryAddress = '123 Main St, City';
  String estimatedArrivalTime = 'ETA: 30 minutes'; // Example ETA

  // Sample driver location (replace with real-time tracking data)
  LatLng driverLocation = LatLng(37.43296265331129, -122.08832357078792);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Tracking'),
        backgroundColor: Colors.green.shade900,
      ),
      body: Column(
        children: [
          
          Expanded(
            child: GoogleMap(
              mapType: _currentMapType, // Set the current map type
              initialCameraPosition: CameraPosition(
                target: LatLng(6.9271, 79.8612), // Colombo, Sri Lanka coordinates
                zoom: 15.0, // Adjust the zoom level to show a close-up view
              ),
              markers: <Marker>[
                Marker(
                  markerId: MarkerId('driverMarker'),
                  position: driverLocation,
                  infoWindow: InfoWindow(title: 'Driver Location'),
                ),
              ].toSet(),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),


Padding(
  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 9.0),
  child: Container(
 padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 6.0),            
  decoration: BoxDecoration(
    color: Colors.green, // Set the background color to green
    borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
    border: Border.all(
      color: Colors.green.shade400, // Border color
      width: 2.0, // Border width
    ),
   
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      StatusBox(icon: Icons.check, label: 'Preparing', isActive: false),
      StatusBox(icon: Icons.local_shipping, label: 'Picked Up', isActive: false),
      StatusBox(icon: Icons.done, label: 'Out for delivery', isActive: false),
      StatusBox(icon: Icons.done, label: 'Delivered', isActive: true),
    ],
  ),
),
),
          


         SizedBox(height: 5),
          Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
         CircleAvatar(
  radius: 35,
  backgroundColor: Colors.green,
  backgroundImage: AssetImage('assets/images/profile.png'), // Replace with the actual asset path
),

          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$driverName',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox (height: 5),
              Text('CBHIY 123'),
             //Text(' CBHIY 123'),
            ],
          ),
          SizedBox(width: 80),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.2),
            ),
            child: IconButton(
              icon: Icon(Icons.phone, color: Colors.black),
              onPressed: () {
                // Implement phone call functionality
              },
            ),
          ),
          SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.2),
            ),
            child: IconButton(
              icon: Icon(Icons.message, color: Colors.black),
              onPressed: () {
                // Implement messaging functionality
              },
            ),
          ),
        ],
      ),
      SizedBox(height: 28),
      Row(
  children: [
    Icon(
      Icons.location_on, // Location icon
      color: Colors.green, // Icon color
      size: 40.0, // Adjust the icon size as needed
    ),
    SizedBox(width: 8.0), // Add some spacing between the icon and text
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery location:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'No 54, Edmonton Road, Colombo,\nSri Lanka',
          // style: TextStyle(), // You can customize the style here
        ),
      ],
    ),
  ],
),
SizedBox(height: 10),

    


                
              
              Row(
  children: [
    Icon(Icons.access_time, color: Colors.green, size: 40), // Time icon
    SizedBox(width: 8), // Add spacing between icon and text
    Text(
      'ETA:',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(width: 7), // Add spacing between text and estimatedArrivalTime
    Text(
      estimatedArrivalTime,
      style: TextStyle(
        //fontWeight: FontWeight.bold,
      ),
    ),
  ],
),





              ],
            ),
          ),







        ],
      ),
      
    );
  }

  Future<void> _goToDriverLocation() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: driverLocation,
        zoom: 15.0,
      ),
    ));
  }
}

class StatusBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  StatusBox({
    required this.icon,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor = isActive ? Colors.black : Colors.black;
    Color backgroundColor = isActive ? Colors.yellow.shade200 : Colors.grey.shade200; // Set the desired background color

    return GestureDetector(
      onTap: () {
        if (isActive && label == 'Delivered') {
          // Navigate to the OrderSuccess page when Delivered is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderSuccess()),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(8.0), // Adjust padding as needed
        decoration: BoxDecoration(
          color: backgroundColor, // Set the background color here
          borderRadius: BorderRadius.circular(10.0), // Add rounded borders
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 48.0,
            ),
            SizedBox(height: 8.0),
            Text(
              label,
              style: TextStyle(
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
