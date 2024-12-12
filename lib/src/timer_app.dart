import 'package:flutter/material.dart';

import 'timer/views/timer_screen.dart';

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      theme: ThemeData.dark(),
      home: const TimerScreen(),
    );
  }
}
