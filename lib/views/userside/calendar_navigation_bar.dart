// calendar_navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarNavigationBar extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final Map<String, int> spamMessageCountByDate;
  final List<SmsMessage> spamMessages;

  CalendarNavigationBar({
    required this.selectedDate,
    required this.onDateSelected,
    required this.spamMessageCountByDate,
    required this.spamMessages,
  });

  @override
  _CalendarNavigationBarState createState() => _CalendarNavigationBarState();
}

class _CalendarNavigationBarState extends State<CalendarNavigationBar> {
  bool isDateSelected = false;

  @override
  Widget build(BuildContext context) {
    final selectedDateKey = widget.selectedDate.toString().split(' ')[0];

    // Filter spam messages with the prefix "+639"
    final filteredSpamMessages = widget.spamMessages
        .where((message) =>
            message.address != null && message.address!.startsWith("+639"))
        .toList();

    // Get spam messages for the selected date
    final spamMessagesForSelectedDate = widget.spamMessages
        .where((message) =>
            message.address != null &&
            message.address!.startsWith("+639") &&
            isSameDay(widget.selectedDate, message.date))
        .toList();

    // Calculate spam count for the filtered messages
    final spamCount = isDateSelected
        ? widget.spamMessageCountByDate[selectedDateKey] ?? 0
        : filteredSpamMessages.length;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
          ),
          child: TableCalendar(
            calendarFormat: CalendarFormat.month,
            focusedDay: widget.selectedDate,
            firstDay: DateTime(2019),
            lastDay: DateTime(2029),
            selectedDayPredicate: (day) => isSameDay(widget.selectedDate, day),
            onDaySelected: (selectedDay, focusedDay) {
              if (selectedDay != null) {
                widget.onDateSelected(selectedDay);
                // Set the flag to true when a date is selected
                setState(() {
                  isDateSelected = true;
                });
              } else {
                // Reset the flag to false when no date is selected
                setState(() {
                  isDateSelected = false;
                });
              }
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
                text: isDateSelected
                    ? 'Spam count by selected date: '
                    : 'Total spam count history: ',
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
            itemCount: isDateSelected
                ? spamMessagesForSelectedDate.length
                : filteredSpamMessages.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(isDateSelected
                    ? spamMessagesForSelectedDate[index].address ??
                        'Unknown Sender'
                    : filteredSpamMessages[index].address ?? 'Unknown Sender'),
                subtitle: Text(
                  isDateSelected
                      ? spamMessagesForSelectedDate[index].body ??
                          'No message body'
                      : filteredSpamMessages[index].body ?? 'No message body',
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
