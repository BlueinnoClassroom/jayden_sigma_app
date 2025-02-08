import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('What Is A Pavlova'),
          titleTextStyle: TextStyle(fontSize: 32),
          centerTitle: true,
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Text('Line $index');
          },
        ),
      ),
    );
  }
}

class Lesson1 extends StatelessWidget {
  const Lesson1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 80,
          child: Row(
            children: [
              Icon(Icons.person, size: 62),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Jayden Tang'), Text('student')],
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text('Pavlovas'),
                    Text(
                        'Pavlova is a meringue-based dessert yada yada yada...'),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Spacer(),
                        Text('170 reviews')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.kitchen),
                        Icon(Icons.timelapse),
                        Icon(Icons.food_bank)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('PREP:'),
                        Text('COOK:'),
                        Text('FEEDS:'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('25 mins:'),
                        Text('1 hr:'),
                        Text('4-6:'),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Placeholder(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
