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
          title: const Text('Latihan 1', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.cyan,
        ),
        body: Column(
          children: [
            for (var i = 0; i < 6; i++)
            const Text("Pagi Dunia!"),
            Row(
              children: [
                for (var i = 0; i < 6; i++)
                const Text('pagi magna! ')
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
                margin: const EdgeInsets.all(10),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [for (var i = 0; i < 5; i++)
              Container(
                height: 30,
                width: 30,
                margin: const EdgeInsets.all(10),
                decoration:
                  const BoxDecoration(
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
