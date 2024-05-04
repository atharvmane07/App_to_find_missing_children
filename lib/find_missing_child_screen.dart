// import 'package:flutter/material.dart';

// class FindMissingChildScreen extends StatelessWidget {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController parentsNameController = TextEditingController();
//   final TextEditingController contactController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController lastSeenController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Find Missing Child'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text(
//                 'Find Missing Child',
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
//                   // Add logic to handle finding the child
//                 },
//                 child: Text('Find Child'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences package

// class FindMissingChildScreen extends StatelessWidget {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController lastSeenController = TextEditingController();

//   Future<void> _findChild(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     // Retrieve locally stored data
//     String storedName = prefs.getString('missingChildName') ?? '';
//     String storedLastSeen = prefs.getString('missingChildLastSeen') ?? '';

//     // Get input criteria from text controllers
//     String inputName = nameController.text;
//     String inputLastSeen = lastSeenController.text;

//     // Compare input criteria with stored data
//     if (inputName == storedName && inputLastSeen == storedLastSeen) {
//       // Child found, show result
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Child Found'),
//             content: Text('The missing child has been found.'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Close the dialog
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     } else {
//       // Child not found, show message
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Child Not Found'),
//             content: Text('No matching child found based on the entered criteria.'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Close the dialog
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Find Missing Child'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text(
//                 'Find Missing Child',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Child Name'),
//               ),
//               TextFormField(
//                 controller: lastSeenController,
//                 decoration: InputDecoration(labelText: 'Last Seen Location'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => _findChild(context),
//                 child: Text('Find Child'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences package

class FindMissingChildScreen extends StatelessWidget {
  final TextEditingController childNameController = TextEditingController();
  final TextEditingController parentNameController = TextEditingController();
  final TextEditingController lastSeenController = TextEditingController();

  Future<void> _findChild(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve locally stored data
    String storedName = prefs.getString('missingChildName') ?? '';
    String storedParentName = prefs.getString('missingChildParentName') ?? '';
    String storedContact = prefs.getString('missingChildContact') ?? ''; // Retrieve contact number
    String storedLastSeen = prefs.getString('lastSeenLocation') ?? '';

    // Get input criteria from text controllers
    String inputName = childNameController.text;
    String inputParentName = parentNameController.text;

    // Compare input criteria with stored data
    if (inputName == storedName && inputParentName == storedParentName) {
      // Child found, show result
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Child Found'),
            content: Text('The child was found at $storedLastSeen. Contact: $storedContact'), // Display stored contact number in alert
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
    } else {
      // Child not found, show message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Child Not Found'),
            content: Text('No matching child found based on the entered criteria.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Missing Child'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Find Missing Child',
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _findChild(context),
                child: Text('Find Child'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
