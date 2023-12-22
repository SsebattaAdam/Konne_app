import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Users/user_client/User_looking_4_service.dart';
import '../Models/user_2_modle.dart';
import '../controllers/Register_User2.dart';

class Register_user_looking3service extends StatelessWidget {
  const Register_user_looking3service({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    final controller = Get.put(Signup_Servicepro2());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.angleLeft, color: Colors.white,),
          onPressed: ()=> Get.back(),
        ),
        title: Text("Rgister, to create your account", style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Image.asset("images/konne.png"),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextField(
                            controller: controller.name,
                            decoration: InputDecoration(
                                labelText: "Name",
                                hintText: "Enter your name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: controller.phone,
                            decoration: InputDecoration(
                                labelText: "phoneNumber",
                                hintText: "Enter your phonenumber",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: controller.email,
                            decoration: InputDecoration(
                                labelText: "email",
                                hintText: "Email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: controller.password,
                            decoration: InputDecoration(

                                labelText: "password",
                                hintText: "Enter your password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                final user2 = User2Model(
                                  name : controller.name.text.trim(),
                                  email : controller.email.text.trim(),
                                  phone: controller.phone.text.trim(),
                                  password : controller.password.text.trim(),

                                );
                                Signup_Servicepro2.tonewpage.CreateUser2(user2);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: CupertinoColors.activeBlue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  )
                              ),
                              child: Text("Save ", style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),

                        ],
                      ))
                ],
              ))),
    );
  }
}
