

import 'package:cloud_firestore/cloud_firestore.dart';

class User1Model {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String service;
  final String? image;
  final int userType;

  User1Model(
      {this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.service,
      required this.password,
        this.userType = 1,
      this.image});

  toJson() {
    return {
      "name": this.name,
      "email": this.email,
      "password": this.password,
      "phone": this.phone,
      "service": this.service,
      "image": this.image,
      "userType": this.userType,
    };
  }

//Fetching data from the firestore
factory User1Model.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;

    return User1Model(
      id: document.id,
      name: data["name"],
      email:data["email"],
      password:data["password"],
      phone:data["phone"],
      service:data["service"],
      image: data["image"],
      userType: data["userType"] ?? 1,

    );
  }
}
