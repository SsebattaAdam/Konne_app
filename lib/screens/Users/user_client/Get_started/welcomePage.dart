import 'package:flutter/material.dart';
import 'package:konne_sp/screens/Users/user_service_Provider/Get_started/sign_in.dart';
import 'package:konne_sp/screens/Users/user_service_Provider/Get_started/sign_up.dart';
import 'package:konne_sp/screens/Users/user_service_Provider/widgets/welcomeButtons.dart';
import 'package:konne_sp/screens/Users/user_service_Provider/widgets/customScafoldWidget.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: Column(
      children: [
        Flexible(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 40.0,
            ),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: 'KONNE',
                        style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                    TextSpan(
                        text: '\n Always at your service',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
        const Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: WelcomButtons(
                    buttonText: 'Sign Up',
                    color: Colors.transparent,
                    ontap: SignupPage(),
                    textColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: WelcomButtons(
                    buttonText: 'Sign In',
                    color: Colors.white,
                    ontap: SignInPage(),
                    textColor: Colors.blue,
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}
