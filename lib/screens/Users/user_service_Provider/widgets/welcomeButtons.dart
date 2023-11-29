import 'package:flutter/material.dart';

class WelcomButtons extends StatelessWidget {
  const WelcomButtons({super.key, this.buttonText,this.textColor,this.color, this.ontap});
  final String? buttonText;
  final Widget? ontap;
  final Color? color, textColor;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (e)=>ontap!));
      },
      child: Container(
        padding: const EdgeInsets.all(30.0),

        decoration:  BoxDecoration(
            color: color!,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
            )),
        child: Text(
          buttonText!,
          textAlign: TextAlign.center,
          style:  TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: textColor!,
          ),
        ),
      ),
    );
  }
}
