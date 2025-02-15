import 'package:flutter/material.dart';

class toaster extends StatelessWidget {
  const toaster({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Center(child: Text('Toaster')),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/ToasterScreen');
            },
          ),
        ],
      ),
    );
  }
}
