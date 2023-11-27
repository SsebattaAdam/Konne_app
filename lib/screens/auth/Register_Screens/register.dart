import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:konne_sp/screens/main/home.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/reusable.dart';
import '../../Users/user_service_provider/product.dart';

class RegisterScreen1 extends StatefulWidget {
  const RegisterScreen1({Key? key}) : super(key: key);

  @override
  _RegisterScreen1State createState() => _RegisterScreen1State();
}

class _RegisterScreen1State extends State<RegisterScreen1> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // backgroundColor: Color(0xff1044fb),
      appBar: AppBar(
        backgroundColor: Color(0xff1044fb),
        title: Text('REGISTER ',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'kadwa',
          fontSize: 20,

        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              InkWell(
                onTap: () async {
                  XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    imageXFile = image;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    //color: Colors.grey[300], // Change the background color
                    borderRadius: BorderRadius.circular(8), // Set border radius for rectangular shape
                  ),
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.8, // Set width to match CustomTextField
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.12,
                        backgroundColor: Color(0xff1044fb),
                        backgroundImage: imageXFile == null
                            ? null
                            : FileImage(File(imageXFile!.path)),
                        child: imageXFile == null
                            ? Icon(
                          Icons.add_photo_alternate,
                          size: MediaQuery.of(context).size.width * 0.1,
                          color: Colors.white,
                        )
                            : null,
                      ),
                      SizedBox(width: 8), // Add some space between CircleAvatar and text
                      Text(
                        'Add Company Logo here',
                        style: TextStyle(color: Color(0xff1044fb),
                        fontFamily: 'kadwa',
                          fontWeight: FontWeight.w800,


                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),


              Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        data: Icons.person,
                        controller: nameController,
                        hintText: "Company name",
                        isObscure: false,
                      ),
                    ),
                   /* Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        data: Icons.location_city_outlined,
                        controller: cityController,
                        hintText: "Current City",
                        isObscure: false,
                      ),
                    ),*/
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        data: Icons.email,
                        controller: emailController,
                        hintText: "Email",
                        isObscure: false,
                      ),
                    ),
                    /*Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        data: Icons.phone,
                        controller: contactController,
                        hintText: "Contact",
                        isObscure: false,
                      ),
                    ),*/

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        data: Icons.house,
                        controller: serviceController,
                        hintText: "Service Provided",
                        isObscure: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        data: Icons.lock,
                        controller: passwordController,
                        hintText: "Password",
                        isObscure: true,
                      ),
                    ),
                    SizedBox(height: 10,),
                    signInSignUpButton(context, false, (){
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text
                      ).then((value){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>ProductForm()));
                      }).catchError((e){
                        print(e);
                      });

                    })
                /*Padding(padding: const EdgeInsets.all(8.0),

                      child: ElevatedButton(
                        onPressed: () {
                          onTap(){
                            Navigator.push(
                              context, MaterialPageRoute(builder: (context)=> Home())
                            );
                          }
                          // Put your sign up function here
                        },
                        child: Text('Sign Up'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                      ),
                    )*/





                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
