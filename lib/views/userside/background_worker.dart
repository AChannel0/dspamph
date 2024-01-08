// background_worker.dart

import 'dart:async';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

class BackgroundWorker {
  final StreamController<List<SmsMessage>> _filteredMessagesStreamController =
      StreamController<List<SmsMessage>>.broadcast();

  Stream<List<SmsMessage>> get filteredMessagesStream =>
      _filteredMessagesStreamController.stream;

  Future<void> filterMessagesByDate(
      List<SmsMessage> messages, DateTime selectedDate) async {
    final selectedDateKey = selectedDate.toString().split(' ')[0];

    final filteredMessages = await Future<List<SmsMessage>>(() {
      return messages.where((message) {
        final messageDate = message.date;
        final messageDateKey =
            messageDate?.toLocal().toString().split(' ')[0] ?? '';
        return messageDateKey == selectedDateKey && _isSpam(message.body ?? '');
      }).toList();
    });

    _filteredMessagesStreamController.sink.add(filteredMessages);
  }

  bool _isSpam(String message) {
    final spamKeywords = [
      "free",
      "register",
      "claim",
      "sign",
      "join",
      "jackpotcity",
      "sbet",
      "deposit",
      "bonus",
      "free money",
      "prize",
      "winning",
      "chance",
      "win",
      "https",
    ];

    for (var keyword in spamKeywords) {
      if (message.toLowerCase().contains(keyword)) {
        return true;
      }
    }
    return false;
  }

  void dispose() {
    _filteredMessagesStreamController.close();
  }
}
