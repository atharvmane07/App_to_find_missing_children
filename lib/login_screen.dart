// import 'package:flutter/material.dart';
// import 'package:misschild/signup_screen.dart'; // Import the SignupScreen class
// import 'package:misschild/home_screen.dart';


// import 'package:flutter/material.dart';
// import 'package:misschild/home_screen.dart'; // Import your home screen or any other screen after successful signup

// class MyLogin extends StatelessWidget {
//   const MyLogin({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('lib/assets/login (1).png'), fit: BoxFit.cover),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(),
//             Container(
//               padding: EdgeInsets.only(left: 35, top: 130),
//               child: Text(
//                 'Welcome',
//                 style: TextStyle(color: Colors.black, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.5,
//                   left: 35,
//                   right: 35,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextField(
//                       style: TextStyle(color: Colors.black),
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: "Email",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     TextField(
//                       style: TextStyle(),
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.shade100,
//                         filled: true,
//                         hintText: "Password",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Sign in',
//                           style: TextStyle(
//                             fontSize: 27,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         CircleAvatar(
//                           radius: 30,
//                           backgroundColor: Color(0xff4c505b),
//                           child: IconButton(
//                             color: Colors.white,
//                             onPressed: () {
//                               // Add authentication logic here, then navigate to home screen
//                               Navigator.pushReplacement(
//                                context,
//                                 MaterialPageRoute(builder: (context) => HomeScreen()),
//                               );
//                             },
//                             icon: Icon(Icons.arrow_forward),
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pushNamed(context, 'register');
//                           },
//                           child: Text(
//                             'Sign Up',
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                               decoration: TextDecoration.underline,
//                               color: Color(0xff4c505b),
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             'Forgot Password',
//                             style: TextStyle(
//                               decoration: TextDecoration.underline,
//                               color: Color(0xff4c505b),
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:misschild/signup_screen.dart';
import 'package:misschild/home_screen.dart';

class MyLogin extends StatelessWidget {
  MyLogin({Key? key}) : super(key: key);

  Future<void> _authenticate(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedEmail = prefs.getString('email') ?? '';
    String storedPassword = prefs.getString('password') ?? '';

    // Get input values
    String inputEmail = emailController.text;
    String inputPassword = passwordController.text;

    if (inputEmail == storedEmail && inputPassword == storedPassword) {
      // Authentication successful, navigate to home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Authentication failed, show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Authentication Failed'),
            content: Text('Invalid email or password.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/assets/login (1).png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome',
                style: TextStyle(color: Colors.black, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,
                  left: 35,
                  right: 35,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: passwordController,
                      style: TextStyle(),
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () => _authenticate(context),
                            icon: Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyRegister()),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color(0xff4c505b),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color(0xff4c505b),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
