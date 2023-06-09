import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'report_spams.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // initialization - for function phase
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            );
          },
        ),
        title: const Text(
          'SMS SPAMS HISTORY',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Builder(
        builder: (BuildContext context) {
          return AppDrawer(context);
        },
      ),
      body: ListView.builder(
        itemCount: 20, // Replace with your actual number of SMS messages
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.message),
            ),
            title: const Text('Phone Number'),
            subtitle: const Text('Message Overview'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessageDetailsPage(),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ReportSpams(totalSpamMessages: 10),
              ),
            );
          },
          icon: const Icon(Icons.report),
          label: const Text('REPORT SPAMS'),
        ),
      ),
    );
  }
}

class MessageDetailsPage extends StatelessWidget {
  const MessageDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement your message details page here
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message Details'),
      ),
      body: const Center(
        child: Text('Message Details Page'),
      ),
    );
  }
}
