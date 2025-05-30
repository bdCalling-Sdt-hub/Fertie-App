import 'package:fertie_application/views/screen/home/inbox/widgets/typing_dot_state.dart';
import 'package:flutter/material.dart';

class TypingDot extends StatefulWidget {
  final int delay;
  const TypingDot({super.key, this.delay = 0});

  @override
  State<TypingDot> createState() => TypingDotState();
}