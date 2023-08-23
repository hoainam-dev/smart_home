import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? userId;
  String? email;
  String? userName;

  UserModel({this.userId, this.email, this.userName});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'userName': userName,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : userId = doc.id,
        email = doc.data()!["email"],
        userName = doc.data()!["userName"];


  UserModel.fromMap(Map<String, dynamic> userMap)
      : userId = userMap["userId"],
        email = userMap["email"],
        userName = userMap["userName"];
}