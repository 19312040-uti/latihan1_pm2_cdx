import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan 1', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.cyan,
        ),
        body: Column(
          children: [
            Text('halo ios!'),
            Text('halo ios!'),
            Text('halo ios!'),
            Text('halo ios!'),
            Text('halo ios!'),
            Text('halo ios!'),
            Row(
              children: [
                Text('pagi ios! '),
                Text('pagi ios! '),
                Text('pagi ios! '),
                Text('pagi ios! '),
              ],
            ),
            Container(
              color: Colors.blue,
              height: 50,
              width: 300,
            )
          ],
        ),
      ),
    );
  }
}
