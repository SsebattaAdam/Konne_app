import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:konne_sp/screens/Users/user_service_provider/profiles/profileMenueWidget.dart';
import 'package:konne_sp/screens/Users/user_service_provider/profiles/up_date_profile.dart';

import '../../../auth/Authentication_Repositry/Authentication_repositry.dart';

class userProfileCreen extends StatelessWidget {
  static userProfileCreen get tonewpage => Get.find();

  const userProfileCreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.angleLeft, color: Colors.white,),
          onPressed: () {},
        ),
        title: Text("User Profile", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? FontAwesomeIcons.sun : FontAwesomeIcons.moon, color: Colors.white,),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Image.asset("images/carpentry.jpeg"),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                              color: CupertinoColors.activeBlue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(FontAwesomeIcons.pencil, color: CupertinoColors.darkBackgroundGray, size: 20,),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "wlcome you ur user profile",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "U can modify each and everything",
                    style: TextStyle(fontSize: 18, ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () => Get.to(() => UpdateProfileScren()),
                    style: ElevatedButton.styleFrom(
                      primary: CupertinoColors.activeBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  child: Text("Edit Profile", style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                 SizedBox( height: 10,),
                  Divider(),
                  SizedBox( height: 10,),

                  // menue
                  ProfileManuewidget(
                    title: "upadete Profile",
                    icon: FontAwesomeIcons.user,
                    onpress: (){},
                  ),
                  ProfileManuewidget(
                    title: "logout",
                    textcolor: Colors.red,
                    icon: FontAwesomeIcons.user,
                    endicon: false,
                    onpress: (){
                      Authentication_repositry.to.logout();
                    },
                  ),

                ],
              ))),
    );
  }
}


