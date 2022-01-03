class User {
  String name;
  String bio = "";
  String email;
  String photoURL;
  String gender;
  String number;
  int age;
  bool attemptedques;
  Map<String, dynamic> data ={};
  User(
      {required this.name,
      required this.email,
      required this.photoURL,
      required this.gender,
      required this.age,
      required this.number,
      required this.attemptedques});

  User.frommap(Map<dynamic, dynamic> user)
      : name = user["name"] as String,
        age = user["age"] as int,
        bio = user["bio"] as String,
        email = user["email"] as String,
        photoURL = user["photoURL"] as String,
        gender = user["gender"] as String,
        number = user["number"] as String,
        data=user["data"] as Map<String,dynamic>,
        attemptedques = user["attemptedques"] as bool;
}
