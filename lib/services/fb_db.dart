import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class DataBaseService {
  Future<bool> verifygoogleuser(String email) async {
    bool ans = false;
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    querySnapshot.docs.forEach((userDoc) {
      if (userDoc["email"] == email) {
        ans = true;
        print(userDoc["name"] + " has his email in database");
      }
    });

    return ans;
  }

  Future<Map<dynamic, dynamic>> getusermap(String email) async {
    Map<dynamic, dynamic> user = {};
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    querySnapshot.docs.forEach((userDoc) {
      if (userDoc["email"] == email) {
        user = userDoc.data() as Map;
        print(user);
      }
    });
    return user;
  }

  bool verifphoneuser(String number) {
    bool ans = false;
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((userDoc) {
        if (userDoc["number"] == number) {
          ans = true;
        }
      });
    });

    return ans;
  }

  Future<bool> verifyinvite(String invite) async {
    bool ans = false;
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('invites').get();
      for (final invites in querySnapshot.docs) {
        print(invite);
        if (invites["code1"] == invite) {
          ans = true;
          break;
        } else if (invites["code2"] == invite) {
          ans = true;
          break;
        }
      }
    } catch (e) {
      ans = false;
      print(e);
    }
    return ans;
  }

  Future<bool> adduser(String name, String number, String gender,
      String photourl, String email, Position position, int age, String bio
      // GeoPoint location,
      ) async {
    bool status = false;
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      users.add({
        "age": age,
        "bio": bio,
        'name': name,
        'email': email,
        "photoURL": photourl,
        "gender": gender,
        "number": number,
        "location": GeoPoint(position.latitude, position.longitude),
        "attemptedques": false,
      }).then((value) => print("User Added"));
      status = true;
    } catch (e) {
      status = false;
      print(e);
    }
    return status;
  }
}
