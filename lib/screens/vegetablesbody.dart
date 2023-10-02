import 'package:flutter/material.dart';
import '../constants.dart';
import './vegetables.dart';

class VegetablesBody extends StatefulWidget {
  const VegetablesBody({
    Key? key,
    required this.itemIndex,
    required this.vegetable,
    required this.press,
  }) : super(key: key);

  final int itemIndex;
  final Vegetable vegetable;
  final Function() press;

  @override
  _VegetablesBodyState createState() => _VegetablesBodyState();
}

class _VegetablesBodyState extends State<VegetablesBody> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 10),
      child: InkWell(
        onTap: () {
          widget.press();
        },
        child: Row(
          children: [
            // Image container
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: widget.vegetable.color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(widget.vegetable.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Text container
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: widget.vegetable.color,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 16, top: 24),
                          child: Text(
                            widget.vegetable.title,
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, top: 0),
                          child: Text(
                            widget.vegetable.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    // Increment and Decrement Icons
                    Row(
                      children: [
                        GestureDetector(
                          onTap: incrementCounter,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          counter.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: decrementCounter,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
