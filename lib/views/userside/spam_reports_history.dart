// spam_reports_history.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class SpamReportsHistoryPage extends StatefulWidget {
  final List<String> uploadedSpamData;
  final List<String> uploadedTime;
  final List<String> uploadedSender;

  const SpamReportsHistoryPage({
    Key? key,
    required this.uploadedSpamData,
    required this.uploadedTime,
    required this.uploadedSender,
  }) : super(key: key);

  @override
  _SpamReportsHistoryPageState createState() => _SpamReportsHistoryPageState();
}

class _SpamReportsHistoryPageState extends State<SpamReportsHistoryPage> {
  late StreamController<List<String>> _dataStreamController;

  @override
  void initState() {
    super.initState();
    _dataStreamController = StreamController<List<String>>();
    _initializeDataFetching();
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  void _initializeDataFetching() async {
    while (!_dataStreamController.isClosed) {
      // Simulate an asynchronous operation (replace this with your actual data fetching logic)
      await Future.delayed(const Duration(seconds: 5));

      if (!_dataStreamController.isClosed) {
        // Add the latest data to the stream
        _dataStreamController.add(widget.uploadedSpamData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spam Reports History'),
      ),
      body: Column(
        children: [
          // Display the total count in a rounded container
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300], // Lighter grey
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            width: double.infinity, // Full width
            child: Column(
              children: [
                Text(
                  'Total Count:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '${widget.uploadedSpamData.length}',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<String>>(
              stream: _dataStreamController.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error loading data: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No spam reports to show.'),
                  );
                } else {
                  return _buildSpamReportsList(snapshot.data!);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpamReportsList(List<String> data) {
    // Continue with your list-building logic here
    // Group spam reports by date
    Map<String, List<int>> dateIndices = {};
    for (int i = 0; i < widget.uploadedTime.length; i++) {
      final timestamp = DateTime.parse(widget.uploadedTime[i]);
      final dateKey = DateFormat('MMMM d, y').format(timestamp);
      dateIndices.putIfAbsent(dateKey, () => []);
      dateIndices[dateKey]!.add(i);
    }

    // Create a list of date keys
    List<String> dateKeys = dateIndices.keys.toList();

    return ListView.builder(
      itemCount: dateKeys.length,
      itemBuilder: (context, dateIndex) {
        final dateKey = dateKeys[dateIndex];
        final dateSpamIndices = dateIndices[dateKey]!;

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 3,
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date Reported: $dateKey',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dateSpamIndices.length,
                  itemBuilder: (context, index) {
                    final spamData =
                        widget.uploadedSpamData[dateSpamIndices[index]];
                    final sender =
                        widget.uploadedSender[dateSpamIndices[index]];
                    final timestamp = DateTime.parse(
                        widget.uploadedTime[dateSpamIndices[index]]);
                    final formattedDateTime =
                        DateFormat('MMMM d, y').add_jms().format(timestamp);

                    return ListTile(
                      title: Text('Sender: $sender'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date and Time Reported: $formattedDateTime',
                          ),
                          Text('Spam Content: $spamData'),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
