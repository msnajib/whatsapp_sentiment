import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:whatsapp_sentiment/src/constants/colors.dart';
import 'package:whatsapp_sentiment/src/utils/date.dart';
import 'package:whatsapp_sentiment/src/widgets/bubble_chat_me.dart';
import 'package:whatsapp_sentiment/src/widgets/bubble_chat_reply.dart';

import 'chats.dart';

class SampleItemDetailsView extends StatefulWidget {
  const SampleItemDetailsView({super.key});
  static const routeName = '/sample_item';

  @override
  State<SampleItemDetailsView> createState() => _SampleItemDetailsViewState();
}

/// Displays detailed information about a SampleItem.
class _SampleItemDetailsViewState extends State<SampleItemDetailsView> {
  // refrence JSON https://community.rstudio.com/t/how-to-read-telegram-chat-json/92017

  late List<Chats> chats = [
    Chats(
      name: "Grace",
      type: "personal_chat",
      id: 2730825451,
      messages: messages,
    ),
  ];
  late List<Messages> messages = [
    Messages(
      id: 1980499,
      type: "massage",
      date: DateTime.parse("2023-01-01T00:00:02"),
      from: "Henry",
      fromId: 4325636679,
      text: "Pesan 1",
      prevMessage: null,
      nextMessage: Messages(
        id: 1980500,
        type: "massage",
        date: DateTime.parse("2023-01-01T00:22:04"),
        from: "Henry",
        fromId: 4325636679,
        text: "Pesan 2",
      ),
    ),
    Messages(
      id: 1980500,
      type: "massage",
      date: DateTime.parse("2023-01-01T00:22:04"),
      from: "Henry",
      fromId: 4325636679,
      text: "Pesan 2",
      prevMessage: Messages(
        id: 1980499,
        type: "massage",
        date: DateTime.parse("2023-01-01T00:00:02"),
        from: "Henry",
        fromId: 4325636679,
        text: "Pesan 1",
      ),
      nextMessage: null,
    ),
    Messages(
      id: 1980501,
      type: "massage",
      date: DateTime.parse("2023-01-01T00:00:05"),
      from: "Grace",
      fromId: 4720225552,
      text: "Pesan Reply 1",
      prevMessage: null,
      nextMessage: Messages(
        id: 1984501,
        type: "massage",
        date: DateTime.parse("2023-01-01T00:00:05"),
        from: "Grace",
        fromId: 4720225552,
        text: "Pesan Reply 2",
      ),
    ),
    Messages(
      id: 1984501,
      type: "massage",
      date: DateTime.parse("2023-01-01T00:00:05"),
      from: "Grace",
      fromId: 4720225552,
      text: "Pesan Reply 2",
      prevMessage: Messages(
        id: 1980501,
        type: "massage",
        date: DateTime.parse("2023-01-01T00:00:05"),
        from: "Grace",
        fromId: 4720225552,
        text: "Pesan Reply 1",
      ),
      nextMessage: Messages(
        id: 1954501,
        type: "massage",
        date: DateTime.parse("2023-01-07T00:00:05"),
        from: "Grace",
        fromId: 4720225552,
        text: "Pesan Reply 3",
      ),
    ),
    Messages(
      id: 1954501,
      type: "massage",
      date: DateTime.parse("2023-01-07T00:00:05"),
      from: "Grace",
      fromId: 4720225552,
      text: "Pesan Reply 3",
      prevMessage: Messages(
        id: 1984501,
        type: "massage",
        date: DateTime.parse("2023-01-01T00:00:05"),
        from: "Grace",
        fromId: 4720225552,
        text: "Pesan Reply 2",
      ),
      nextMessage: null,
    ),
  ];

  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/bg_chat.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Wrap(
              spacing: 8.0,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.amber,
                  backgroundImage: AssetImage('assets/images/3d_avatar_12.png'),
                  radius: 36.0 / 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Jonathan Edward'),
                    Text(
                      'online',
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => print('action'),
                icon: const Icon(Icons.videocam_rounded),
              ),
              IconButton(
                onPressed: () => print('action'),
                icon: const Icon(Icons.call_rounded),
              ),
              IconButton(
                onPressed: () => print('action'),
                icon: const Icon(Icons.more_vert_rounded),
              ),
            ],
            iconTheme: const IconThemeData(
              color: Colors.white,
              size: 24.0,
            ),
            elevation: 0.0,
            leadingWidth: 24.0,
            titleTextStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.0,
            ),
            backgroundColor: AppColor.black,
          ),
          body: GroupedListView<Messages, DateTime>(
            controller: _scrollController,
            elements: messages,
            order: GroupedListOrder.DESC,
            reverse: true,
            floatingHeader: true,
            useStickyGroupSeparators: true,
            groupBy: (Messages item) => DateTime(
              item.date.year,
              item.date.month,
              item.date.day,
            ),
            groupHeaderBuilder: (group) {
              return Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8.0,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: const BoxDecoration(
                      color: AppColor.black,
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: Text(
                      date(group.date).toString(),
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                ],
              );
            },
            itemBuilder: (_, Messages item) {
              if (item.from == chats[0].name) {
                return BubbleChatReply(
                  tail: item.prevMessage == null ||
                      item.date.day != item.prevMessage?.date.day ||
                      item.date.hour != item.prevMessage?.date.hour,
                  message: item.text,
                  sendAt: item.date,
                );
              } else {
                return BubbleChatMe(
                  tail: item.prevMessage == null ||
                      item.date.day != item.prevMessage?.date.day ||
                      item.date.hour != item.prevMessage?.date.hour,
                  message: item.text,
                  sendAt: item.date,
                );
              }
            },
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(4.0),
            color: Colors.transparent,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.black,
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.emoji_emotions_rounded,
                              color: AppColor.grey,
                            ),
                            onPressed: () {}),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Type Something...",
                              hintStyle: TextStyle(
                                color: AppColor.grey,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: 155.0,
                          child: const IconButton(
                            icon: Icon(
                              Icons.attachment_rounded,
                              color: AppColor.grey,
                            ),
                            onPressed: null,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.camera_alt_rounded,
                            color: AppColor.grey,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 4.0),
                Container(
                  padding: const EdgeInsets.all(11.5),
                  decoration: const BoxDecoration(
                    color: AppColor.green1,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    child: const Icon(
                      Icons.keyboard_voice,
                      color: Colors.white,
                    ),
                    onLongPress: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
