import 'package:flutter/material.dart';

class FloatingWhiteButton extends StatelessWidget {
  final IconData icon;

  FloatingWhiteButton({@required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          width: 40.0,
          height: 40.0,
          child: RawMaterialButton(
            onPressed: () {},
            shape: CircleBorder(),
            fillColor: Colors.white,
            elevation: 5.0,
            child: Icon(
              icon,
              size: 20.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
