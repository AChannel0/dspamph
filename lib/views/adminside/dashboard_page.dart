// initial screen - function phase to fetch data

import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Analytics Container 1',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 200,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Analytics Container 2',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 200,
              color: Colors.orange,
              child: Center(
                child: Text(
                  'Analytics Container 3',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
