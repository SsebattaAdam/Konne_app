

import 'package:cloud_firestore/cloud_firestore.dart';

class User2Model {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final int userType;


  User2Model(
      {this.id,
      required this.name,
      required this.email,
      required this.phone,

      required this.password,
        this.userType = 1,
    });

  toJson() {
    return {
      "name": this.name,
      "email": this.email,
      "password": this.password,
      "phone": this.phone,
      "userType": this.userType,

    };
  }

//Fetching data from the firestore
factory User2Model.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;

    return User2Model(
      id: document.id,
      name: data["name"],
      email:data["email"],
      password:data["password"],
      phone:data["phone"],
      userType: data["userType"] ?? 0,


    );
  }
}
