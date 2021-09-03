import 'package:bloc_custom_firebase/services/fb_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late String name;
  late String phno;
  late String bio;
  late String gender;
  late String location;
  late String email;
  late String photoURL;

// //Give this method a snapshot and it will give you a list of user objects
//   List<User> get_user_list(QuerySnapshot snapshot) {
//     List<User> user_list = [];
//     snapshot.docs.forEach((element) {
//       User ob = User(
//         name: element["name"],
//         email: element["email"],
//         location: element["location"],
//         gender: element["gender"],
//         bio: element["bio"],
//         phno: element["number"],
//       );
//       user_list.add(ob);
//     });
//     return user_list;
//   }
}
