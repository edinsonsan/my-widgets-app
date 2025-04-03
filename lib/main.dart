import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_widgets_app/config/router/app_router.dart';
import 'package:mis_widgets_app/presentatio/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final int selectedColor = ref.watch(selectedColorProvider);
    // final isDrakmode = ref.watch(isDarkmodeProvider);

    final appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Widgets Flutter',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}
