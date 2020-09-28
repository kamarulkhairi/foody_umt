import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -21,
            left: -21,
            child: Image.asset(
              'lib/images/blob_top_left.png',
              width: size.width * 1.2,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'lib/images/blob_bottom_left.png',
              width: size.width * 2.0,
            ),
          ),
          Positioned(
            child: Image.asset('lib/images/blob_center_right.png'),
          ),
          child,
        ],
      ),
    );
  }
}
