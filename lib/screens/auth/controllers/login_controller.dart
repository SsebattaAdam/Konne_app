import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Authentication_Repositry/Authentication_repositry.dart';

class Logincontroller extends GetxController {
  static Logincontroller get tonewpage => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();


  void login(String email, String password) {
    Authentication_repositry.to.loginUserWithEmailAndPassword(email, password);
  }
}