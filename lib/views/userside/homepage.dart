import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // initialization - for function phase
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // insert drawer - for function phase
          },
        ),
        title: Text(
          'SMS SPAMS HISTORY',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with your actual number of SMS messages
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.message),
            ),
            title: Text('Phone Number'),
            subtitle: Text('Message Overview'),
            onTap: () {
              // Implement your logic to navigate to message details page
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          onPressed: () {
            // Implement your logic for reporting spam
          },
          icon: Icon(Icons.report),
          label: Text('REPORT SPAMS'),
        ),
      ),
    );
  }
}
