import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Text('Circular Progress Indicator'),
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text('Linear Progress Indicator'),
          SizedBox(
            width: 100,
            child: LinearProgressIndicator(),
          ),
          Text('Controlled Progress Indicator linear and circular'),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (x) {
          return (x * 2) / 100;
        }).takeWhile((x) => x < 100),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0.0;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                CircularProgressIndicator(value: progressValue),
                const SizedBox(width: 20),
                Expanded(child: LinearProgressIndicator(value: progressValue)),
              ],
            ),
          );
        });
  }
}
