import 'package:flutter/material.dart';
import 'package:whatsapp_sentiment/src/constants/colors.dart';
import 'package:whatsapp_sentiment/src/widgets/bubble_chat_me.dart';
import 'package:whatsapp_sentiment/src/widgets/bubble_chat_reply.dart';

import 'chats.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  // refrence JSON https://community.rstudio.com/t/how-to-read-telegram-chat-json/92017
  const SampleItemDetailsView({
    super.key,
    this.chats = const [
      Chats(
        name: "Grace",
        type: "personal_chat",
        id: 2730825451,
        messages: [
          Message(
            id: 1980499,
            type: "massage",
            date: "2020-01-01T00:00:02",
            from: "Henry",
            fromId: 4325636679,
            text: "It's 2020...",
          ),
          Message(
            id: 1980499,
            type: "massage",
            date: "2020-01-01T00:00:02",
            from: "Henry",
            fromId: 4325636679,
            text: "It's 2020...",
          ),
          Message(
            id: 1980499,
            type: "massage",
            date: "2020-01-01T00:00:02",
            from: "Henry",
            fromId: 4325636679,
            text: "It's 2020...",
          ),
        ],
      ),
    ],
  });

  static const routeName = '/sample_item';

  final List<Chats> chats;

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
              height: 1.0,
            ),
            backgroundColor: AppColor.black,
          ),
          // body: Wrap(
          //   children: [
          //     Column(
          //       children: const [
          //         BubbleChatMe(
          //           tail: true,
          //           message: 'Bro, lagi dimana?',
          //         ),
          //         BubbleChatMe(
          //           message: 'Lagi butuh bantuan, nih!',
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: const [
          //         BubbleChatReply(
          //           tail: true,
          //           message: 'lagi di tempat kerja, cuy\nbantuan apa ya?',
          //         ),
          //       ],
          //     ),
          //   ]
          //       .map((e) => Padding(
          //             child: e,
          //             padding: const EdgeInsets.symmetric(
          //               vertical: 4.0,
          //             ),
          //           ))
          //       .toList(),
          // ),
          body: ListView.builder(
            restorationId: 'sampleItemListView',
            itemCount: chats[0].messages.length,
            itemBuilder: (BuildContext context, int index) {
              final item = chats[0].messages[index];

              return BubbleChatMe(
                tail: true,
                message: item.text,
              );
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
