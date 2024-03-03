import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghumakad/screens/bottombar.dart';
import 'package:ghumakad/widgets/home_app_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginIn extends StatefulWidget {
  LoginIn({Key? key}) : super(key: key);

  @override
  State<LoginIn> createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _isLoggedIn
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(_userObj.photoUrl!),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(_userObj.displayName!),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(_userObj.email),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        _googleSignIn.signOut().then((value) {
                          setState(() {
                            _isLoggedIn = false;
                          });
                        }).catchError((e) {});
                      },
                      height: 50,
                      minWidth: 100,
                      color: Colors.red,
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: MaterialButton(
                onPressed: () async {
                  await signInWithGoogle();
                  // _googleSignIn.signIn().then((userData) {
                  //   setState(() {
                  //     _isLoggedIn = true;
                  //     _userObj = userData!;
                  //   });
                  // }).catchError((e) {
                  //   print(e);
                  // });
                },
                height: 50,
                minWidth: 100,
                color: Colors.red,
                child: const Text(
                  'Google Signin',
                  style: TextStyle(color: Colors.white),
                ),
              )),
      ),
    );
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    displayName = userCredential.user!.displayName!; // to store user name
    print(displayName);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => BottomBar()));
  }
}
