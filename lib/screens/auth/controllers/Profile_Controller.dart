import 'package:get/get.dart';

import '../Authentication_Repositry/Authentication_repositry.dart';
import '../Authentication_Repositry/user1_Repositry.dart';

class user1ProfileController extends GetxController{
  static   user1ProfileController get to => Get.find();

  final _authRepo1 = Get.put(Authentication_repositry());
  final _userRepo1 = Get.put(User1Repositry());


  getUser1Data(){
    final email = _authRepo1.firebaseUser.value?.email;
    if(email != null){
      return  _userRepo1.getUser1Details(email);
    }
    else{
      Get.snackbar("Error", "Login to continue");
    }
  }
}