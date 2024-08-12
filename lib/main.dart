import 'package:flutter/material.dart';
import 'package:flutter1/screens/login.dart';
import 'package:flutter1/screens/product_list.dart';
import 'package:flutter1/screens/sign_up.dart';
import 'package:flutter1/screens/spalash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SplashScreen(),
      routes:{
        '/cart':(context) => ProductListScreen(),
        '/dashboard':(context)=>ProductListScreen(),
        '/signup':(context) => Singn_Up(),
        '/logout':(context) => Login_Page(),
      },
      debugShowCheckedModeBanner:false,
  
    );
  }
}


