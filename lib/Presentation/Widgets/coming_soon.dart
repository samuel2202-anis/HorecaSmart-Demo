import 'package:flutter/material.dart';

class ComingSoonDialog extends StatelessWidget {
  const ComingSoonDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Coming Soon'),
      content: const Text('This feature is coming soon!'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}