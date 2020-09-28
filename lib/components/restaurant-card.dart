import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  RestaurantCard({@required this.imagePath,@required this.cafeName});

  final String imagePath;
  final String cafeName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Container(
          height: 180.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fitWidth,
                alignment: Alignment.center),
          ),
          child: Align(
            alignment: Alignment(0.80, 0.70),
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                cafeName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
