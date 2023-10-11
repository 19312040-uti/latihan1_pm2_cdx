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
                for (var i = 0; i < 6; i++)
                Text('pagi magna! ')
              ],
            ),
            Container(
              color: Colors.blue,
              height: 50,
              width: 500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
                [for (var i = 0; i < 5; i++) Container(
                color: Colors.red,
                height: 30,
                width: 30,
                margin: EdgeInsets.all(10),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [for (var i = 0; i < 5; i++)
              Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.all(10),
                decoration:
                  new BoxDecoration(
                    color: Colors.cyan,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
