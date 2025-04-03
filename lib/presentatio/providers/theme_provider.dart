import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

// Un Simple Boolean
final isDarkmodeProvider = StateProvider<bool>((ref) => false);

// Un simple Entero
final selectedColorProvider = StateProvider<int>((ref) => 0);

//Un Objeto de tipo AppTheme (Custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

//Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = Estado = new AppTheme();
  ThemeNotifier() : super(AppTheme());
  void toggleDarkMode() {
    state = state.copyWith(isDrakmode: !state.isDarkmode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
