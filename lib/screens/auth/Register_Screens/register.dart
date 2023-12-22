import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/reusable.dart';

import '../../main/home.dart';
import '../Models/user_1_modle.dart';
import '../controllers/Register_Servicepro.dart';
import '../Authentication_Repositry/user1_Repositry.dart';
import '../forgotPasswordScreens/Fluuter_OTP_Screen/ottp_screen.dart';

class RegisterScreen1 extends StatefulWidget {
  const RegisterScreen1({Key? key}) : super(key: key);

  @override
  _RegisterScreen1State createState() => _RegisterScreen1State();
}

class _RegisterScreen1State extends State<RegisterScreen1> {
  final _formKey = GlobalKey<FormBuilderState>();

  final controller = Get.put(Signup_Servicepro());

  String error_message ="";

  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff1044fb),
      appBar: AppBar(

        backgroundColor: Color(0xff1044fb),
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.angleLeft, color: Colors.white,),
          onPressed: ()=> Get.back(),
        ),
        title: Text(
          'REGISTER ',
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
                  XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    imageXFile = image;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    //color: Colors.grey[300], // Change the background color
                    borderRadius: BorderRadius.circular(
                        8), // Set border radius for rectangular shape
                  ),
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.8,
                  // Set width to match CustomTextField
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
                      SizedBox(width: 8),
                      // Add some space between CircleAvatar and text
                      Text(
                        'Add Company Logo here',
                        style: TextStyle(
                          color: Color(0xff1044fb),
                          fontFamily: 'kadwa',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              FormBuilder(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          data: Icons.person,
                          controller: controller.name,
                          hintText: "Company name",
                          isObscure: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.required(),
                  
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
                          controller: controller.email,
                          hintText: "Email",
                          isObscure: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.required(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          data: Icons.phone,
                          controller: controller.phone,
                          hintText: "phone number",
                          isObscure: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.required(),
                        ),
                      ),
                  
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          data: Icons.house,
                          controller: controller.service,
                          hintText: "Service Provided",
                          isObscure: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.required(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          data: Icons.lock,
                          controller: controller.password,
                          hintText: "Password",
                          isObscure: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(6),
                          ]),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      // signInSignUpButton(context, false, (){
                  
                      //Signup_Servicepro.tonewpage.register_Service_provider(controller.email.text, controller.password.text);
                      //  Signup_Servicepro.tonewpage.phoneAurthentication(controller.phone.text.trim());
                      //  Get.to(()=>OTP_Screen ());
                      //  })
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(

                          onPressed: () {
                            setState(() {
                              error_message = "";
                            });

                            // Check if individual fields are empty
                            if (controller.name.text.trim().isEmpty ||
                                controller.email.text.trim().isEmpty ||
                                controller.phone.text.trim().isEmpty ||
                                controller.service.text.trim().isEmpty ||
                                controller.password.text.trim().isEmpty) {
                              Get.snackbar(
                                "Error ",
                                "Please fill in all fields",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.redAccent.withOpacity(0.1),
                                colorText: Colors.red,
                              );
                              return;
                            }

                            // Proceed with form validation
                            if (!_formKey.currentState!.validate()) {
                              Get.snackbar(
                                "Error ",
                                "Something went wrong",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.redAccent.withOpacity(0.1),
                                colorText: Colors.red,
                              );
                              return;
                            }

                            // Continue with the login logic or user creation
                            Signup_Servicepro.tonewpage.phoneAurthentication(controller.phone.text.trim());
                            Get.to(() => OTP_Screen());

                            final user1 = User1Model(
                              name: controller.name.text.trim(),
                              email: controller.email.text.trim(),
                              phone: controller.phone.text.trim(),
                              service: controller.service.text.trim(),
                              password: controller.password.text.trim(),
                            );
                            Signup_Servicepro.tonewpage.CreateUser1(user1);
                          },

                          child: Text('Sign Up'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}


