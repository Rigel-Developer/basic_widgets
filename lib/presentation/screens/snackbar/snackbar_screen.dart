import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Dialog'),
          content: const Text('This is a dialog'),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Close'),
            ),
            FilledButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: const [
                    Text('About Dialog'),
                  ],
                );
              },
              child: const Text('Licencias utilizadas'),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show Snackbar'),
        tooltip: 'Show Snackbar',
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Hello!'),
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.amber[900],
              action: SnackBarAction(label: "OK!", onPressed: () {}),
            ),
          );
        },
      ),
    );
  }
}
