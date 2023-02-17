import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive_screen/mobile_screen_layout/mobile_Screen.dart';
import 'package:instagram_clone/responsive_screen/responsive_layout.dart';
import 'package:instagram_clone/responsive_screen/web_screen_layout/web_Screen.dart';
import 'package:instagram_clone/screen/login_screen.dart';
import 'package:instagram_clone/screen/signin_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb)
    {
      await Firebase.initializeApp(
        options: const FirebaseOptions(apiKey:"AIzaSyD7ZeV4n9AWP_t4gqg6dywJ-wuMoRz4dxE", appId:"1:15783768999:web:c639397ea1c66c9f11bc82",
            messagingSenderId: "15783768999", projectId:  "instagram-clone-3d988",
        storageBucket:"instagram-clone-3d988.appspot.com", )
      );

    }

  else{
    await Firebase.initializeApp();
  }



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: const loginScreen(),
      // const Responsive(mobileScreenlayout: mobileScreen(),webScreenlayout: webScreen(),),
    );
  }
}


