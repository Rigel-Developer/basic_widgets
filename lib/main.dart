import 'package:basic_widgets/config/router/app_router.dart';
import 'package:basic_widgets/config/theme/app_theme.dart';
import 'package:basic_widgets/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider);
    final selectedColorIndex = ref.watch(selectedColorProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Basic Widgets',
      theme: AppTheme(selectedColorIndex: selectedColorIndex, isDark: isDark)
          .getTheme(),
      debugShowCheckedModeBanner: false,
      // home: const HomeScreen(),
      // routes: {
      //   '/home': (context) => const HomeScreen(),
      //   '/buttons': (context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardsScreen(),
      // },
    );
  }
}
