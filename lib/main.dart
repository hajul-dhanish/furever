import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:furever/firebase_options.dart';
import 'package:furever/pages/get_started.dart';
import 'package:furever/utils/styles.dart';
import 'package:flutter/material.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FurEver',
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Styles.blackColor,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: Styles.blackColor)),
      home: const GetStarted(),
    );
  }
}
