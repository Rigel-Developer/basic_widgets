import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {"elevation": 0.0, "label": "Elevation 0"},
  {"elevation": 1.0, "label": "Elevation 1"},
  {"elevation": 2.0, "label": "Elevation 2"},
  {"elevation": 3.0, "label": "Elevation 3"},
  {"elevation": 4.0, "label": "Elevation 4"},
  {"elevation": 5.0, "label": "Elevation 5"},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ...cards.map((card) {
            return _CardType1(
              elevation: card['elevation'],
              label: card['label'],
            );
          }),
          ...cards.map((card) {
            return _CardType2(
              elevation: card['elevation'],
              label: card['label'],
            );
          }),
          ...cards.map((card) {
            return _CardType3(
              elevation: card['elevation'],
              label: card['label'],
            );
          }),
          ...cards.map((card) {
            return _CardType4(
              elevation: card['elevation'],
              label: card['label'],
            );
          }),
          const SizedBox(height: 50.0)
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  const _CardType1({
    super.key,
    required this.elevation,
    required this.label,
  });

  final double elevation;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '$label - elevation',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  const _CardType2({
    super.key,
    required this.elevation,
    required this.label,
  });

  final double elevation;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(
          color: colors.outline,
          // width: 2.0,
        ),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '$label - outline',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  const _CardType3({
    super.key,
    required this.elevation,
    required this.label,
  });

  final double elevation;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '$label - Filled',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  const _CardType4({
    super.key,
    required this.elevation,
    required this.label,
  });

  final double elevation;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          //image from picsum
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            fit: BoxFit.cover,
            // width: double.infinity,
            height: 350.0,
          ),

          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
