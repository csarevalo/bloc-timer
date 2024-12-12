import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: onPressed,
      icon: const Icon(Icons.refresh), //replay
    );
  }
}
