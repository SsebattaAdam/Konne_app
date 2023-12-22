import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../main/home.dart';
import '../Authentication_Repositry/Authentication_repositry.dart';

class OTPController extends GetxController{
  static  OTPController get tonewpage => Get.find();

  Future<void> verifyOtp(String otp) async {
    var isverified = await Authentication_repositry.to.verifyOtp(otp);
    isverified ? Get.offAll(() => Home()) : Get.back();
  }
}