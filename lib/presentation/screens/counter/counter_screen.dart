import 'package:basic_widgets/presentation/providers/counter_provider.dart';
import 'package:basic_widgets/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int value = ref.watch(counterProvider);
    final bool isDark = ref.watch(themeProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
          actions: [
            IconButton(
              icon: isDark
                  ? const Icon(Icons.light_mode_outlined)
                  : const Icon(Icons.dark_mode_outlined),
              onPressed: () {
                // ref.read(counterProvider.notifier).reset();
                ref.read(themeProvider.notifier).update((value) => !value);
              },
            ),
          ],
        ),
        body: Center(
          child: Text(
            'Valor $value',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed logic here!
            // ref.read(counterProvider.notifier).state++;

            //using update
            ref.read(counterProvider.notifier).update((value) => value + 1);
          },
          child: const Icon(Icons.add),
        ));
  }
}
