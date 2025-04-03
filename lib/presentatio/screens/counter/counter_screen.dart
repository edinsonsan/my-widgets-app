import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mis_widgets_app/presentatio/providers/counter_provider.dart';
import 'package:mis_widgets_app/presentatio/providers/theme_provider.dart';

class CounterScreeen extends ConsumerWidget {
  static const String name = 'counter_screen';
  const CounterScreeen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    // final bool isDarkmode = ref.watch(isDarkmodeProvider);
    final bool isDarkmode = ref.watch(themeNotifierProvider).isDarkmode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Contador'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            // icon: const Icon(Icons.light_mode_outlined),
            onPressed: () {
              // ref.read(isDarkmodeProvider.notifier).update((state) => !state);
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              'Click${clickCounter == 1 ? '' : 's'}',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton.filledTonal(
            onPressed: () {
              // ref.read(counterProvider.notifier).update((state) => state + 1);
              ref.read(counterProvider.notifier).state++;
            },
            icon: const Icon(Icons.add),
          ),

          const SizedBox(height: 10),

          IconButton.filledTonal(
            onPressed: () {
              // ref.read(counterProvider.notifier).update((state) => state + 1);

              if (clickCounter <= 0) return;
              ref.read(counterProvider.notifier).state--;
            },
            icon: const Icon(Icons.exposure_minus_1_outlined),
          ),

          const SizedBox(height: 10),

          IconButton.filledTonal(
            onPressed: () {
              // ref.read(counterProvider.notifier).update((state) => state + 1);
              ref.read(counterProvider.notifier).state = 0;
            },
            icon: const Icon(Icons.refresh_outlined),
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            onPressed: () {
              context.pop();
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ],
      ),
    );
  }
}
