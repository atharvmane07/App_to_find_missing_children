import 'package:flutter/material.dart';
import 'package:misschild/choose_option_screen.dart';

import 'package:misschild/home_screen.dart';


import 'package:misschild/login_screen.dart'; // Import your LoginScreen class
import 'package:misschild/signup_screen.dart'; // Import your SignupScreen class


import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import your LoginScreen class

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
    },
  ));
}