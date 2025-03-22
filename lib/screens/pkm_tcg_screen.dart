import 'dart:convert';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/pokemon-card.dart';

class PkmTcgScreen extends StatefulWidget {
  const PkmTcgScreen({
    super.key,
    this.packPaths,
    this.onDraw,
  });

  final List<String>? packPaths;
  final void Function(double totalValue)? onDraw;

  @override
  State<PkmTcgScreen> createState() => _PkmTcgScreenState();
}

class _PkmTcgScreenState extends State<PkmTcgScreen> {
  final controller = ConfettiController(duration: Duration(seconds: 2));
  // ..play();

  final _allCards = <PokemonCard>[];
  final _drawResults = <PokemonCard>[];

  final rareProbs = {
    'Amazing Rare': 1.02,
    'Shiny Ultra Rare': 0.02,
    'Rare Ultra': 0.03,
    'Rare ACE': 0.02,
    'Rare Rainbow': 0.02,
    'Rare Shiny GX': 0.02,
    'Rare Holo VSTAR': 0.03,
    'Rare Shiny': 0.02,
    'Double Rare': 0.04,
    'ACE SPEC Rare': 0.02,
    'Promo': 0.03,
    'Classic Collection': 0.03,
    'Rare Secret': 0.02,
    'Rare Holo Star': 0.02,
    'Rare BREAK': 0.02,
    'Rare Prism Star': 0.02,
    'Ultra Rare': 0.04,
    'Rare Holo LV.X': 0.02,
    'Hyper Rare': 0.1,
    'Rare Prime': 0.02,
    'Rare Shining': 0.02,
    'Trainer Gallery Rare Holo': 0.02,
    'Radiant Rare': 0.2,
    'Rare': 1.0,
    'Rare Holo VMAX': 0.02,
    'Rare Holo EX': 0.02,
    'Special Illustration Rare': 0.01,
    'Illustration Rare': 0.03,
    'Shiny Rare': 0.02,
    'Rare Holo': 0.04,
    'Rare Holo GX': 0.02,
    'Rare Holo V': 0.02,
    'LEGEND': 50,
  };

  final sellingPriceList = {
    'Amazing Rare': 100.00,
    'Shiny Ultra Rare': 80.00,
    'Rare Ultra': 60.00,
    'Rare ACE': 70.00,
    'Rare Rainbow': 90.00,
    'Rare Shiny GX': 80.00,
    'Rare Holo VSTAR': 6.50,
    'Rare Shiny': 50.00,
    'Double Rare': 40.00,
    'ACE SPEC Rare': 7.50,
    'Promo': 5.50,
    'Classic Collection': 60.00,
    'Rare Secret': 80.00,
    'Rare Holo Star': 5.50,
    'Rare BREAK': 50.00,
    'Rare Prism Star': 50.00,
    'Ultra Rare': 70.00,
    'Rare Holo LV.X': 60.00,
    'Hyper Rare': 150.00,
    'Rare Prime': 5.50,
    'Rare Shining': 50.00,
    'Trainer Gallery Rare Holo': 60.00,
    'Radiant Rare': 50.00,
    'Rare': 1.00,
    'Rare Holo VMAX': 6.50,
    'Rare Holo EX': 50.00,
    'Special Illustration Rare': 120.00,
    'Illustration Rare': 70.00,
    'Shiny Rare': 50.00,
    'Rare Holo': 4.50,
    'Rare Holo GX': 5.50,
    'Rare Holo V': 50.00,
    'LEGEND': 2000.00,
  };

  @override
  void initState() {
    super.initState();

    final paths = widget.packPaths ?? ['base1'];
    final futures = paths.map((e) => rootBundle.loadString('tcg_data/$e.json'));

    Future.wait(futures).then((files) {
      final allCards = files.map((fileStr) {
        final cards = jsonDecode(fileStr) as List;
        return cards.map((e) => PokemonCard.fromJson(e));
      }).expand((e) => e);

      _allCards.addAll(allCards);
      _allCards.shuffle();

      _drawCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('PKM TCG'),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.refresh),
      //       onPressed: () => _drawCard(),
      //     ),
      //   ],
      // ),
      // drawer: RouteDrawer(),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: _drawResults.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 245,
              childAspectRatio: 245 / (342 + 20),
            ),
            itemBuilder: (context, index) {
              final pkmCard = _drawResults[index];
              final image = pkmCard.images?.small;

              if (image == null) return Placeholder();

              final rarity = pkmCard.rarity;
              // final color = rareColors[rarity];
              final prob = rareProbs[rarity];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        rarity ?? 'Unknown',
                        style: GoogleFonts.getFont(
                          'Press Start 2P',
                          fontSize: 8,
                          // color: color,
                        ),
                      ),
                      if (prob != null)
                        Text(
                          '($prob%)',
                          style: GoogleFonts.getFont(
                            'Press Start 2P',
                            fontSize: 8,
                            // color: color,
                          ),
                        ),
                    ],
                  ),
                  Card(child: Image.network(image)).animate().fadeIn(),
                ],
              );
            },
          ),
          Positioned(
            left: 0,
            top: 0,
            child: ConfettiWidget(
              confettiController: controller,
              shouldLoop: false,
              blastDirection: 0.785, // 45º
              emissionFrequency: 0.1,
              numberOfParticles: 50,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: ConfettiWidget(
              confettiController: controller,
              shouldLoop: false,
              blastDirection: 2.356, // 135º
              emissionFrequency: 0.1,
              numberOfParticles: 50,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: controller,
              shouldLoop: false,
              blastDirection: pi / 2,
              emissionFrequency: 0.1,
              numberOfParticles: 50,
            ),
          ),
        ],
      ),
    );
  }

  void _drawCard() {
    _drawResults.clear();

    final availableRares = _allCards
        .map((e) => e.rarity)
        .toSet()
        .where((e) => e != null && e != 'Common' && e != 'Uncommon');

    final rarities = <String, num>{};
    var remaining = 100.0;
    for (final r in availableRares) {
      rarities[r!] = rareProbs[r]!;
      remaining -= rareProbs[r]!;
    }
    rarities['Uncommon'] = remaining * 0.20;
    rarities['Common'] = remaining * 0.80;

    for (var i = 0; i < 15; i++) {
      final random = Random().nextDouble() * 100;
      var cumulative = 0.0;
      var rarity = '';

      for (final entry in rarities.entries) {
        final prob = entry.value;

        cumulative += prob;
        if (random <= cumulative) {
          rarity = entry.key;
          break;
        }
      }

      final filtered = _allCards.where((e) => e.rarity == rarity).toList();

      filtered.shuffle();
      _drawResults.addAll(filtered.take(1));
    }

    final hasRare = _drawResults.any((e) =>
        e.rarity != null && e.rarity != 'Common' && e.rarity != 'Uncommon');
    if (hasRare) controller.play();

    var totalValue = 0.0;
    for (final card in _drawResults) {
      totalValue += sellingPriceList[card.rarity] ?? 0;
    }
    widget.onDraw?.call(totalValue);

    setState(() {}); // refresh the page
  }
}
