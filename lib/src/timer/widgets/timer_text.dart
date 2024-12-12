import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer_bloc.dart';

class TimerText extends StatelessWidget {
  const TimerText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, curr) => prev.duration != curr.duration,
      builder: (context, state) {
        return Text(
          state.duration.toString(),
          style: textTheme.displayLarge,
        );
      },
    );

    // final int dur = context.select<TimerBloc, int>(
    //   (bloc) => bloc.state.duration,
    // );
    // return Text(
    //   dur.toString(),
    //   style: textTheme.displayLarge,
    // );
  }
}
