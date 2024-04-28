import 'package:flutter/foundation.dart';

class ChatProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _chatList = [
    {
      'chatId': 1,
      'tableName': 'Table 5',
      'clubName': 'NoHo’s Club',
      'chatImage': 'assets/images/restaurant.jpg',
      'time': '10:00 AM',
      'muted': false,
      'messages': [
        {
          'messageId': 1,
          'message': 'Hello, how are you?',
          'time': '10:00 AM',
          'senderName': 'James A.',
        },
        {
          'messageId': 2,
          'message': 'I am fine, thank you.',
          'time': '10:00 AM',
          'senderName': 'John Doe',
        },
        {
          'messageId': 3,
          'message': 'How can I help you?',
          'time': '10:00 AM',
          'senderName': 'James A.',
        },
      ],
    },
    {
      'chatId': 2,
      'tableName': 'Table 6',
      'clubName': 'LAVO',
      'chatImage': 'assets/images/restaurant.jpg',
      'time': '10:00 AM',
      'muted': false,
      'messages': [
        {
          'messageId': 1,
          'message': 'Hello, how are you?',
          'time': '10:00 AM',
          'senderName': 'James A.',
        },
        {
          'messageId': 2,
          'message': 'I am fine, thank you.',
          'time': '10:00 AM',
          'senderName': 'John Doe',
        },
        {
          'messageId': 3,
          'message': 'How can I help you?',
          'time': '10:00 AM',
          'senderName': 'James A.',
        },
      ],
    },
    {
      'chatId': 3,
      'tableName': 'Table 7',
      'clubName': 'LAVO',
      'chatImage': 'assets/images/restaurant.jpg',
      'time': '10:00 AM',
      'muted': false,
      'messages': [
        {
          'messageId': 1,
          'message': 'Hello, how are you?',
          'time': '10:00 AM',
          'senderName': 'James A.',
        },
        {
          'messageId': 2,
          'message': 'I am fine, thank you.',
          'time': '10:00 AM',
          'senderName': 'John Doe',
        },
        {
          'messageId': 3,
          'message': 'How can I help you?',
          'time': '10:00 AM',
          'senderName': 'James A.',
        },
      ],
    },
    {
      'chatId': 4,
      'tableName': 'Table 8',
      'clubName': 'LAVO',
      'chatImage': 'assets/images/restaurant.jpg',
      'time': '10:00 AM',
      'muted': false,
      'messages': [
        {
          'messageId': 1,
          'message': 'Hello, how are you?',
          'time': '10:00 AM',
          'senderName': 'James A.',
        },
        {
          'messageId': 2,
          'message': 'I am fine, thank you.',
          'time': '10:00 AM',
          'senderName': 'John Doe',
        },
        {
          'messageId': 3,
          'message': 'How can I help you?',
          'time': '10:00 AM',
          'senderName': 'James A.',
        },
      ],
    },
  ];

  List<Map<String, dynamic>> get chatList => _chatList;

  void removeChat(int index) {
    _chatList.removeAt(index);
    notifyListeners();
  }

  void muteChat(int index) {
    _chatList[index]['muted'] = true;
    notifyListeners();
  }
}
