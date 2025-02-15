import 'package:flutter/material.dart';
import 'package:sigma_app/widgets/route_drawer.dart';

class PkmTcgScreen extends StatelessWidget {
  const PkmTcgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: RouteDrawer(),
      appBar: AppBar(
        title: Text('PKM TCG'),
      ),
    );
  }
}
