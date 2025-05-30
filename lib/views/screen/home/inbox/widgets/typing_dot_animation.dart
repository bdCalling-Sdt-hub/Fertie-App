import 'package:fertie_application/views/screen/home/inbox/widgets/typing_dot.dart';
import 'package:flutter/material.dart';

class TypingDotAnimation extends StatelessWidget {
  const TypingDotAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          TypingDot(),
          SizedBox(width: 6),
          TypingDot(delay: 200),
          SizedBox(width: 6),
          TypingDot(delay: 400),
        ],
      ),
    );
  }
}