import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTP_Screen extends StatelessWidget {
  const OTP_Screen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Text("DO\nDE\n",
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
                  OTPTextField(

                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 45,

                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 15,
                      style: TextStyle(fontSize: 17),
                    onCompleted:(pin){
                        print("The pin is $pin");
                  }
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    child:ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const OTP_Screen()),
                        );
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
