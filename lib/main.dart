import 'package:booking_app/home/home_screen.dart';
import 'package:booking_app/screens/auth/login_screen.dart';
import 'package:booking_app/screens/auth/register_screen.dart';
import 'package:booking_app/screens/auth/register_succes_screen.dart';
import 'package:booking_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const SplashScreen(),
  ));
}
