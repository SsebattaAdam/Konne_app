import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:konne_sp/screens/Users/user_client/User_looking_4_service.dart';
import 'package:konne_sp/screens/auth/Models/user_1_modle.dart';

import '../Authentication_Repositry/Authentication_repositry.dart';

import '../Authentication_Repositry/user1_Repositry.dart';
import '../Authentication_Repositry/user2_Repositry.dart';
import '../Models/user_2_modle.dart';
import '../forgotPasswordScreens/Fluuter_OTP_Screen/ottp_screen.dart';

class Signup_Servicepro2 extends GetxController {
  static Signup_Servicepro2 get tonewpage => Get.find();
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();



  final user2repo = Get.put(User2Repositry());

  void register_Service_provider(String email, String password)  {
    Authentication_repositry.to.createUserWithEmailAndPassword(email, password);
  }



  //phone number verification
  Future<void> CreateUser2(User2Model user2) async {
    await user2repo.CreateUser2(user2);
    Get.to (()=> User_looking_4_service());
    //phoneAurthentication(user2.phone);
   //Get.to(()=>OTP_Screen ());
  }

  //phone number verification
  void phoneAurthentication(String phone) {
    Authentication_repositry.to.phoneAurthentication(phone);
  }
}