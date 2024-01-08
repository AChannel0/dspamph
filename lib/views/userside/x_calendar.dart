// calendar.dart

import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final Map<String, int> spamMessageCountByDate;
  final List<SmsMessage> spamMessages;

  CalendarPage({
    required this.selectedDate,
    required this.onDateSelected,
    required this.spamMessageCountByDate,
    required this.spamMessages,
  });

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime selectedDate;
  late Map<String, int> spamMessageCountByDate;
  late List<SmsMessage> spamMessages;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
    spamMessageCountByDate = widget.spamMessageCountByDate;
    spamMessages = widget.spamMessages;
  }

  @override
  Widget build(BuildContext context) {
    final selectedDateKey = selectedDate.toString().split(' ')[0];
    final spamCount = spamMessageCountByDate[selectedDateKey] ?? 0;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
          ),
          child: TableCalendar(
            calendarFormat: CalendarFormat.month,
            focusedDay: selectedDate,
            firstDay: DateTime(2019),
            lastDay: DateTime(2029),
            selectedDayPredicate: (day) => isSameDay(selectedDate, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                selectedDate = selectedDay;
              });
              widget.onDateSelected(selectedDay);
            },
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, date, _) {
                final isToday = isSameDay(DateTime.now(), date);
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isToday
                        ? Colors.orange.shade300
                        : Colors.orange.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: isToday ? Colors.white : Colors.black,
                    ),
                  ),
                );
              },
              selectedBuilder: (context, date, _) => Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RichText(
              text: TextSpan(
                text: 'Spam count by selected date: ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '$spamCount',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ),
          margin: EdgeInsets.zero,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: spamMessages.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(spamMessages[index].address ?? 'Unknown Sender'),
                subtitle: Text(
                  spamMessages[index].body ?? 'No message body',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
