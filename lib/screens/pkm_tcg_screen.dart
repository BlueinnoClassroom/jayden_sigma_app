import 'dart:ffi';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
  final controller = ConfettiController(duration: Duration(seconds: 1))
  // ..play();

  final _allCards = <PokemonCard>[];
  final _drawResults = <PokemonCard>[];

  @override
  void initState() {
    super.initState();

    _allCards.addAll(base1.map((e) => PokemonCard.fromJson(e)));
    _allCards.addAll(xy7.map((e) => PokemonCard.fromJson(e)));
    _allCards.shuffle();

    _drawResults.addAll(_allCards.take(8));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: RouteDrawer(),
      appBar: AppBar(
        title: Text('PKM TCG'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
                            final rarities = [
                ('Common', 60),
                ('Uncommon', 30),
                ('Rare', 9),
                ('Rare Holo EX', 1),
              ];
              final random = Random().nextDouble() * 100;
              var cumulative = 0;
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
              _drawResults.clear();
              pool.shuffle();
              _drawResults.addAll(pool.take(8));


              setState(() {}); // refresh the page
              _drawResults.clear();
              _allCards.shuffle();
              _drawResults.addAll(_allCards.take(8));

              final hasRare =
                  _drawResults.any((e) => e.rarity?.contains('Rare') ?? false);
              if (hasRare) controller.play();
              setState(() {});
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: _drawResults.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 245,
              childAspectRatio: 245 / 342,
            ),
            itemBuilder: (context, index) {
              // final raw = _drawResults[index];
              // final pkmCard = PokemonCard.fromJson(raw);
              final pkmCard = _drawResults[index];
              final image = pkmCard.images?.small;

              if (image == null) return Placeholder();

              return Card(child: Image.network(image))
                  .animate()
                  .fadeIn(delay: 0.2.seconds)
                  .flipH();
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
}
