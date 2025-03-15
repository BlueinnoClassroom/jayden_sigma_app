import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigma_app/data/base1.dart';
import 'package:sigma_app/data/pokemon-card.dart';
import 'package:sigma_app/data/xy7.dart';
import 'package:sigma_app/widgets/route_drawer.dart';

class PkmTcgScreen extends StatefulWidget {
  const PkmTcgScreen({super.key});

  @override
  State<PkmTcgScreen> createState() => _PkmTcgScreenState();
}

class _PkmTcgScreenState extends State<PkmTcgScreen> {
  final controller = ConfettiController(duration: Duration(seconds: 1));
  // ..play();

  final _allCards = <PokemonCard>[];
  final _drawResults = <PokemonCard>[];

  final rarities = [
    ('Common', 60, Colors.black),
    ('Uncommon', 30, Colors.black),
    ('Rare', 9, Colors.green[500]),
    ('Rare Holo', 0.7, Colors.yellow[800]),
    ('Rare Ultra', 0.29889, Colors.orange[900]),
    ('Rare Holo EX', 0.001, Colors.red[900]),
    ('Rare BREAK', 0.0001, Colors.blue[900]),
    ('Rare Secret', 0.00001, Colors.purple[600]),
  ];

  @override
  void initState() {
    super.initState();

    _allCards.addAll(base1.map((e) => PokemonCard.fromJson(e)));
    _allCards.addAll(xy7.map((e) => PokemonCard.fromJson(e)));
    _allCards.shuffle();

    _drawCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: RouteDrawer(),
      // appBar: AppBar(
      //   title: Text('PKM TCG'),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.refresh),
      //       onPressed: () => _drawCard(),
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: _drawResults.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 245,
              childAspectRatio: 245 / (342 + 45),
            ),
            itemBuilder: (context, index) {
              // final raw = _drawResults[index];
              // final pkmCard = PokemonCard.fromJson(raw);
              final pkmCard = _drawResults[index];
              final image = pkmCard.images?.small;

              if (image == null) return Placeholder();

              final result = rarities.firstWhere(
                (e) => e.$1 == pkmCard.rarity,
                orElse: () => rarities.last,
              );

              return Column(
                children: [
                  Text(
                    '${result.$1} (${result.$2}%)',
                    style: GoogleFonts.getFont(
                      'Press Start 2P',
                      fontSize: 15,
                      color: result.$3,
                    ),
                  ),
                  Card(child: Image.network(image))
                      .animate()
                      .fadeIn(delay: 0.2.seconds)
                      .flipH(),
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
              blastDirection: 0.7,
              emissionFrequency: 1,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: ConfettiWidget(
              confettiController: controller,
              shouldLoop: false,
              blastDirection: 1.5 / 2 * pi,
              emissionFrequency: 1,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: controller,
              shouldLoop: false,
              blastDirection: pi / 2,
              emissionFrequency: 1,
            ),
          ),
        ],
      ),
    );
  }

  void _drawCard() {
    _drawResults.clear();

    for (var i = 0; i < 9; i++) {
      final random = Random().nextDouble() * 100;
      var cumulative = 0.0;
      var index = 0;

      for (final rarity in rarities) {
        cumulative += rarity.$2;
        if (random <= cumulative) {
          index = rarities.indexOf(rarity);
          break;
        }
      }
      final rar = rarities[index];
      final pool = _allCards.where((e) => e.rarity == rar.$1).toList();
      pool.shuffle();
      _drawResults.add(pool.first);
    }

    final hasRare =
        _drawResults.any((e) => e.rarity?.contains('Rare Holo EX') ?? false);
    if (hasRare) controller.play();

    setState(() {}); // refresh the page
  }
}

// chances of geting rare holo ex is 0.001 confetti will show if rare holo ex
