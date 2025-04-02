import 'package:flutter/material.dart';

class CounterScreeen extends StatelessWidget {
  static const String name = 'counter_screen';
  const CounterScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla Contador')),
      body: Center(child: Text('Valor: 10', style: Theme.of(context).textTheme.titleLarge,)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
