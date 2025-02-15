import 'package:flutter/material.dart';

class RouteDrawer extends StatelessWidget {
  const RouteDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Pokedex'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/pkm');
            },
          ),
          ListTile(
            title: Text('Pokemon-TCG'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/pkm-tcg');
            },
          ),
          ListTile(
            title: Text('dont click this'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/???');
            },
          ),
        ],
      ),
    );
  }
}
