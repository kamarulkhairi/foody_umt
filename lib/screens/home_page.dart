import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foody_umt/components/floating-white-button.dart';
import 'package:foody_umt/constants.dart';
import 'package:foody_umt/components/restaurant-card.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:foody_umt/firebase-service/firebase-authenticate.dart';
import 'package:foody_umt/screens/login.dart';
import 'package:image_picker/image_picker.dart';

@override
class HomePage extends StatefulWidget {
  static String id = 'homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FirebaseAuth auth = FirebaseAuth.instance;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  String downloadURL;
  ImagePicker _picker = ImagePicker();
  FirebaseServices fireService = FirebaseServices();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    User user = auth.currentUser;
    downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('user')
        .child('profile')
        .child('${user.uid}')
        .getDownloadURL();
    updateProfilePic(downloadURL);
  }

  void updateProfilePic(String picPath) {
    setState(() {
      downloadURL = picPath;
    });
  }

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
                  'Choose a Cafe',
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: downloadURL == null
                        ? GestureDetector(
                            onTap: () async {
                              PickedFile file = await _picker.getImage(
                                  source: ImageSource.gallery);
                                  var url = await fireService.uploadFile(file.path);
                                  updateProfilePic(url);
                                  
                            },
                            child: CircleAvatar(
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                              ),
                              backgroundColor: Colors.white54,
                              radius: 50,
                            ),
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(downloadURL),
                            backgroundColor: Colors.white,
                            radius: 50,
                          ),
                  ),
                  Align(
                    alignment: Alignment.centerRight + Alignment(0, -0.3),
                    child: Text(
                      'Kamarul Khairi',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight + Alignment(0, .4),
                    child: Text(
                      auth.currentUser.email,
                      style: TextStyle(color: Colors.white, fontSize: 11.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight + Alignment(0, .1),
                    child: Text(
                      'S51565',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle_outlined,
                color: Colors.black87,
              ),
              title: Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.description_outlined,
                color: Colors.black87,
              ),
              title: Text(
                'Order',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black87,
              ),
              title: Text(
                'Cart',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black87,
              ),
              title: Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, LoginPage.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
