import 'package:flutter/material.dart';
import 'block_success.dart';

class SpamPage extends StatefulWidget {
  const SpamPage({Key? key}) : super(key: key);

  @override
  _SpamPageState createState() => _SpamPageState();
}

class _SpamPageState extends State<SpamPage> {
  void blockSpam() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Block Spam Message & Number'),
          content: const Text(
              'Are you sure you want to block this number and message then report it as spam?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BlockSuccessPage(),
                  ),
                );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Spam Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 38, 38, 38),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 254, 254),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 50, 50, 50),
                  radius: 20,
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '09XXXXXXXXX',
                  style: TextStyle(color: Colors.orange, fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 10, 16, 16),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                  'Complete message detail: Sample text, "Hello! Welcome to D-SpamPH. Click the link http://localhost:53467/#spam to see spam details.'),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 214, 214, 214),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'OPTIONS',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                // const SizedBox(height: 20),
                Divider(
                  // Add a divider here
                  color: Color.fromARGB(255, 203, 203, 203),
                  thickness: 2,
                  height: 1,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: blockSpam,
                        child: const Text('Block Spam Message & Number',
                            style: TextStyle(
                                color: Color.fromARGB(255, 223, 100, 38))),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(36),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
