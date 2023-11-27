import 'package:flutter/material.dart';
import 'package:konne_sp/screens/auth/Users/Register_Screens/register.dart';
import 'package:konne_sp/utils/color_utils.dart';

import '../../widgets/reusable.dart';
import '../forgotPasswordScreens/forgot_password_email/forgotpassword_email.dart';
import '../forgotPasswordScreens/forgot_password_phone/forfotpassword_phone.dart';
import 'Users/User_looking_4_service.dart';
import 'Users/product.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1044fb), // Set the background color here
      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.fromLTRB(35, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              //logoWidget("images/konneb.png"),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text('KONNE',
                  style: const TextStyle(
                    fontFamily: 'kadwa',
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                  ),

                ),

              ),
              SizedBox(height: 20,),
              reusableTextField("Enter Email", Icons.email_outlined, true,
                  _emailTextController),
              SizedBox(height: 20,),
              reusableTextField("Enter Password", Icons.lock_outline, true,
                  _passwordTextController),
              SizedBox(height: 20,),
              signInSignUpButton(context, true, () {}),
              SizedBox(height: 20,),
              //RESET PASSWORD
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(context: context,
                        builder: (context)=> Container(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Make a selection",
                                style: TextStyle(
                                  fontFamily: 'kadwa',
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text("Select a suitable way to reset your password",
                                style: TextStyle(
                                  fontFamily: 'kadwa',
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 30,),
                              
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context)=> ResetPassword_Email_Screen()));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                
                                  ),
                                  child: Row(
                                    children: [

                                      Icon(Icons.email_outlined,color: Colors.white, size: 60,),
                                  SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text("Email",
                                        style: TextStyle(
                                          fontFamily: 'kadwa',
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text("Reset via E mail valifications",
                                        style: TextStyle(
                                          fontFamily: 'kadwa',
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context)=> ResetPassword_Phone_Screen()));
                                },
                                child: Container(

                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),

                                  ),
                                  child: Row(
                                    children: [

                                      Icon(Icons.phone_android_outlined,color: Colors.white, size: 60,),
                                  SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Phone",
                                        style: TextStyle(
                                          fontFamily: 'kadwa',
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text("Reset via Phone valifications",
                                        style: TextStyle(
                                          fontFamily: 'kadwa',
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        )
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'kadwa',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              signUpOption()

            ],


          ),
        ),
      ),
    );
  }
Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        const Text("Don't have an account?",
        style: TextStyle(color: Colors.white70)
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(context: context,
                builder: (context)=> Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Make a selection",
                          style: TextStyle(
                            fontFamily: 'kadwa',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text("Sign up as a user or a service provider",
                          style: TextStyle(
                            fontFamily: 'kadwa',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 30,),

                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context)=> User_looking_4_service()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Row(
                              children: [

                                Icon(Icons.person_2,color: Colors.white, size: 60,),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text("As a user ",
                                      style: TextStyle(
                                        fontFamily: 'kadwa',
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text("Looking for services",
                                      style: TextStyle(
                                        fontFamily: 'kadwa',
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context)=> RegisterScreen1()));
                          },
                          child: Container(

                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Row(
                              children: [

                                Icon(Icons.design_services,color: Colors.white, size: 60,),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("As a service provider",
                                      style: TextStyle(
                                        fontFamily: 'kadwa',
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text("sign in to post your services",
                                      style: TextStyle(
                                        fontFamily: 'kadwa',
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                )
            );
          },
          child: const Text("Sign up",
          style: TextStyle(color: Colors.white,fontFamily: 'kadwa',fontWeight: FontWeight.bold),
          ),
        )
      ],

    );
}


}
