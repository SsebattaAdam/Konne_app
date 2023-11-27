import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konne_sp/screens/main/login.dart';

import 'package:konne_sp/screens/main/splashscreen2.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
{
  startTimer()
  {
    Timer( 
      const Duration(seconds: 3),
        ()
        async{
        Navigator.push(context, MaterialPageRoute(builder: (c)=> const Login()  ));
        }
    
    
    );
    
  }
  
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xff1044fb),
        child: Center(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('KONNE',
                    style: const TextStyle(
                      fontFamily: 'kadwa',
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w500,
                    ),

                  ),

              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
           /* children: [
           //   Image.asset('images/konneb.png'),
            //  SizedBox(height: 18,),
            //  const Padding(
            //      padding: const EdgeInsets.all(25.0),

              )
            ],*/

          ),
        ),
      ),
    );
  }
}
