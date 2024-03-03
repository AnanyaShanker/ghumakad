import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ghumakad/screens/splash/main_splash_screen.dart';
import 'package:ghumakad/screens/splash/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghumakkad',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasError) {
      //       return Text(snapshot.error.toString());
      //     }
      //     if (snapshot.connectionState == ConnectionState.active) {
      //       if (snapshot.data == null) {
      //         return const SplashScreen();
      //       } else {
      //         return const MainSplashScreen();
      //       }
      //     } else {
      //       return const Text("No Error");
      //     }
      //   },
      // ),
      home: SplashScreen(),
    );
  }
}
