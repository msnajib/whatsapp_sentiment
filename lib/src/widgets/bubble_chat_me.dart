import 'package:flutter/material.dart';
import 'package:whatsapp_sentiment/src/constants/colors.dart';
import 'package:whatsapp_sentiment/src/widgets/custom_shape.dart';

class BubbleChatMe extends StatelessWidget {
  final String message;
  final bool tail;
  final bool replay;
  const BubbleChatMe({
    Key? key,
    bool? tail,
    bool? replay,
    required this.message,
  })  : tail = tail ?? false,
        replay = replay ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 8.0,
            ),
            decoration: const BoxDecoration(
              color: AppColor.green2,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
                            color: AppColor.green3,
                            border: Border(
                              left: BorderSide(
                                color: AppColor.yellow,
                                width: 4.0,
                              ),
                            ),
                            // borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Wrap(
                            spacing: 2.0,
                            direction: Axis.vertical,
                            children: const [
                              Text(
                                'Jonathan Edward',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.yellow,
                                ),
                              ),
                              Text(
                                'so yes I think we can start working on it',
                                style: TextStyle(
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
                    Text(
                      message,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Wrap(
                        spacing: 2.0,
                        children: const [
                          Text(
                            '9:57 am',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white30,
                            ),
                          ),
                          Icon(
                            Icons.done_all_rounded,
                            color: AppColor.blue,
                            size: 14.0,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        tail == true
            ? CustomPaint(painter: CustomShape(AppColor.green2))
            : const SizedBox(),
      ],
    ));

    return Container(
      padding: const EdgeInsets.only(
        right: 14.0,
        left: 68.0,
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
