import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Fluuter_OTP_Screen/ottp_screen.dart';

class Email_verification_Screen extends StatelessWidget {
  const Email_verification_Screen({super.key});

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
                    'Email sent ',
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
                            child: Text("Resend Email", style: TextStyle(
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
                            child: Text("Back to previos Screen", style: TextStyle(
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
