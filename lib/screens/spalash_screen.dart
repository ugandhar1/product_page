import 'package:flutter/material.dart';
import 'package:flutter1/screens/login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed( Duration(seconds: 3),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login_Page(),), (route) => false);
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child:Text("Welcome to HomePage")),
    );
  }
}