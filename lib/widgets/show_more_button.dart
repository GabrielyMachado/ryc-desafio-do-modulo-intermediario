import 'package:flutter/material.dart';

class ShowMoreButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool loading;
  const ShowMoreButton(this.onPressed, this.loading, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Center(
        child: loading
            ? const CircularProgressIndicator()
            : const Text(
                'Mostrar mais',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
      ),
    );
  }
}
