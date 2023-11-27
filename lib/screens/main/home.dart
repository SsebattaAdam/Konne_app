import 'package:flutter/material.dart';
import 'package:konne_sp/screens/main/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Logout'),
          onPressed: (){
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>Login()));
          },
        ),
      ),
    );
  }
}
