import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workplace/models/UserModel.dart';


class UserService{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<UserModel> users = [];
  UserModel? user;

  //get collection user and convert to list
  Future<List<UserModel>> retrieveUser() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("users").get();
    return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  //get all user
  Future<void> getAllUsers() async {
    var retrieveUserList = await retrieveUser();
    retrieveUserList.forEach((element) {
      UserModel user = UserModel(
          userId: element.userId,
          email: element.email,
          userName: element.userName
      );
      users.add(user);
      print("get User oke!");
    });
  }

  //get user
  Future<void> getUserById(String id) async {
    var retrieveUserList = await retrieveUser();
    retrieveUserList.forEach((element) {
      if(id==element.userId){
        user = UserModel(
            userId: element.userId,
            email: element.email,
            userName: element.userName
        );
      }
    });
  }

  Future<void> getUserByEmail(String email) async {
    var retrieveUserList = await retrieveUser();
    retrieveUserList.forEach((element) {
      if(element.email==email){
        user = UserModel(
            userId: element.userId,
            email: element.email,
            userName: element.userName
        );
      }
    });
  }
}