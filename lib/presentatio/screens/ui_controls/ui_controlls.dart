import 'package:flutter/material.dart';

class UiControllsScreen extends StatelessWidget {
  static const String name = 'ui_controlls_screen';
  const UiControllsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controles'),
        actions: [const _SoloSwitch(), const SizedBox(width: 20)],
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { carro, avion, bote, submarino, tren }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.carro;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles Adicionales'),
          value: isDeveloper,
          onChanged:
              (value) => setState(() {
                isDeveloper = !isDeveloper;
              }),
        ),

        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('En Carro'),
              subtitle: const Text('Viajar por carro'),
              value: Transportation.carro,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.carro;
                  }),
            ),

            RadioListTile(
              title: const Text('En Avion'),
              subtitle: const Text('Viajar por Avion'),
              value: Transportation.avion,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.avion;
                  }),
            ),

            RadioListTile(
              title: const Text('En Bote'),
              subtitle: const Text('Viajar por Bote'),
              value: Transportation.bote,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.bote;
                  }),
            ),

            RadioListTile(
              title: const Text('En Submarino'),
              subtitle: const Text('Viajar por Submarino'),
              value: Transportation.submarino,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.submarino;
                  }),
            ),

            RadioListTile(
              title: const Text('En Tren'),
              subtitle: const Text('Viajar por Tren'),
              value: Transportation.tren,
              groupValue: selectedTransportation,
              onChanged:
                  (value) => setState(() {
                    selectedTransportation = Transportation.tren;
                  }),
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) {
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),

        CheckboxListTile(
          title: const Text('Almuerzo?'),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),

        CheckboxListTile(
          title: const Text('Cena?'),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
      ],
    );
  }
}

class _SoloSwitch extends StatefulWidget {
  const _SoloSwitch();

  @override
  State<_SoloSwitch> createState() => _SoloSwitchState();
}

class _SoloSwitchState extends State<_SoloSwitch> {
  bool soloSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: soloSwitch,
      onChanged:
          (value) => setState(() {
            soloSwitch = !soloSwitch;
          }),
    );
  }
}
