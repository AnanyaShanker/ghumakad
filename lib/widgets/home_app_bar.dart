import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghumakad/screens/login_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

String displayName = "Guest";

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  User? user = FirebaseAuth.instance.currentUser;

  String userName = displayName;

  logout() async {
    // await FirebaseAuth.instance.signOut();
    // Navigator.of(context)
    //     .pushReplacement(MaterialPageRoute(builder: (context) => LoginIn()));

    if (GoogleSignIn().currentUser != null) {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
    }

    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().disconnect();
    } catch (e) {
      print('failed to disconnect on signout');
    }
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: logout,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.sort_rounded,
                size: 28,
              ),
            ),
          ),
          Text(
            "Hello $userName",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.search,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
