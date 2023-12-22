import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:konne_sp/screens/auth/Models/user_1_modle.dart';

import '../Authentication_Repositry/Authentication_repositry.dart';
import '../Authentication_Repositry/user1_Repositry.dart';
import '../forgotPasswordScreens/Fluuter_OTP_Screen/ottp_screen.dart';

class Signup_Servicepro extends GetxController {
  static Signup_Servicepro get tonewpage => Get.find();
  final name = TextEditingController();
  final  city = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final  contact = TextEditingController();
  final  service = TextEditingController();
  final password = TextEditingController();
  final  confirmPassword = TextEditingController();


  final user1repo = Get.put(User1Repositry());

  void register_Service_provider(String email, String password)  {
    Authentication_repositry.to.createUserWithEmailAndPassword(email, password);
  }



  //phone number verification
  Future<void> CreateUser1(User1Model user1) async {
    await user1repo.CreateUser1(user1);
    phoneAurthentication(user1.phone);
    Get.to(()=>OTP_Screen ());
  }

  //phone number verification
  void phoneAurthentication(String phone) {
    Authentication_repositry.to.phoneAurthentication(phone);
  }
}