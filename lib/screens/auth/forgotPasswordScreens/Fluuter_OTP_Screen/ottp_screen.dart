import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/otp_controller.dart';


class OTP_Screen extends StatelessWidget {
  const OTP_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    var OTPController1 = Get.put(OTPController());
    var otp;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),

            child: Center(
              child: Column(
      
                mainAxisAlignment: MainAxisAlignment.center,
      
                children: [
                  SizedBox(height: 150,),
                  Text("CO\nDE\n",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 80,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
      
                  Text("Code verifcation", style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
                  Text("Enter the verification code" , style: GoogleFonts.montserrat(
                    fontSize: 12,
                  )),
                  Text("at you email" , style: GoogleFonts.montserrat(
                    fontSize: 12,
                  )),
                  SizedBox(height: 20,),
                  OtpTextField(
                    mainAxisAlignment: MainAxisAlignment.center,
                    numberOfFields: 6,

                    borderColor: Colors.black,
                    fillColor: Colors.black,
                    showFieldAsBox: true,
                    onSubmit: ( String code) {
                      otp= code;
                      OTPController.tonewpage.verifyOtp(otp);

                    },

                  ),

                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    child:ElevatedButton(
                      onPressed: () {
                        OTPController.tonewpage.verifyOtp(otp);

                      },
                      child: Text("Continue", style: TextStyle(
                        fontFamily: 'kadwa',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Change the button color here
                      ),
                    ),

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
