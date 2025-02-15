import 'package:flutter/material.dart';

class Toaster extends StatelessWidget {
  const Toaster({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Center(child: Text('i told you not to click this')),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/ToasterScreen');
            },
          ),
        ],
      ),
    );
  }
}
