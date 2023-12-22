import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Models/user_1_modle.dart';

class User1Repositry extends GetxController {
  static User1Repositry get to => Get.find();

  final _db = FirebaseFirestore.instance;

  CreateUser1(User1Model user1model) async {
   await   _db.collection("User1").add(user1model.toJson()).whenComplete(
            () => Get.snackbar("Success", "Accoount has been created",
                snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green
            )

    ).catchError((error, stackTrace){
      Get.snackbar("Error ", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.green
      );
      print(error.toString());
    });

  }


  //2 fetching data from the database
  Future<User1Model> getUser1Details(String email) async{
    final snapshot = await _db.collection("User1").where("email", isEqualTo: email).get();
    final user1Data = snapshot.docs.map((e) => User1Model.fromSnapshot(e)).single;
    return user1Data;
    
  }
}
