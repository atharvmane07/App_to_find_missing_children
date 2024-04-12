import 'package:flutter/material.dart';
import 'child_details_screen.dart';
import 'package:misschild/choose_option_screen.dart';
import 'choose_option_screen.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentTime = '';
  String _currentDate = '';
  String _currentLocation = '';

  @override
  void initState() {
    super.initState();
    _getCurrentTime();
    _getCurrentDate();
    _getCurrentLocation();
  }

  Future<void> _getCurrentTime() async {
    String formattedTime = DateFormat('HH:mm:ss').format(DateTime.now());
    setState(() {
      _currentTime = formattedTime;
    });
  }

  Future<void> _getCurrentDate() async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    setState(() {
      _currentDate = formattedDate;
    });
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentLocation =
          'Lat: ${position.latitude}, Long: ${position.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'lib/assets/Screenshot 2024-04-12 at 11.25.03 AM.png',
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Find Lost Children',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Current Time: $_currentTime',
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              'Current Date: $_currentDate',
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              'Current Location: $_currentLocation',
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChooseOptionScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 18, color: Colors.lightBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

