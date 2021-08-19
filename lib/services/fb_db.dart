import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  Future<bool> verifygoogleuser(String? email) async {
    bool ans = false;
   QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection('users').get();
    querySnapshot.docs.forEach((userDoc) {
        if (userDoc["email"] == email) {
          ans = true;
          print(userDoc["name"]+" has his email in database");
        }
    });
    

    return ans;
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

  Future<QuerySnapshot> get_users() async {
    var ans = await FirebaseFirestore.instance.collection('users').get();
    return ans;
  }
}
