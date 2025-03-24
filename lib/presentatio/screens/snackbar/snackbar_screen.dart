import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Esto es un Snackbar'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialogo(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: const Text('¿Estas Seguro?'),

            content: const Text(
              'Qui cupidatat esse dolor enim est ea cupidatat aute sunt laboris nostrud exercitation sunt labore. Deserunt aute reprehenderit ullamco duis exercitation et sunt nostrud veniam veniam veniam. Laborum commodo ea exercitation duis dolor quis ex amet. Consectetur ex aliquip tempor cillum. Nisi id occaecat id elit cillum occaecat aliqua sit veniam. Do laboris ipsum eiusmod enim cupidatat excepteur est minim occaecat aliqua.',
            ),
            icon: const Icon(Icons.warning_amber_outlined),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Cancelar'),
              ),
              FilledButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('Aceptar'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar y Diálogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Cupidatat non nostrud ex esse. Sit enim magna tempor dolore aute mollit adipisicing. Exercitation magna non exercitation labore mollit nisi laborum culpa non ut fugiat enim aute quis. Sit irure sunt Lorem esse deserunt labore labore aute commodo.',
                    ),
                  ],
                );
              },
              child: const Text('Licencias Usadas'),
            ),

            FilledButton.tonal(
              onPressed: () {
                openDialogo(context);
              },
              child: const Text('Mostrar Dialogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Snackbar'),
        onPressed: () => showCustomSnackbar(context),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
