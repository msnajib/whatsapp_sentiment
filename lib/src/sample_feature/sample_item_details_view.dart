import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:whatsapp_sentiment/src/constants/colors.dart';
import 'package:whatsapp_sentiment/src/openai/completion_api.dart';

import 'package:whatsapp_sentiment/src/utils/date.dart';
import 'package:whatsapp_sentiment/src/widgets/bubble_chat_me.dart';
import 'package:whatsapp_sentiment/src/widgets/bubble_chat_reply.dart';
import 'package:whatsapp_sentiment/src/widgets/react_dialog.dart';

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
      name: "Putri",
      type: "personal_chat",
      id: 2730825451,
      messages: messages,
    ),
  ];
  late List<Messages> messages = [
    //Reply
    Messages(
      id: 1,
      type: "massage",
      date: DateTime.parse(DateTime.now().toIso8601String()),
      from: "Putri",
      fromId: 4325636679,
      text: "sayg",
      prevMessage: null,
      nextMessage: Messages(
        id: 1981499,
        type: "massage",
        date: DateTime.parse(DateTime.now().toIso8601String()),
        from: "Putri",
        fromId: 2,
        text: "kamu sayang ngga sih, sama aku?? 🧐",
      ),
    ),
    Messages(
      id: 2,
      type: "massage",
      date: DateTime.parse(DateTime.now().toIso8601String()),
      from: "Putri",
      fromId: 4325636679,
      text: "kamu sayang ngga sih, sama aku?? 🧐",
      prevMessage: Messages(
        id: 1,
        type: "massage",
        date: DateTime.parse(DateTime.now().toIso8601String()),
        from: "Putri",
        fromId: 4325636679,
        text: "sayg",
      ),
      nextMessage: null,
    ),
    // Me
    Messages(
      id: 3,
      type: "massage",
      date: DateTime.parse(DateTime.now().toIso8601String()),
      from: "David",
      fromId: 4325636673,
      text: "aduuuuh, kita udah pacaran dari zaman nabi Idris loh,",
      prevMessage: null,
      nextMessage: Messages(
        id: 4,
        type: "massage",
        date: DateTime.parse(DateTime.now().toIso8601String()),
        from: "David",
        fromId: 4325636673,
        text:
            "dan kamu masih saja menanyakan aku sayang apa engga? jelas sayang dooong 👺",
      ),
    ),
    Messages(
      id: 4,
      type: "massage",
      date: DateTime.parse(DateTime.now().toIso8601String()),
      from: "David",
      fromId: 4325636673,
      text:
          "dan kamu masih saja menanyakan aku sayang apa engga? jelas sayang dooong 👺",
      prevMessage: Messages(
        id: 3,
        type: "massage",
        date: DateTime.parse(DateTime.now().toIso8601String()),
        from: "David",
        fromId: 4325636673,
        text: "aduuuuh, kita udah pacaran dari zaman nabi Idris loh,",
      ),
      nextMessage: null,
    ),
    // Reply
    Messages(
      id: 5,
      type: "massage",
      date: DateTime.parse(DateTime.now().toIso8601String()),
      from: "Putri",
      fromId: 4325636679,
      text: "kok kamu balesnya cepet banget",
      prevMessage: null,
      nextMessage: Messages(
        id: 6,
        type: "massage",
        date: DateTime.parse(DateTime.now().toIso8601String()),
        from: "Putri",
        fromId: 4325636679,
        text: "lagi chattingan sama siapa?",
      ),
    ),
    Messages(
      id: 6,
      type: "massage",
      date: DateTime.parse(DateTime.now().toIso8601String()),
      from: "Putri",
      fromId: 4325636679,
      text: "lagi chattingan sama siapa?",
      prevMessage: Messages(
        id: 5,
        type: "massage",
        date: DateTime.parse(DateTime.now().toIso8601String()),
        from: "Putri",
        fromId: 4325636679,
        text: "kok kamu balesnya cepet banget",
      ),
      nextMessage: null,
    ),
    // Me
    Messages(
      id: 7,
      type: "massage",
      date: DateTime.parse(DateTime.now().toIso8601String()),
      from: "David",
      fromId: 4325636673,
      text:
          "ngga ada chattinga sama siapa, ya kamu chat aku langsung bales doooong",
      prevMessage: null,
      nextMessage: Messages(
        id: 8,
        type: "massage",
        date: DateTime.parse(DateTime.now().toIso8601String()),
        from: "David",
        fromId: 4325636673,
        text: "kan prioritas 🥰🥰",
      ),
    ),
    Messages(
      id: 8,
      type: "massage",
      date: DateTime.parse(DateTime.now().toIso8601String()),
      from: "David",
      fromId: 4325636673,
      text: "kan prioritas 🥰🥰",
      prevMessage: Messages(
        id: 7,
        type: "massage",
        date: DateTime.parse(DateTime.now().toIso8601String()),
        from: "David",
        fromId: 4325636673,
        text:
            "ngga ada chattinga sama siapa, ya kamu chat aku langsung bales doooong",
      ),
      nextMessage: null,
    ),
    // Reply
    Messages(
      id: 9,
      type: "massage",
      date: DateTime.parse(DateTime.now().toIso8601String()),
      from: "Putri",
      fromId: 4325636679,
      text: "halah, BOONG\nkamu lagi chat sama cewe lain kaaan, NGAKU! 😡🤬",
      prevMessage: null,
      nextMessage: Messages(
        id: 10,
        type: "massage",
        date: DateTime.parse(DateTime.now().toIso8601String()),
        from: "Putri",
        fromId: 4325636679,
        text: "kok make emot gini, kamu ngga sayang lagi kan sama aku 😭😡",
      ),
    ),
    Messages(
      id: 10,
      type: "massage",
      date: DateTime.parse(DateTime.now().toIso8601String()),
      from: "Putri",
      fromId: 4325636679,
      text: "kok make emot gini, kamu ngga sayang lagi kan sama aku 😭😡",
      prevMessage: Messages(
        id: 9,
        type: "massage",
        date: DateTime.parse(DateTime.now().toIso8601String()),
        from: "Putri",
        fromId: 4325636679,
        text: "halah, BOONG\nkamu lagi chat sama cewe lain kaaan, NGAKU! 😡🤬",
      ),
      nextMessage: null,
      replyMessage: Messages(
        id: 4,
        type: "massage",
        date: DateTime.parse(DateTime.now().toIso8601String()),
        from: "David",
        fromId: 4325636673,
        text:
            "dan kamu masih saja menanyakan aku sayang apa engga? jelas sayang dooong 👺",
      ),
    ),
    // Me
    Messages(
      id: 11,
      type: "massage",
      date: DateTime.parse(DateTime.now().toIso8601String()),
      from: "David",
      fromId: 4325636673,
      text: "Alluakbar, maaf sayang aku udah mati, dikuburan sinyalnya jelek.",
      prevMessage: null,
      nextMessage: null,
    ),
  ];

  late ScrollController _scrollController;
  CompletionsApi completionsApi = new CompletionsApi();

  bool _isLongPressed = false;
  int? _idMessageHighlight;

  double? _dx, _dy;

  String? senstiment = 'Loading…';

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
                    Text('Putri Cannia 💩'),
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
                onPressed: () {},
                icon: const Icon(Icons.videocam_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call_rounded),
              ),
              IconButton(
                onPressed: () {},
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
            useStickyGroupSeparators: false,
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
                return InkWell(
                  onTapDown: (details) {
                    _dx = details.globalPosition.dx;
                    _dy = details.globalPosition.dy;
                  },

                  ///
                  onLongPress: () async {
                    setState(() {
                      _isLongPressed = true;
                      _idMessageHighlight = item.id;
                    });

                    showDialog(
                      context: context,
                      barrierColor: Colors.transparent,
                      builder: (context) {
                        return ReactDialog(
                          dx: _dx!,
                          dy: _dy!,
                          message: item.text,
                        );
                      },
                    ).whenComplete(
                      () => setState(() {
                        _isLongPressed = false;
                        _idMessageHighlight = null;
                      }),
                    );
                  },
                  highlightColor: AppColor.green2.withOpacity(0.5),
                  splashColor: AppColor.green2.withOpacity(0.5),
                  child: Container(
                    color: _isLongPressed && _idMessageHighlight == item.id
                        ? AppColor.green2.withOpacity(0.5)
                        : Colors.transparent,
                    child: BubbleChatReply(
                      bgColor: _isLongPressed && _idMessageHighlight == item.id
                          ? AppColor.green4
                          : AppColor.black,
                      tail: item.prevMessage == null ||
                          item.date.day != item.prevMessage?.date.day ||
                          item.date.hour != item.prevMessage?.date.hour,
                      message: item.text,
                      sendAt: item.date,
                      replay: item.replyMessage != null,
                      msgReply: item.replyMessage != null
                          ? item.replyMessage!.text
                          : 'Message replyed',
                    ),
                  ),
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
