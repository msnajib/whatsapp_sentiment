import 'dart:math' as math; // import this

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_sentiment/src/constants/colors.dart';
import 'package:whatsapp_sentiment/src/widgets/custom_shape.dart';

class BubbleChatReply extends StatelessWidget {
  final bool tail;
  final bool replay;
  final String message;
  final DateTime sendAt;
  final Color? bgColor;

  final String? msgReply;

  const BubbleChatReply({
    Key? key,
    bool? tail,
    bool? replay,
    required this.message,
    required this.sendAt,
    this.bgColor,
    this.msgReply,
  })  : tail = tail ?? false,
        replay = replay ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tail == true
            ? Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: CustomPaint(
                  painter: CustomShape(bgColor ?? Colors.black),
                ),
              )
            : const SizedBox(),
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: replay == true ? 4.0 : 10.0,
              vertical: replay == true ? 4.0 : 8.0,
            ),
            decoration: BoxDecoration(
              color: bgColor ?? Colors.black,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                replay == true
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 10.0,
                          ),
                          margin: const EdgeInsets.only(bottom: 4.0),
                          decoration: const BoxDecoration(
                            color: Colors.black38,
                            border: Border(
                              left: BorderSide(
                                color: AppColor.yellow,
                                width: 4.0,
                              ),
                            ),
                            // borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'You',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.yellow,
                                ),
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                msgReply ?? 'Message replyed',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
                Wrap(
                  alignment: WrapAlignment.end,
                  runAlignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  spacing: 6.0,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: replay == true ? 6.0 : 0.0,
                        vertical: replay == true ? 4.0 : 0.0,
                      ),
                      child: Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        DateFormat.jm().format(sendAt).toString().toLowerCase(),
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.white30,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));

    return Container(
      padding: const EdgeInsets.only(
        left: 14.0,
        right: 68.0,
        top: 1.0,
        bottom: 1.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          messageTextGroup,
        ],
      ),
    );
  }
}
