import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';

import '../../../components/horizontalListView.dart';
import '../../auth/Authentication_Repositry/Authentication_repositry.dart';
import '../user_service_provider/profiles/Uer_profile.dart';

class User_looking_4_service extends StatelessWidget {
  const User_looking_4_service({super.key});

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/mechanic.jpeg'),
          AssetImage('images/plumbing.jpeg'),
          AssetImage('images/elec.jpeg'),
          AssetImage('images/carpentry.jpeg'),
          AssetImage('images/gardening.jpeg'),
          AssetImage('images/shoe.jpeg'),
          AssetImage('images/catering.jpeg'),
          AssetImage('images/events.jpeg'),
          AssetImage('images/laundry.jpeg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        // animationDuration: Duration(milliseconds: 1000),
        indicatorBgPadding: 4,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Welcome to Konne '),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Implement actions based on the selected value
              if (value == 'profile') {
                Get.to(userProfileCreen());
              } else if (value == 'logout') {

                Authentication_repositry.to.logout();

              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'profile',
                  child: Text('My Profile'),
                ),
                PopupMenuItem(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ];
            },
          ),
        ],

      ),
      drawer: new Drawer(
        child: new ListView(
          children: [
            //header for the navigation bar

            new UserAccountsDrawerHeader(
              accountName: Text('Katende'),
              accountEmail: Text('katendechris5@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                color: Color(0xff1044fb),
              ),
            ),
            // body of the side navigation bar
            InkWell(
              //inkwell makes thes fields clickable
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(
                  Icons.home,
                  //color: Color(0xff1044fb),
                ),
              ),
            ),

            InkWell(
              //inkwell makes thes fields clickable
              onTap: () {},
              child: ListTile(
                title: Text('My Services'),
                leading: Icon(
                  Icons.auto_fix_high_outlined,
                  //color: Color(0xff1044fb),
                ),
              ),
            ),

            InkWell(
              //inkwell makes thes fields clickable
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(
                  Icons.account_box,
                  // color: Color(0xff1044fb),
                ),
              ),
            ),

            InkWell(
              //inkwell makes thes fields clickable
              onTap: () {},
              child: ListTile(
                title: Text('Theme'),
                leading: Icon(
                  Icons.color_lens,
                  //  color: Color(0xff1044fb),
                ),
              ),
            ),

            Divider(),
            InkWell(
              //inkwell makes thes fields clickable
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                ),
              ),
            ),

            InkWell(
              //inkwell makes thes fields clickable
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          //image carousel
          image_carousel,
          Padding(padding: EdgeInsets.all(4),
            child: Text('Categories'),
          ),

          // Horizontal list begins here
          HorizontalList(),
        ],
      ),
    );
  }
}
