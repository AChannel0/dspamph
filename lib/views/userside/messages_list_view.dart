// messages_list_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    Key? key,
    required this.messages,
    required this.onMessageTap,
    required List<SmsMessage> spamMessages,
  }) : super(key: key);

  final List<SmsMessage> messages;
  final Function(SmsMessage) onMessageTap;

  @override
  Widget build(BuildContext context) {
    Map<String, List<SmsMessage>?> groupedMessages = {};

    for (var message in messages) {
      String sender = message.address ?? 'Unknown Sender';
      if (groupedMessages.containsKey(sender)) {
        groupedMessages[sender]!.add(message);
      } else {
        groupedMessages[sender] = [message];
      }
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: groupedMessages.length,
      itemBuilder: (BuildContext context, int i) {
        String contactNumber = groupedMessages.keys.elementAt(i);
        List<SmsMessage> contactMessages = groupedMessages[contactNumber]!;

        return ListTile(
          title: Text(contactNumber),
          subtitle: Text(
            contactMessages.first.body ?? 'No message body',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () => onMessageTap(contactMessages.first),
        );
      },
    );
  }
}
