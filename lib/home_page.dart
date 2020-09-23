import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              backgroundColor: Theme.of(context).primaryColor,
              floating: true,
              pinned: true,
              expandedHeight: 240.0,
              flexibleSpace: Center(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'Which Cafe Would You Like To Order From?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          height: 1.5,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              snap: false,
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FloatingWhiteButton(icon: Icons.shopping_cart),
                    FloatingWhiteButton(icon: Icons.person)
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

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
