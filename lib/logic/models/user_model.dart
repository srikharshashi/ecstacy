class User {
  String name;
  String bio;
  String email;
  String photoURL;
  String gender;
  String number;
  User({
    required this.name,
    required this.bio,
    required this.email,
    required this.photoURL,
    required this.gender,
    required this.number,
  });

  User.frommap(Map<dynamic, dynamic> user)
      : name = user["name"] as String,
        bio = user["bio"] as String,
        email = user["email"] as String,
        photoURL = user["photoURL"] as String,
        gender = user["gender"] as String,
        number = user["number"] as String;
}
