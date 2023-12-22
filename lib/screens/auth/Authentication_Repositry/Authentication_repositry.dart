 import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
 import 'package:cloud_firestore/cloud_firestore.dart';

 import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:konne_sp/screens/auth/Authentication_Repositry/Exceptions/signupwithemailpasswordfailure.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Users/user_client/User_looking_4_service.dart';
import '../../Users/user_service_provider/product.dart';
import '../../main/home.dart';
import '../../main/login.dart';

class Authentication_repositry extends GetxController{
 static  Authentication_repositry get to => Get.find();




 //variables
final _auth = FirebaseAuth.instance;
late final Rx<User?> firebaseUser;
 var verificationId = ''.obs;


 @override
  void onReady() {
   firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _initialScreen);


//
  }

  _initialScreen(User? user) {

  user == null ? Get.offAll(() => const Login()) : Get.offAll(() => Home());

  }

  Future<void> phoneAurthentication(String phone) async {
  await _auth.verifyPhoneNumber(
   phoneNumber: phone,
 verificationCompleted:(credential) async {
     await _auth.signInWithCredential(credential);
 },

 codeSent: (verificationId, resendingToken) {
     this.verificationId.value = verificationId;},
 codeAutoRetrievalTimeout: (verificationId){
   this.verificationId.value = verificationId;
 },
 verificationFailed: (e) {
     if(e.code == 'invalid-phone-number'){
      Get.snackbar('eror','The provided phone number is not valid.');
     }
     else{
       Get.snackbar('eror','something went wrong, try again.');
     }
 },
 );
 }

 Future<void> sendEmailVerification() async {
   try {
     await _auth.currentUser?.sendEmailVerification();
   }
   on FirebaseAuthException catch (e) {
   final ex = signupwithemailpasswordfailure.Code(e.code);
   print("Firebase Exception: ${ex.message}");
   }
   catch (e) {
   final   ex = signupwithemailpasswordfailure();
   print("Firebase Exception: $e");
   throw ex;
   }
 }

 Future<bool> verifyOtp(String otp) async {

   var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(
       verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
 }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value = _auth.currentUser;
      firebaseUser.value != null ? Get.offAll(() =>  Home()) : Get.offAll(() =>  Login());
    } on FirebaseAuthException catch (e) {

    }
    catch (_) {

    }
  }

 Future<void> loginUserWithEmailAndPassword(String email, String password) async {
   try {
     await _auth.signInWithEmailAndPassword(email: email, password: password);

     // Route users based on collection after successful login

   } on FirebaseAuthException catch (e) {
     final ex = signupwithemailpasswordfailure.Code(e.code);
     print("Firebase Exception: ${ex.message}");
     // Handle the exception, show messages, or perform necessary actions
   } catch (e) {
     final ex = signupwithemailpasswordfailure();
     print("Firebase Exception: $e");
     // Handle other exceptions if needed
     throw ex;
   }
 }





  Future<void> logout() async => await _auth.signOut();
}