import 'package:basic_widgets/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final int value = ref.watch(counterProvider);
    // final bool isDark = ref.watch(themeProvider);
    final bool isDark = ref.watch(themeNotifierProvider).isDark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: isDark
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
            onPressed: () {
              // ref.read(counterProvider.notifier).reset();
              // ref.read(themeProvider.notifier).update((value) => !value);
              ref.read(themeNotifierProvider.notifier).toogleDarkMode();
            },
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colorList = ref.watch(colorListProvider);
    // final colorIndex = ref.watch(selectedColorProvider);
    final colorIndex = ref.watch(themeNotifierProvider).selectedColorIndex;

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (context, index) {
        final color = colorList[index];

        return RadioListTile(
          title: Text(
            'Color $index',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: colorIndex,
          onChanged: (value) {
            // ref.read(selectedColorProvider.notifier).state = value!;
            ref.read(themeNotifierProvider.notifier).updateColor(value!);
          },
        );
      },
    );
  }
}
