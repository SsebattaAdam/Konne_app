import 'package:flutter/material.dart';


class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Container(
        color: Color(0xff1044fb),
        child: Positioned(
          child: Stack(
            children: [

              Positioned(
                child: Container(
                  width: 125,
                  height: 83,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white10,

                    ),
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 7,
                      blurRadius: 5,
                      offset: Offset(0,3),

                    )],

                  ),

                  margin: EdgeInsets.only(left:25,top: 75),
                  child: Stack(

                  children: [
                    Image(image:AssetImage('images/elec.jpeg'),
                    fit: BoxFit.cover,
                    )



                  ],
                  ),
                ),
              ),

            ],

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
