import 'package:flutter/material.dart';

class SpamPage extends StatefulWidget {
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
          title: Text('Block Spam'),
          content: Text(
              'Are you sure you want to block this message and report it as spam?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Implement your logic for blocking spam and reporting
                // Also navigate to the report details page (number 9 page)
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
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
          title: Text('Block Number'),
          content: Text(
              'Are you sure you want to block this number and report it as spam?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Implement your logic for blocking number and reporting
                // Also navigate to the report details page (number 9 page)
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
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
        title: Text('Spam Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Phone Number',
            style: TextStyle(color: Colors.orange, fontSize: 20),
          ),
          CircleAvatar(
            child: Icon(Icons.account_circle),
            radius: 40,
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16),
            child: Text('Complete message detail'),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Column(
              children: [
                Text(
                  'OPTIONS',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: blockSpam,
                  child: Text('Block Spam'),
                ),
                TextButton(
                  onPressed: blockNumber,
                  child: Text('Block Number'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
