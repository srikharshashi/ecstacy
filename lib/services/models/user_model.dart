import 'package:bloc_custom_firebase/services/fb_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  int phno;
  String bio;
  String gender;
  String location;
  String email;

  User(
      {required this.gender,
      required this.location,
      required this.name,
      required this.bio,
      required this.phno,
      required this.email});

//Give this method a snapshot and it will give you a list of user objects
  List<User> get_user_list(QuerySnapshot snapshot) {
    List<User> user_list = [];
    snapshot.docs.forEach((element) {
      User ob = User(
        name: element["name"],
        email: element["email"],
        location: element["location"],
        gender: element["gender"],
        bio: element["bio"],
        phno: element["number"],
      );
      user_list.add(ob);
    });
    return user_list;
  }
}
