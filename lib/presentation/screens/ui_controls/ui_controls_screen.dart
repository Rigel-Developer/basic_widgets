import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UI Controls'),
        ),
        body: _UiControlsView());
  }
}

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transporation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperMode = true;
  Transporation groupValue = Transporation.plane;

  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Switch List Tile'),
          subtitle: const Text('Switch List Tile Subtitle'),
          value: isDeveloperMode,
          onChanged: (value) {
            setState(() {
              isDeveloperMode = value;
            });
          },
        ),
        ExpansionTile(
          shape: const Border(),
          backgroundColor: Colors.yellowAccent,
          title: const Text('Expansion Tile'),
          subtitle: Text('$groupValue'),
          children: [
            RadioListTile(
              value: Transporation.car,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = Transporation.car;
                });
              },
              title: const Text('Car'),
              subtitle: const Text('Radio List Tile Subtitle'),
              secondary: const Icon(Icons.directions_car),
            ),
            RadioListTile(
              value: Transporation.plane,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = Transporation.plane;
                });
              },
              title: const Text('Plane'),
              subtitle: const Text('Radio List Tile Subtitle'),
              secondary: const Icon(Icons.airplanemode_active),
            ),
            RadioListTile(
              value: Transporation.boat,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = Transporation.boat;
                });
              },
              title: const Text('Boat'),
              subtitle: const Text('Radio List Tile Subtitle'),
              secondary: const Icon(Icons.directions_boat),
            ),
            RadioListTile(
              value: Transporation.submarine,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = Transporation.submarine;
                });
              },
              title: const Text('Submarine'),
              subtitle: const Text('Radio List Tile Subtitle'),
              secondary: const Icon(Icons.directions_subway),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Breakfast'),
          subtitle: const Text('Checkbox List Tile Subtitle'),
          value: wantsBreakfast,
          onChanged: (value) {
            print(value);
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Lunch'),
          subtitle: const Text('Checkbox List Tile Subtitle'),
          value: wantsLunch,
          onChanged: (value) {
            print(value);
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Dinner'),
          subtitle: const Text('Checkbox List Tile Subtitle'),
          value: wantsDinner,
          onChanged: (value) {
            print(value);
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
      ],
    );
  }
}
