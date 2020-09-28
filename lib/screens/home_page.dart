import 'package:flutter/material.dart';
import 'package:foody_umt/components/floating-white-button.dart';
import 'package:foody_umt/constants.dart';
import 'package:foody_umt/components/restaurant-card.dart';

class HomePage extends StatelessWidget {
  static String id = 'homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            floating: false,
            pinned: true,
            expandedHeight: 240.0,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Which Cafe Would You Like To Order From?',
                  style: kMainTextStyle,
                ),
              ),
            ),
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FloatingWhiteButton(icon: Icons.shopping_cart),
                  FloatingWhiteButton(icon: Icons.person)
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              RestaurantCard(
                imagePath: 'lib/images/cafe.jpg',
                cafeName: 'Achik Cafe',
              ),
               RestaurantCard(
                imagePath: 'lib/images/cafe.jpg',
                cafeName: 'Achik Cafe',
              ),
               RestaurantCard(
                imagePath: 'lib/images/cafe.jpg',
                cafeName: 'Achik Cafe',
              ),
               RestaurantCard(
                imagePath: 'lib/images/cafe.jpg',
                cafeName: 'Achik Cafe',
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
