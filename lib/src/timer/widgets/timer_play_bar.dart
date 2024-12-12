import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer_bloc.dart';
import 'play_pause_button.dart';
import 'reset_button.dart';

class TimerPlayBar extends StatelessWidget {
  const TimerPlayBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerBloc = context.read<TimerBloc>();
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
      builder: (context, state) {
        switch (state) {
          case TimerInitial():
            return PlayPauseButton(
              onPressed: () {
                return context
                    .read<TimerBloc>()
                    .add(TimerStarted(duration: state.duration));
              },
              icon: Icons.play_arrow,
            );
          case TimerRunInProgress():
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResetButton(
                  onPressed: () => timerBloc.add(const TimerReset()),
                ),
                PlayPauseButton(
                  onPressed: () => timerBloc.add(const TimerPaused()),
                  icon: Icons.pause,
                ),
              ],
            );
          case TimerRunPause():
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResetButton(
                  onPressed: () => timerBloc.add(const TimerReset()),
                ),
                PlayPauseButton(
                  onPressed: () => timerBloc.add(const TimerResumed()),
                  icon: Icons.play_arrow,
                ),
              ],
            );
          default:
            // state is TimerRunCompleted
            return ResetButton(
              onPressed: () => timerBloc.add(const TimerReset()),
            );
        }
        // if (state is TimerInitial) {
        // } else if (state is TimerRunInProgress) {
        // } else if (state is TimerRunPause) {
        // } else {}
      },
    );
  }
}
//This builder also works

// builder: (context, state) {
//         if (state is TimerInitial) {
//           return PlayPauseButton(
//             onPressed: () {
//               return context
//                   .read<TimerBloc>()
//                   .add(TimerStarted(duration: state.duration));
//             },
//             icon: Icons.play_arrow,
//           );
//         } else if (state is TimerRunInProgress) {
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ResetButton(
//                 onPressed: () => timerBloc.add(const TimerReset()),
//               ),
//               PlayPauseButton(
//                 onPressed: () => timerBloc.add(const TimerPaused()),
//                 icon: Icons.pause,
//               ),
//             ],
//           );
//         } else if (state is TimerRunPause) {
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ResetButton(
//                 onPressed: () => timerBloc.add(const TimerReset()),
//               ),
//               PlayPauseButton(
//                 onPressed: () => timerBloc.add(const TimerResumed()),
//                 icon: Icons.play_arrow,
//               ),
//             ],
//           );
//         } else {
//           // state is TimerRunCompleted
//           return ResetButton(
//             onPressed: () => timerBloc.add(const TimerReset()),
//           );
//         }
//       },
