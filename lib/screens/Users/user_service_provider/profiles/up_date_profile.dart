import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:konne_sp/screens/auth/Models/user_1_modle.dart';

import '../../../auth/controllers/Profile_Controller.dart';

class UpdateProfileScren extends StatelessWidget {
  const UpdateProfileScren({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(user1ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.angleLeft, color: Colors.white,),
          onPressed: ()=> Get.back(),
        ),
        title: Text("Edit  Profile", style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20),
              child: FutureBuilder(
                //us pass the data to the fome
                future: controller.getUser1Data(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasData){
                      User1Model user1data = snapshot.data as User1Model;
                      return Column(
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
                                  child: Icon(FontAwesomeIcons.camera, color: CupertinoColors.darkBackgroundGray, size: 20,),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    initialValue : user1data.name,
                                    decoration: InputDecoration(
                                        labelText: "name",

                                        hintText: "Enter your company name",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    initialValue : user1data.phone,
                                    decoration: InputDecoration(
                                        labelText: "phone",
                                        hintText: "Enter your phonenumber",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    initialValue : user1data.email,
                                    decoration: InputDecoration(
                                        labelText: "email",
                                        hintText: "Enter your phonenumber",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    initialValue : user1data.service,
                                    decoration: InputDecoration(
                                        labelText: "Service",
                                        hintText: "Services provided",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    initialValue : user1data.password,
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
                                      onPressed: () => Get.to(() => UpdateProfileScren()),
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
                      );
                    } else  if(snapshot.hasError){
                      return Center( child: Text(snapshot.error.toString()));
                    } else {
                      return Center( child: Text("Something went wrong"));
                    }

                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                },
              )
          )
      ),

    );
  }
}
