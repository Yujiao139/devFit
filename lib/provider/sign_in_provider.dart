import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ox_tech/screen/welcome/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screen/login/component/body.dart';




class SignInProvider extends ChangeNotifier{

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn= GoogleSignIn();
  final FacebookAuth facebookAuth = FacebookAuth.instance; 

  bool _isSignedIN = false;
  bool get isSignedIn => _isSignedIN;

  bool _hasError=false;
  bool get hasError =>_hasError;

  String? _errorCode;
  String? get errorCode => _errorCode;

  String? _provider;
  String? get provider => _provider;

  String? _email;
  String? get email => _email;

  String? _password;
  String? get password => _password;

  String? _uid;
  String? get uid => _uid;

  String? _name;
  String? get name => _name;

  String? _imageUrl;
  String? get imageUrl => _imageUrl;



  SignInProvider(){
    checkSignInUser();
  }

  Future checkSignInUser() async{
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIN = s.getBool("signed_in")?? false;
    notifyListeners();

  }

  Future setSignIn() async{
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("signed_in", true);
    _isSignedIN = true;
    notifyListeners();
  }


  Future signInWithGoogle() async {

    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;


    try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User? user = authResult.user;
    if(user!= null){
          _uid = user.uid;
          _name = user.displayName;
          _imageUrl = user.photoURL;
          _email = user.email;
          _provider = "Google";
          _isSignedIN = true;
          notifyListeners();
        }

    // 登录成功，可以执行后续操作，如跳转到主页等
    print('Google Sign-In successful! User ID: ${user?.email}');
  } catch (error) {
    print('Error signing in with Google: $error');
  }



//     final _auth = FirebaseAuth.instance;
//     final _googleSignIn = GoogleSignIn();
//     try{
//       final GoogleSignInAccount? googleSignInAccount = 
//           await _googleSignIn.signIn();
//       if(googleSignInAccount!= null){
//         final GoogleSignInAuthentication googleSignInAuthentication = 
//             await googleSignInAccount.authentication;
//         final AuthCredential authCredential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );
//         await _auth.signInWithCredential(authCredential);
//       }
// 
//     } on FirebaseAuthException catch(e){
//       print(e.message);
//       throw e;

   // }



//     final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication? googleAuth =
//         await googleSignInAccount?.authentication;
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//     final User? user = (await firebaseAuth.signInWithCredential(credential)).user;
//     assert(_email != null);
//     assert(_name != null);
//     //assert(!user.isAnonymous);
//     assert(await user?.getIdToken() != null);
// 
//     //final FirebaseUser currentUser =  (await firebaseAuth.signInWithCredential(credential)).user();
//     //assert(_uid == currentUser.uid);
// 
//     return 'signInWithGoogle succeeded: $user';



//     final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;
// 
// 
//     if(googleSignInAccount != null){//executing our authentication
//       try{
//         final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );
//         //signing to firebase user instance
//         final User? user = (await firebaseAuth.signInWithCredential(credential)).user;
// 
//         //save all values
//         if(user!= null){
//           _uid = user.uid;
//           _name = user.displayName;
//           _imageUrl = user.photoURL;
//           _email = user.email;
//           _provider = "Google";
//           _isSignedIN = true;
//           notifyListeners();
//         }
//       }on FirebaseAuthException catch(e){
//         switch(e.code){
//           case"account-exists-with-different-credential":
//           _errorCode="You are already signed in with another account";
//           _hasError=true;
//           notifyListeners();
//           break;
// 
//           case "null":
//           _errorCode="Something went wrong";
//           _hasError = true;
//           notifyListeners();
//           break;
//           default:
//           _errorCode = e.toString();
//           _hasError = true;
//           notifyListeners();
//         }
//       }
//     }else{
//       _hasError = true;
//       _errorCode = "Google Sign In Failed";
//       notifyListeners();
//     }








  }
    

//enter for firetore
Future getUserDataFromFirestore(uid) async{
  await FirebaseFirestore.instance.collection("users").doc(uid).get().then((DocumentSnapshot snapshot) =>{
    _uid = snapshot['uid'],
    _name = snapshot['name'],
    _imageUrl = snapshot['imageUrl'],
    _email = snapshot['email'],
    _provider = snapshot['provider'],
    _isSignedIN = true,
  });
}

Future saveDataToFirestore() async{
  final DocumentReference r = FirebaseFirestore.instance.collection("users").doc(uid);
  await r.set({
    "uid": _uid,
    "name": _name,
    "imageUrl": _imageUrl,
    "email": _email,
    "provider": _provider,
    "signed_in": true,
  });
  notifyListeners();
}

Future saveDataToSharedPreferences() async{
  final SharedPreferences s = await SharedPreferences.getInstance();
  
  await s.setString("uid", _uid!);
  await s.setString("name", _name!);
  await s.setString("imageUrl", _imageUrl!);
  await s.setString("email", _email!);
  await s.setString("provider", _provider!);
  await s.setBool("signed_in", true);
  notifyListeners();
}


    //check user exists or not in firebase
    Future<bool> checkUserExists() async{
      DocumentSnapshot snap = await FirebaseFirestore.instance.collection('user').doc(_uid).get();
      if(snap.exists){
        print("Existing User");
        return true;
      }else{
        print("New User");
        return false;
      }
    }



    //sign out
    Future userSignOut() async{
      await firebaseAuth.signOut();
      await googleSignIn.signOut();
      _isSignedIN = false;
      notifyListeners();
      clearStoredData();
      return Body().handleAfterSignOut;
    }


    Future clearStoredData() async{
      final SharedPreferences s = await SharedPreferences.getInstance();
      s.clear();
    }
  }

