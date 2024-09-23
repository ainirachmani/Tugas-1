import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Penjumlahan extends StatefulWidget {
  const Penjumlahan({super.key});

  @override
  _PenjumlahanState createState() => _PenjumlahanState();
}

class _PenjumlahanState extends State<Penjumlahan> {
  late TextEditingController _controllerAngka1;
  late TextEditingController _controllerAngka2;
  late TextEditingController _controllerAngka3;
  late TextEditingController _controllerAngka4;

  double _tambah = 0;
  double _kurang = 0;

  @override
  void initState() {
    super.initState();
    _controllerAngka1 = TextEditingController();
    _controllerAngka2 = TextEditingController();
    _controllerAngka3 = TextEditingController();
    _controllerAngka4 = TextEditingController();
  }

  @override
  void dispose() {
    _controllerAngka1.dispose();
    _controllerAngka2.dispose();
    _controllerAngka3.dispose();
    _controllerAngka4.dispose();
    super.dispose();
  }

  void _hitungTambah() {
    double angka1 = double.tryParse(_controllerAngka1.text) ?? 0;
    double angka2 = double.tryParse(_controllerAngka2.text) ?? 0;

    setState(() {
      _tambah = angka1 + angka2;
    });
  }

  void _hitungKurang() {
    double Angka3 = double.tryParse(_controllerAngka3.text) ?? 0;
    double Angka4 = double.tryParse(_controllerAngka4.text) ?? 0;

    setState(() {
      _kurang = Angka3 - Angka4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 18),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Penjumlahan'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 15),
              _buildTextField(_controllerAngka1, 'Masukkan Angka'),
              const SizedBox(height: 15),
              _buildTextField(_controllerAngka2, 'Masukkan Angka'),
              const SizedBox(height: 20),
              Text(
                'Tambah: $_tambah',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.blue),
              ),
              const SizedBox(height: 10),
              _buildButton('Hitung Tambah', _hitungTambah),
              const SizedBox(height: 20),
              _buildTextField(_controllerAngka3, 'Masukkan Angka'),
              const SizedBox(height: 20),
              _buildTextField(_controllerAngka4, 'Masukkan Angka'),
              const SizedBox(height: 20),
              _buildButton('Hitung Kurang', _hitungKurang),
              const SizedBox(height: 20),
              Text(
                'Kurang: $_kurang',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        ],
        decoration: InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
