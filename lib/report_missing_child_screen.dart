import 'package:flutter/material.dart';

class ReportMissingChildScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController parentsNameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController lastSeenController = TextEditingController();

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
                controller: nameController,
                decoration: InputDecoration(labelText: 'Child Name'),
              ),
              TextFormField(
                controller: parentsNameController,
                decoration: InputDecoration(labelText: "Parent's Name"),
              ),
              TextFormField(
                controller: contactController,
                decoration: InputDecoration(labelText: 'Contact Information'),
              ),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: lastSeenController,
                decoration: InputDecoration(labelText: 'Last Seen Location'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logic to handle submitting report
                },
                child: Text('Submit Report'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
