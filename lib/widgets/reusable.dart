import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/auth/controllers/Register_Servicepro.dart';
import '../screens/auth/controllers/login_controller.dart';
import '../screens/auth/forgotPasswordScreens/Fluuter_OTP_Screen/ottp_screen.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    // color: Colors.white,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
       {required TextEditingController controller}){
  return TextField(
    controller: controller,

    enableSuggestions: !isPasswordType,

    cursorColor: Colors.white,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black, ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0,style: BorderStyle.none)
      ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.blue.withOpacity(0.7), width: 1.0),
        ),
    ),
    keyboardType: isPasswordType
    ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(
BuildContext context, bool isLogin, Function onTop
){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10,0,20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),

    child: ElevatedButton(
      onPressed: (){
        final controller = Get.put(Signup_Servicepro());
       // final controller1 = Get.put( Logincontroller());
       // Logincontroller.tonewpage.login(controller1.email.text, controller1.password.text);
        Signup_Servicepro.tonewpage.phoneAurthentication(controller.phone.text.trim());
        Get.to(()=>OTP_Screen ());
      },
      child: Text(
        isLogin ? 'LOG IN': 'REGISTER',
        style: const TextStyle(
          color: Colors.black87,fontWeight: FontWeight.bold, fontSize: 16
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if(states.contains(MaterialState.pressed)){
            return Colors.black26;
          }
          return Colors.white;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        )
      ),
    ),

  );
}