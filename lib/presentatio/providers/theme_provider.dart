import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

// Un Simple Boolean
final isDarkmodeProvider = StateProvider<bool>((ref) => false);

// Un simple Entero
final selectedColorProvider = StateProvider<int>((ref) => 0);
