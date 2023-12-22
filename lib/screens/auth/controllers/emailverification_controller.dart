import 'package:get/get.dart';

import '../Authentication_Repositry/Authentication_repositry.dart';

class  EmailVerificationController extends GetxController{

  static EmailVerificationController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    send_email_verifaction();
  }

  Future<void> send_email_verifaction() async {
    try {
      await  Authentication_repositry.to.sendEmailVerification();
    }
    catch (e){
      print("Error sending email $e");
    }


  }
}