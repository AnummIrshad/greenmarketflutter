import 'package:flutter/material.dart';

class Vegetable {
  final String image, title, description;
  final int id;
  final Color color;
  final double price; // Add price property
  final int weight;   // Add weight property

  Vegetable({
    required this.image,
    required this.title,
    required this.description,
    required this.id,
    required this.color,
    required this.price,
    required this.weight,
  });
}

List<Vegetable> vegetables = [
  Vegetable(
    id: 1,
    title: "Onions",
    description: "SunValley Farm",
    image: "assets/images/onions.png",
    color: Colors.purple,
    price: 1.99, // Provide a valid price
    weight: 200, // Provide a valid weight
  ),
  Vegetable(
    id: 2,
    title: "Tomatoes",
    description: "Jagro Farm",
    image: "assets/images/tomatoes.png",
    color: Colors.red,
    price: 2.49, // Provide a valid price
    weight: 250, // Provide a valid weight
  ),
  Vegetable(
    id: 3,
    title: "Cabbage",
    description: "SunValley Farm",
    image: "assets/images/cabbage.png",
    color: Colors.lightGreen,
    price: 1.79, // Provide a valid price
    weight: 300, // Provide a valid weight
  ),
  Vegetable(
    id: 4,
    title: "Carrots",
    description: "Agro Farm",
    image: "assets/images/carrots.png",
    color: Colors.orange,
    price: 1.29, // Provide a valid price
    weight: 150, // Provide a valid weight
  ),
  Vegetable(
    id: 5,
    title: "Beans",
    description: "Green and nutritious broccoli",
    image: "assets/images/beans.png",
    color: Colors.green.shade200,
    price: 2.99, // Provide a valid price
    weight: 180, // Provide a valid weight
  ),
  // Add more vegetable items as needed
];
