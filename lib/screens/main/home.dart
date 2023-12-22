import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konne_sp/screens/main/login.dart';

import '../Users/user_service_provider/profiles/Uer_profile.dart';
import '../auth/Authentication_Repositry/Authentication_repositry.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: ElevatedButton(
          child: Text('Logout'),
          onPressed: (){
            Authentication_repositry.to.logout();
          },
        ),
      ),
    );
  }
}
