import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Fluuter_OTP_Screen/forgotpassword_otp.dart';

class ResetPassword_Phone_Screen extends StatelessWidget {
  const ResetPassword_Phone_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
      
              children: [
                Text(
                  'Reset your password',
                  style: TextStyle(
                    fontFamily: 'kadwa',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
      
                ),
      
      
                Image.asset(
                  'images/logo1.jpg', // Replace with your image path
                  width: 500, // Set width as needed
                  height: 500, // Set height as needed
                  // Additional image properties go here
                ),
                SizedBox(height: 20),
                Form(child: Column(
                  children:[
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'Enter your phone number',
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          fontFamily: 'kadwa',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: TextStyle(
                          fontFamily: 'kadwa',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
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
                  ]
                ),
      
                )
              ],
            )
      
          ),
        ),
      ),
    );
  }
}
