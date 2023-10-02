

import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int id;
  final Color color;

  Product(
      {required this.image,
      required this.title,
      required this.description,
    
    
      required this.id,
      required this.color});
}

List<Product> products = [
  Product(
      id: 1,
      title: "Vegetables",
    
     
      description: dummyText,
      image: "assets/images/1.png",
      color: Colors.green.shade900,
      ),
  Product(
      id: 2,
      title: "Belt Bag",
     
    
      description: dummyText,
      image: "assets/images/2.png",
      color: Colors.green.shade500,
      ),
  Product(
      id: 3,
      title: "Hang Top",

     
      description: dummyText,
      image: "assets/images/3.png",
      color: Colors.green.shade300,
      ),
  Product(
      id: 4,
      title: "Old Fashion",
  
    
      description: dummyText,
      image: "assets/images/4.png",
      color: Colors.yellow.shade300,
      ),

   Product(
      id: 5,
      title: "Vegetables",
    
     
      description: dummyText,
      image: "assets/images/1.png",
      color: Colors.yellow.shade600,
      
      ),

  
  
  
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";