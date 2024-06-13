import 'package:basic_widgets/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider((ref) => false);

//listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

//un simple int
final selectedColorProvider = StateProvider((ref) => 0);

//un objeto de tipo appTheme custom
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});

//controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toogleDarkMode() {
    state = state.copyWith(isDark: !state.isDark);
  }

  void updateColor(int index) {
    state = state.copyWith(selectedColorIndex: index);
  }
}
