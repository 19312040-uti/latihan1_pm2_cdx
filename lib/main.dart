import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: formInput()
    );
  }
}

class formInput extends StatefulWidget {
  const formInput({super.key});

  @override
  State<formInput> createState() => _formInputState();
}

class _formInputState extends State<formInput> {
 
  String? _jk;
  void pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  List<String> agama = [
    "Islam",
    "Kristen Katholik",
    "Kristen Protestan",
    "Hindu",
    "Buddha",
    "Lainnya"
  ];

  String _agama = "Islam";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text("Input biodata"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Nama Lengkap",
                labelText: "Nama Lengkap",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              maxLength: 100,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Alamat",
                labelText: "Alamat",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RadioListTile(
              value: "Laki-Laki", 
              groupValue: _jk, 
              title: Text("Laki-Laki"),
              onChanged: (String? value) {
                pilihJk(value!);
              },
              activeColor: Colors.teal,
              subtitle: Text("Pilih ini laki-laki"),
            ),
            RadioListTile(
              value: "Perempuan", 
              groupValue: _jk, 
              title: Text("Perempuan"),
              onChanged: (String? value) {
                pilihJk(value!);
              },
              activeColor: Colors.teal,
              subtitle: Text("Pilih ini perempuan"),
            ),
            DropdownButton(
              value: _agama,
              items: agama.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _agama = newValue!;
                });
              },
            ),

          ],
        ),
      ),
    );
  }
} 
