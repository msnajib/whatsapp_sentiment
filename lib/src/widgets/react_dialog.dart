import 'package:flutter/material.dart';
import 'package:whatsapp_sentiment/src/constants/colors.dart';

class ReactDialog extends StatelessWidget {
  final double dx, dy;

  const ReactDialog({Key? key, required this.dx, required this.dy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _reactEmojis = '❤️ 😆 😭 😡 😲 👍🏼'.split(' ');
    const _fromTop = 88;
    double _width = MediaQuery.of(context).size.width;
    double _left = dx < 180
        ? dx / 3
        : _width - 100 > dx
            ? dx - 120
            : dx - 10 < _width
                ? dx - 180
                : 0;

    return Container(
      margin: EdgeInsets.only(
        top: dy > 100 ? dy - _fromTop : dy + 0,
        left: 8.0,
      ),
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: const BoxDecoration(
          color: AppColor.black,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 6.0,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 8.0,
              ),
              child: Wrap(
                spacing: 8.0,
                children: [
                  ..._reactEmojis
                      .map(
                        (e) => Material(
                          color: Colors.transparent,
                          child: Text(
                            e,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      )
                      .toList()
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 4.0,
                right: 6.0,
                top: 1.0,
                bottom: 1.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4.0,
                children: [
                  Container(
                    height: 10.0,
                    width: 10.0,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  const DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white60,
                    ),
                    child: Text('sepertinya dia sedang marah'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
