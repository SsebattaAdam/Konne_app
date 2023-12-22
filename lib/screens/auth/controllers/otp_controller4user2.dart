import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:konne_sp/screens/auth/Authentication_Repositry/Authentication_repositry.dart';

import '../../Users/user_client/User_looking_4_service.dart';


class OTPController2 extends GetxController{
  static  OTPController2 get tonewpage => Get.find();

  Future<void> verifyOtp(String otp) async {
    var isverified = await Authentication_repositry.to.verifyOtp(otp);
    isverified ? Get.offAll(() => User_looking_4_service()) : Get.back();
  }
}