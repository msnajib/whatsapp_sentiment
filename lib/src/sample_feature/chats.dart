class Chats {
  Chats({
    required this.name,
    required this.type,
    required this.id,
    required this.messages,
  });

  String name;
  String type;
  int id;
  List<Messages> messages;
}

class Messages {
  Messages({
    required this.id,
    required this.type,
    required this.date,
    required this.from,
    required this.fromId,
    required this.text,
    this.prevMessage,
    this.nextMessage,
    this.replyMessage,
  });

  int id;
  String type;
  DateTime date;
  String from;
  int fromId;
  String text;
  Messages? prevMessage;
  Messages? nextMessage;
  Messages? replyMessage;
}
