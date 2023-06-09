import 'package:flutter/material.dart';

class SpamPage extends StatefulWidget {
  const SpamPage({super.key});

  @override
  _SpamPageState createState() => _SpamPageState();
}

class _SpamPageState extends State<SpamPage> {
  @override
  void initState() {
    super.initState();
    // Add any initialization code here
  }

  void blockSpam() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Block Spam'),
          content: const Text(
              'Are you sure you want to block this message and report it as spam?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Implement your logic for blocking spam and reporting
                // Also navigate to the report details page (number 9 page)
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void blockNumber() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Block Number'),
          content: const Text(
              'Are you sure you want to block this number and report it as spam?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Implement your logic for blocking number and reporting
                // Also navigate to the report details page (number 9 page)
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
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
        title: const Text('Spam Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Phone Number',
            style: TextStyle(color: Colors.orange, fontSize: 20),
          ),
          const CircleAvatar(
            radius: 40,
            child: Icon(Icons.account_circle),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text('Complete message detail'),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Column(
              children: [
                const Text(
                  'OPTIONS',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: blockSpam,
                  child: const Text('Block Spam'),
                ),
                TextButton(
                  onPressed: blockNumber,
                  child: const Text('Block Number'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
