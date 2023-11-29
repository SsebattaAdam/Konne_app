//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:konne_sp/screens/Users/user_service_Provider/Get_started/welcomePage.dart';
//import 'package:konne_sp/screens/auth/Users/Register_Screens/register.dart';
//import 'package:konne_sp/screens/main/splashscreen.dart';

void main() /*async*/{
 /* WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
*/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Loginscreen(),
    );
  }
}


