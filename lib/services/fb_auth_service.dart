import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FB_Service {
  // final FirebaseAuth firebaseAuth=FirebaseAuth.instance;

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    print("In repo initialized fire base");
  }

  Future<bool> create(String email, String password) async {
    try {
      var result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return false;
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<bool> signin(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }

  bool checkSignin() {
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      print("Current user uid ${currentUser.uid}");
      return true;
    } else
      return false;
  }

  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> registerwithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email');
        return false;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  String? get_user_email() {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email;
    } else
      return "";
  }

   late String verifid;

  Future<bool> phoneSignIn({
    required String phoneNumber,
  }) async {
    bool signin = false;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted:
            (PhoneAuthCredential phoneauthcredential) async {},
        codeAutoRetrievalTimeout: (String verificationId) {},
        codeSent: (String verificationId, int? forceResendingToken) {
          verifid = verificationId;
        },
        verificationFailed: (FirebaseAuthException error) {},
      );
      signin = true;
    } catch (e) {
      signin = false;
    }
    return signin;
  }

  //MAKE SURE THIS IS ONLY CALLED AFTER THE ABOVE METHOD HAS BEEN CALLED TO OBTAIN THE VERIFID
  Future<bool> signinwithOTP(String OTP) async {
    bool signin = false;

    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verifid, smsCode: OTP);

      await FirebaseAuth.instance.signInWithCredential(credential);
      signin = true;
    } catch (e) {
      signin = false;
      print(e);
    }
    return signin;
  }

 

  
}
