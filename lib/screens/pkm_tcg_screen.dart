import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:sigma_app/data/base1.dart';
import 'package:sigma_app/data/pokemon-card.dart';
import 'package:sigma_app/widgets/route_drawer.dart';

class PkmTcgScreen extends StatefulWidget {
  const PkmTcgScreen({super.key});

  @override
  State<PkmTcgScreen> createState() => _PkmTcgScreenState();
}

class _PkmTcgScreenState extends State<PkmTcgScreen> {
  final controller = ConfettiController(duration: Duration(seconds: 2))..play();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: RouteDrawer(),
      appBar: AppBar(
        title: Text('PKM TCG'),
      ),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: base1.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 245,
              childAspectRatio: 245 / 342,
            ),
            itemBuilder: (context, index) {
              final raw = base1[index];
              final pkmCard = PokemonCard.fromJson(raw);
              final image = pkmCard.images?.small;

              if (image == null) return Placeholder();

              return Card(child: Image.network(image));
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
