// import 'package:flutter/material.dart';

// class ReportMissingChildScreen extends StatelessWidget {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController parentsNameController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController lastSeenController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Report Missing Child'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text(
//                 'Report Missing Child',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Child Name'),
//               ),
//               TextFormField(
//                 controller: parentsNameController,
//                 decoration: InputDecoration(labelText: "Parent's Name"),
//               ),
//               TextFormField(
//                 controller: contactController,
//                 decoration: InputDecoration(labelText: 'Contact Information'),
//               ),
//               TextFormField(
//                 controller: addressController,
//                 decoration: InputDecoration(labelText: 'Address'),
//               ),
//               TextFormField(
//                 controller: lastSeenController,
//                 decoration: InputDecoration(labelText: 'Last Seen Location'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Add logic to handle submitting report
//                 },
//                 child: Text('Submit Report'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ReportMissingChildScreen extends StatelessWidget {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController parentsNameController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController lastSeenController = TextEditingController();

//   Future<void> _submitReport(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('childName', nameController.text);
//     prefs.setString('parentsName', parentsNameController.text);
//     prefs.setString('contactInfo', contactController.text);
//     prefs.setString('address', addressController.text);
//     prefs.setString('lastSeenLocation', lastSeenController.text);

//     // Optionally, you can show a confirmation dialog or navigate to another screen after saving the data.
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Report Submitted'),
//           content: Text('Your report has been submitted successfully.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context); // Close the dialog
//                 // You can navigate to another screen here if needed
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Report Missing Child'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text(
//                 'Report Missing Child',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Child Name'),
//               ),
//               TextFormField(
//                 controller: parentsNameController,
//                 decoration: InputDecoration(labelText: "Parent's Name"),
//               ),
//               TextFormField(
//                 controller: contactController,
//                 decoration: InputDecoration(labelText: 'Contact Information'),
//               ),
//               TextFormField(
//                 controller: addressController,
//                 decoration: InputDecoration(labelText: 'Address'),
//               ),
//               TextFormField(
//                 controller: lastSeenController,
//                 decoration: InputDecoration(labelText: 'Last Seen Location'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => _submitReport(context),
//                 child: Text('Submit Report'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReportMissingChildScreen extends StatelessWidget {
  final TextEditingController childNameController = TextEditingController();
  final TextEditingController parentNameController = TextEditingController();
  final TextEditingController contactController = TextEditingController(); // Add contact controller
  final TextEditingController lastSeenController = TextEditingController();

  Future<void> _submitReport(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('missingChildName', childNameController.text);
    prefs.setString('missingChildParentName', parentNameController.text);
    prefs.setString('missingChildContact', contactController.text); // Store contact number
    prefs.setString('lastSeenLocation', lastSeenController.text);

    // Optionally, you can show a confirmation dialog or navigate to another screen after saving the data.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Report Submitted'),
          content: Text('Your report has been submitted successfully.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Missing Child'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Report Missing Child',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: childNameController,
                decoration: InputDecoration(labelText: 'Child Name'),
              ),
              TextFormField(
                controller: parentNameController,
                decoration: InputDecoration(labelText: "Parent's Name"),
              ),
              TextFormField(
                controller: contactController,
                decoration: InputDecoration(labelText: 'Contact Information'), // Add contact text field
              ),
              TextFormField(
                controller: lastSeenController,
                decoration: InputDecoration(labelText: 'Last Seen Location'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submitReport(context),
                child: Text('Submit Report'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
