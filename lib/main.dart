import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ super.key });

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  TextEditingController var_tanggal = TextEditingController();

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
  void dispose() {
    var_tanggal.dispose();
    super.dispose();
  }

  String formatDate(DateTime date) {
    return DateFormat("dd-MM-yyyy").format(date);
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: selectedDate, 
      firstDate: DateTime(DateTime.now().year - 100), 
      lastDate: DateTime(DateTime.now().year + 100),
      builder: (context, child) {
        return Theme(data: ThemeData.light().copyWith(
          primaryColor: Colors.teal,
          hintColor: Colors.teal,
          colorScheme: const ColorScheme.light(primary: Colors.teal)
        ), 
        child: child!
        );
      },
    );
    if(picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        var_tanggal.text = formatDate(selectedDate).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list),
        title: const Text("Input biodata"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
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
            const SizedBox(
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
            const SizedBox(
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
            const SizedBox(
              height: 10,
            ),
            RadioListTile(
              value: "Laki-Laki", 
              groupValue: _jk, 
              title: const Text("Laki-Laki"),
              onChanged: (String? value) {
                pilihJk(value!);
              },
              activeColor: Colors.teal,
              subtitle: const Text("Pilih ini laki-laki"),
            ),
            RadioListTile(
              value: "Perempuan", 
              groupValue: _jk, 
              title: const Text("Perempuan"),
              onChanged: (String? value) {
                pilihJk(value!);
              },
              activeColor: Colors.teal,
              subtitle: const Text("Pilih ini perempuan"),
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
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: var_tanggal,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Tanggal Lahir",
                labelText: "Tanggal Lahir",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  onPressed: () => _selectedDate(context), 
                  icon: const Icon(Icons.calendar_today)
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
