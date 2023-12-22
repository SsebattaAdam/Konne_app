import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterUser1_Service_provider extends StatefulWidget {
  const RegisterUser1_Service_provider({super.key});

  @override
  State<RegisterUser1_Service_provider> createState() => _RegisterUser1_Service_providerState();
}

class _RegisterUser1_Service_providerState extends State<RegisterUser1_Service_provider> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    String error_message ="";
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Diary App Register screen",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: FormBuilder(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'name',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.required(),
                      decoration: InputDecoration(
                        labelText: "Company name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'name',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.required(),
                      decoration: InputDecoration(
                        labelText: "Fullname",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'name',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.required(),
                      decoration: InputDecoration(
                        labelText: "Fullname",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'name',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.required(),
                      decoration: InputDecoration(
                        labelText: "Fullname",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    error_message.isEmpty?
                    const SizedBox():
                    Container(
                      child: Text(error_message ,
                          style: TextStyle(
                              color: Colors.white
                          )),
                      color: Colors.red,
                      width: double.infinity,
                      padding: EdgeInsets.all(15),

                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.green,
                            onPressed: () async {

                              setState(() {
                                error_message = "";
                              });

                              if (!_formKey.currentState!.validate()) {

                              }

                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: MaterialButton(
                            color: Colors.blue,
                            onPressed: () {
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}
