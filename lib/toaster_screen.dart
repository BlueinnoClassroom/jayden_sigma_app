import 'package:flutter/material.dart';
import 'package:sigma_app/route_drawer.dart';

class ToasterScreen extends StatelessWidget {
  const ToasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: RouteDrawer(),
      appBar: AppBar(
        title: Text('Toasters :3'),
      ),
    );
  }
}
