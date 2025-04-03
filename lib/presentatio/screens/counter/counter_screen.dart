import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_widgets_app/presentatio/providers/counter_provider.dart';
import 'package:mis_widgets_app/presentatio/providers/theme_provider.dart';

class CounterScreeen extends ConsumerWidget {
  static const String name = 'counter_screen';
  const CounterScreeen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkmode = ref.watch(isDarkmodeProvider);
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
              ref.read(isDarkmodeProvider.notifier).update((state) => !state);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Valor: $clickCounter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).update((state) => state + 1);
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
