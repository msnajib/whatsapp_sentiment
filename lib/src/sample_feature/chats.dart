class Chats {
  const Chats({
    required this.name,
    required this.type,
    required this.id,
    required this.messages,
  });

  final String name;
  final String type;
  final int id;
  final List<Message> messages;
}

class Message {
  const Message({
    required this.id,
    required this.type,
    required this.date,
    required this.from,
    required this.fromId,
    required this.text,
  });

  final int id;
  final String type;
  final String date;
  final String from;
  final int fromId;
  final String text;
}
