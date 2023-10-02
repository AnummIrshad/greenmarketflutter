import 'package:flutter/material.dart';

class Category {
  final String image, title;
  final int id;
  final Color color;

  Category(
      {required this.image,
      required this.title,
      
    
      required this.id,
      required this.color});
}

List<Category> categories = [

  Category(
      id: 1,
      title: "VEGETABLES",
      
    
     
     
      image: "assets/images/1.png",
       color: Colors.green.shade900.withOpacity(0.9),
     
      ),
       

      Category(
      id: 2,
      title: "FRUITS",
  
    
     
      image: "assets/images/2.png",
       color: Colors.green.shade600,
     
      ),


       Category(
      id: 3,
      title: "CITRUS FRUITS",
     
    
      
      image: "assets/images/3.png",
       color: Colors.green.withOpacity(0.8),
     
      ),

  Category(
      id: 4,
      title: "ORGANIC",

     
      
      image: "assets/images/4.png",
       color: Colors.yellow.shade800.withOpacity(0.9),
     
      
      
      ),

  


  
 
  

      
  

   Category(
      id: 5,
      title: "FRESH",
  
     
     
      image: "assets/images/2.png",
      color: Colors.green.shade700.withOpacity(0.5),
      
      
      ),

      Category(
      id: 6,
      title: "GREENS",
  
    
      
      image: "assets/images/4.png",
      color: Colors.lightGreen,
      ),

  

  
  
  
];
